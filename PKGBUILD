# Maintainer: Timo Kramer <fw minus aur at timokramer dot de>

pkgname=mullvad-vpn-cli
pkgver=2020.5
pkgrel=1
pkgdesc="The Mullvad VPN client cli"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('nss')
makedepends=('git' 'rust' 'go')
conflicts=('mullvad-vpn')
install="${pkgname}.install"
_commit='f9c55513f372de96223fad3ab6bd2aa78d517387'
source=("git+https://github.com/mullvad/mullvadvpn-app.git#tag=${pkgver}?signed"
        "git+https://github.com/mullvad/mullvadvpn-app-binaries.git#commit=${_commit}?signed"
        'override.conf'
        'settings.json.sample')
sha256sums=('SKIP'
            'SKIP'
            'ed978958f86da9acbce950a832491b140a350c594e2446b99a7c397a98731316'
            '2729b6842bff30eb3dae23a2133054ab1cfe9312a4fc9baa8433a81e9bafd362')
validpgpkeys=('EA0A77BF9E115615FC3BD8BC7653B940E494FE87')
              # Linus Färnstrand (code signing key) <linus at mullvad dot net>

prepare() {
    # Point the submodule to our local copy
    cd "${srcdir}/mullvadvpn-app"
    git submodule init dist-assets/binaries
    git config submodule.mullvadvpn-app-binaries.url "${srcdir}/mullvadvpn-app-binaries"
    git submodule update

    export GOPATH="$srcdir/gopath"
    go clean -modcache

    mkdir -p dist-assets/shell-completions
}

build() {
    # Compile wireguard-go
    cd "$srcdir/mullvadvpn-app/wireguard/libwg"
    mkdir -p "../../build/lib/$arch-unknown-linux-gnu"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -o "../../build/lib/$arch-unknown-linux-gnu"/libwg.a -buildmode c-archive

    go clean -modcache

    cd "${srcdir}/mullvadvpn-app"

    echo "Removing old Rust build artifacts"
    cargo clean

    # Build mullvad-daemon
    cargo build --release --locked

    # Copy binaries for packaging
    cp -v dist-assets/binaries/x86_64-unknown-linux-gnu/{openvpn,sslocal} dist-assets/
    binaries=(mullvad
              mullvad-daemon
              mullvad-problem-report
              mullvad-setup
              mullvad-exclude
              libtalpid_openvpn_plugin.so)
    for binary in ${binaries[*]}; do
        cp target/release/${binary} dist-assets/${binary}
    done

    # Update relays.json
    cargo run -p mullvad-rpc --bin relay_list > dist-assets/relays.json

    # Shell completions
    cd mullvad-cli
    for sh in bash zsh; do
        echo "Generating shell completion script for $sh..."
        cargo run --release --locked --features shell-completions -- \
            shell-completions "$sh" ../dist-assets/shell-completions/
    done
}

package() {
    cd "${srcdir}/mullvadvpn-app"

    # Install main files
    install --verbose --directory --mode=755 "${pkgdir}/opt/mullvad-vpn-cli"
    cp -rav dist-assets/* "${pkgdir}/opt/mullvad-vpn-cli"

    # Install daemon service
    install --verbose -D --mode=644 dist-assets/linux/mullvad-daemon.service -t \
        "${pkgdir}/usr/lib/systemd/system"

    # Install override for daemon
    install --verbose -D --mode=644 "${srcdir}/override.conf" -t \
        "${pkgdir}/etc/systemd/system/mullvad-daemon.service.d"

    # Install CLI binary
    install --verbose -D --mode=755 target/release/mullvad -t "${pkgdir}/usr/bin"

    # Install CLI exclude binary
    install --verbose -D --mode=755 target/release/mullvad-exclude -t "${pkgdir}/usr/bin"

    # Install shell completion zsh
    install --verbose -D --mode=644 dist-assets/shell-completions/_mullvad -t \
        "${pkgdir}/usr/share/zsh/site-functions"

    # Install shell completion bash
    install --verbose -D --mode=644 dist-assets/shell-completions/mullvad.bash -t \
        "${pkgdir}/usr/share/bash-completion/completions/mullvad"

    # Install settings.json
    install --verbose -D --mode=644 "${srcdir}/settings.json.sample" -t "${pkgdir}/etc/mullvad-vpn"

    # Install license
    install --verbose -D --mode=644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
