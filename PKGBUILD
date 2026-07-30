# Maintainer: Nathan Gamber <ngamber@gmail.com>
pkgname=hypr-persist
pkgver=0.1.2
pkgrel=1
pkgdesc='Session persistence daemon for Hyprland'
arch=('x86_64')
url='https://github.com/ngamber/hypr-persist'
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo' 'mold')
install=$pkgname.install
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('362199cfb5172cf1b2b8c2d46218c6f7b0099d8e91947556fd0f72d6c3341686')

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
