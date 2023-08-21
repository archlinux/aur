# Maintainer: James Houlahan <james@houlahan.ch>

pkgname=xdg-desktop-portal-rs
pkgver=0.2.2
pkgrel=1
pkgdesc="A rust backend for xdg-desktop-portal"
arch=('x86_64')
url="https://github.com/leakybits/xdg-desktop-portal-rs"
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leakybits/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('8229a626903db6424de37acb39a5fcb84e1ed144bad51c5ae2b8c2a08578957333fd53cce842f6bf0f5e88e33d78d0049a69c644e7333bf8e86afd87877c941d')

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 -t "$pkgdir/usr/lib/" "target/release/$pkgname"

    # Install portal description
    install -Dm644    "service/rs.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/rs.portal"

    # Install systemd user service
    install -Dm644    "service/xdg-desktop-portal-rs.service" "$pkgdir/usr/lib/systemd/user/xdg-desktop-portal-rs.service"

    # Install dbus service
    install -Dm644    "service/org.freedesktop.impl.portal.desktop.rs.service" "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.rs.service"
}
