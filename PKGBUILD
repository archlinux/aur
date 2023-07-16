pkgname=xdg-desktop-portal-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="A rust backend for xdg-desktop-portal"
arch=('x86_64')
url="https://github.com/leakybits/xdg-desktop-portal-rs"
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leakybits/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7ad5fe824095122235f42b9c15ee51b4f3fb85cdedecf20edb36a396a804de50cb82bf84fb4bdf6c54c9d9834a6c4874103d71d8c1a8a0be9ab05c30bbe64fca')

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
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
