pkgname=xdg-desktop-portal-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A rust backend for xdg-desktop-portal"
arch=('x86_64')
url="https://github.com/leakybits/xdg-desktop-portal-rs"
license=('MIT')
provides=('xdg-desktop-portal-impl')
depends=('xdg-desktop-portal' 'gtk3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leakybits/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('51754c436aae4f38a5659b659740ba676bb54d68372ab70e4589a281d9a4ab7befaa73ef43423e17c4797ba0c20a2a4e756d65161fae72c9a5534c43c59d9886')

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
