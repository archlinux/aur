# Maintainer: adelmonte
pkgname=xdg-desktop-portal-tui
pkgver=0.1.0
pkgrel=2
pkgdesc="An xdg-desktop-portal file chooser: file-browser-tui in kitty as the Open and Save dialog"
arch=('x86_64')
url="https://github.com/adelmonte/xdg-desktop-portal-tui"
license=('GPL-3.0-only')
depends=('xdg-desktop-portal' 'file-browser-tui>=1.1.3' 'kitty' 'gcc-libs' 'glibc')
makedepends=('cargo')
install=xdg-desktop-portal-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('407d911ef4fbc7aa9a74d3c4629af60af24e709c0aa205c0e21f49c6930302b9')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/lib/$pkgname"
    install -Dm644 data/tui.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/tui.portal"
    install -Dm644 data/org.freedesktop.impl.portal.desktop.tui.service \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.tui.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
