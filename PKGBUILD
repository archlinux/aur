# Maintainer: Timo Kramer <fw minus aur at timokramer dot de>

pkgname=mullvad-vpn-cli
pkgver=2020.3
pkgrel=1
pkgdesc="The Mullvad VPN client cli"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('nss')
makedepends=('git' 'cargo' 'go-pie' 'jq')
conflicts=('mullvad-vpn')
install="${pkgname}.install"
_commit='90b0c06b59a0b9d6cda69924377335f39854b216'
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=${pkgver}?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}?signed"
        'override.conf'
        'settings.json.sample')
sha256sums=('SKIP'
            'SKIP'
            'ed978958f86da9acbce950a832491b140a350c594e2446b99a7c397a98731316'
            '2729b6842bff30eb3dae23a2133054ab1cfe9312a4fc9baa8433a81e9bafd362')
validpgpkeys=('EA0A77BF9E115615FC3BD8BC7653B940E494FE87'
              # Linus Färnstrand (code signing key) <linus at mullvad dot net>
              '8339C7D2942EB854E3F27CE5AEE9DECFD582E984')
              # David Lönnhager (code signing) <david dot l at mullvad dot net>

prepare() {
    # Point the submodule to our local copy
    cd "${srcdir}/mullvadvpn-app"
    git submodule init dist-assets/binaries
    git config submodule.mullvadvpn-app-binaries.url \
        "${srcdir}/mullvadvpn-app-binaries"
    git submodule update
}

build() {
    # Build wireguard-go
    cd "$srcdir/mullvadvpn-app/wireguard/wireguard-go"
    mkdir -p "../../build/lib/$arch-unknown-linux-gnu"
    go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -v -o "../../build/lib/$arch-unknown-linux-gnu"/libwg.a \
        -buildmode c-archive

    cd "${srcdir}/mullvadvpn-app"

    # Remove old Rust build artifacts
    cargo clean --release --locked

    # Build mullvad-daemon
    cargo build --release --locked

    # Copy binaries for packaging
    cp -v dist-assets/binaries/x86_64-unknown-linux-gnu/{openvpn,sslocal} dist-assets/
    binaries=(mullvad
              mullvad-daemon
              mullvad-problem-report
              libtalpid_openvpn_plugin.so)
    for binary in ${binaries[*]}; do
        cp target/release/${binary} dist-assets/${binary}
    done

    # Update relays.json
    curl --request POST \
         --fail \
         --header "Content-Type: application/json" \
         --data '{"jsonrpc": "2.0", "id": "0", "method": "relay_list_v3"}' \
         https://api.mullvad.net/rpc/ | jq --indent 4 '.result' > ../relays.json
}

check() {
    cd "${srcdir}/mullvadvpn-app"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/mullvadvpn-app"

    # Install main files
    install --verbose --directory --mode=755 "${pkgdir}/opt/mullvad-vpn-cli"
    cp -av dist-assets/* "${pkgdir}/opt/mullvad-vpn-cli"

    # Install daemon service
    install --verbose -D --mode=644 dist-assets/linux/mullvad-daemon.service -t \
        "${pkgdir}/usr/lib/systemd/system"

    # Install override for daemon
    install --verbose -D --mode=644 "${srcdir}/override.conf" -t \
        "${pkgdir}/etc/systemd/system/mullvad-daemon.service.d"

    # Install CLI binary
    install --verbose -D --mode=755 target/release/mullvad -t "${pkgdir}/usr/bin"

    # Install settings.json
    install --verbose -D --mode=644 "${srcdir}/settings.json.sample" -t "${pkgdir}/etc/mullvad-vpn"

    # Install relays.json
    install --verbose -D --mode=644 "${srcdir}/relays.json" -t "${pkgdir}/var/cache/mullvad-vpn"

    # Install license
    install --verbose -D --mode=644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
