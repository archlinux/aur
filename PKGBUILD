# Maintainer: werdxz

pkgname=portty
pkgver=0.3.3
pkgrel=1
pkgdesc="XDG Desktop Portal backend for TTY environments"
arch=('x86_64')
url="https://github.com/werdxz/portty"
license=('MIT')
depends=('xdg-desktop-portal')
makedepends=('rustup')
provides=('portty')
conflicts=('portty-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WERDXZ/portty/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8be421a20f63177d0ea8dcf3dfe5ba2ab74d4b4b891ae0325096a8f8e1374f40')

prepare() {
    rustup toolchain install --profile minimal --no-self-update nightly
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo +nightly build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install daemon
    install -Dm755 "target/release/porttyd" "$pkgdir/usr/lib/portty/porttyd"

    # Install CLI
    install -Dm755 "target/release/portty" "$pkgdir/usr/bin/portty"

    # Install portal file
    install -Dm644 "misc/tty.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/tty.portal"

    # Install systemd service
    install -Dm644 "misc/portty.service" "$pkgdir/usr/lib/systemd/user/portty.service"

    # Install D-Bus activation service
    install -Dm644 "misc/org.freedesktop.impl.portal.desktop.tty.service" \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.tty.service"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example config
    install -Dm644 "misc/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
