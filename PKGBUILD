# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=miro
pkgver=0.2.0
pkgrel=2
pkgdesc="A GPU-accelerated terminal emulator written in Rust"
arch=('x86_64')
url="https://github.com/o2sh/miro"
license=('GPL3')
depends=('libxcb' 'xcb-util-keysyms' 'libxkbcommon'
         'libxkbcommon-x11' 'xcb-util-wm' 'mesa'
         'freetype2' 'fontconfig')
makedepends=('cargo' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('26b91a1fa5737e34a5b608b50c21d7bdf6b6f7b6bb1143e6dfbc157545cfec359efdbd12377dfd151cc33d86263b3461705ff127cd478bdfa2657544fb480545')

prepare() {
  cd "$pkgname-$pkgver"
  sed "s|String::from(\"assets/|String::from(\"/opt/$pkgname/assets/|g" -i src/{main,config}.rs
  sed "s|assets/|/opt/$pkgname/assets/|g" -i assets/gfx/*
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r "assets" "$pkgdir/opt/$pkgname/"
}
