# Maintainer: Adrien Lenoir <adrien.lenoir42440@gmail.com>
pkgname=hyprresume
pkgver=0.5.0
pkgrel=1
pkgdesc='Session persistence daemon for Hyprland'
arch=('x86_64')
url='https://github.com/IraSkyx/hyprresume'
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
install=$pkgname.install
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('efbfe4d1a75a0d78969332d163e9f40a18d3d0033b5d85d1a90f8ffdf1017935')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
