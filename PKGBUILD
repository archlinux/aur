# Maintainer: Timo Kramer <fw minus aur at timokramer dot de>

pkgname=mullvad-vpn-cli
pkgver=2019.10
pkgrel=1
pkgdesc="The Mullvad VPN client cli"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('nss')
makedepends=('git' 'cargo')
conflicts=('mullvad-vpn')
install="$pkgname.install"
_commit='0c1a0aca41492fbb9ef1f187122e2f5bda0927ba'
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
    git config submodule.mullvadvpn-app-binaries.url \
        "${srcdir}/mullvadvpn-app-binaries"
    git submodule update
}

build() {
    cd "${srcdir}/mullvadvpn-app"

    # Remove old Rust build artifacts
    cargo clean --release --locked

    # Build mullvad-daemon
    cargo build --release --locked

    # Copy binaries for packaging
    cp dist-assets/binaries/x86_64-unknown-linux-gnu/{openvpn,sslocal} \
        dist-assets/
    cp target/release/*talpid_openvpn_plugin* dist-assets/
    cp target/release/{mullvad,mullvad-daemon,mullvad-problem-report} \
        dist-assets/
}

check() {
    cd "${srcdir}/mullvadvpn-app"
    cargo test --release --locked
}

package() {
    cd "${srcdir}/mullvadvpn-app"

    # Install main files
    install --verbose --directory --mode=755 "${pkgdir}/opt/mullvad-vpn-cli"
    cp -av dist-assets/*  "${pkgdir}/opt/mullvad-vpn-cli"

    # Install daemon service
    install --verbose -D --mode=644 dist-assets/linux/mullvad-daemon.service -t \
        "${pkgdir}/usr/lib/systemd/system"

    # Install override for daemon
    install --verbose -D --mode=644 "${srcdir}/override.conf" -t \
        "${pkgdir}/etc/systemd/system/mullvad-daemon.service.d"

    # Install CLI binary
    install --verbose -D --mode=755 target/release/mullvad -t "${pkgdir}/usr/bin"

    # Install settings.json
    install --verbose -D --mode=644 "${srcdir}/settings.json.sample" -t "${pkgdir}/etc/mullvad-vpn/settings.json"

    # Install license
    install --verbose -D --mode=644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
