# Maintainer: werdxz

pkgname=portty-git
pkgver=0.2.0.r1.geb7e375
pkgrel=2
pkgdesc="XDG Desktop Portal backend for TTY environments"
arch=('x86_64')
url="https://github.com/werdxz/portty"
license=('MIT')
depends=('xdg-desktop-portal')
makedepends=('rustup' 'git')
provides=('portty')
conflicts=('portty')
source=("${pkgname}::git+https://github.com/werdxz/portty.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    rustup toolchain install --profile minimal --no-self-update nightly
}

build() {
    cd "$pkgname"
    cargo +nightly build --release --locked
}

package() {
    cd "$pkgname"

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
