# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=tetris-rs
pkgver=0.1.4
pkgrel=6
pkgdesc='Terminal based tetris game written in rust.'
url='https://crates.io/crates/tetris-rs'
arch=('x86_64')
license=('MIT')
depends=('gcc-libs'  'glibc')
makedepends=('cargo')
conflicts=('tetris')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "https://raw.githubusercontent.com/kunieone/tetris_rs/master/LICENCE")
b2sums=('180bb3e6f6e46a976758ef9087e8fc2460248d460675ca827415ad5b1945b95fe54f4863ddefb3227cc2e772bd6baeb919172a9a55c8933ae13b308d1574ba84'
        '079cbbbaa94eedc705690f3d4b3769883924d448cc6c0ecbd2a189d0d4b4a2097c458167df59915b55facf90dd711c32a0044d27deb2ac95e1bab8d699eb6408')

prepare() {
  cd $pkgname-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo build --frozen --release
}

check() {
  cd $pkgname-$pkgver
  RUSTFLAGS='-C link-args=-Wl,-z,shstk' cargo test --frozen
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/tetris
  install -D -m644 "$srcdir/LICENCE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
