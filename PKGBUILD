# Maintainer: Sosthène Guédon <sosthene@guedon.gdn>
pkgname=sfil
pkgver=0.1.0
pkgrel=1
pkgdesc='Convert between serialization format and filter elements'
url='https://gitlab.com/sgued/sfil'
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("https://gitlab.com/sgued/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('ead862b989cfdb0ac97d89b60936efe18f95147d589c5438902d340ebe9b5f08bada2a45af3c6cd16b43fc09d3d392c4752875eb599f9bd6cc4b6a5ab773dc45')
b2sums=('7b69406aede258855ea29ca897075e8ae73a8adab251dca51ef896a7353b5e3658730044e1756789a7bfafb6f2b1fe9ac4f39418488a3559e7c53e7e485fd65a')

prepare() {
  cd $pkgname-v$pkgver
  cargo fetch --frozen
  cargo fetch --frozen
}

check() {
  cd $pkgname-v$pkgver
  cargo t --all-targets --all-features
}

build() {
  cd $pkgname-v$pkgver
  cargo build --frozen --release -p "sfil-cli" --features all_formats
  cargo run -p sfil-packager --features sfil-cli/all_formats
}

package() {
  cd $pkgname-v$pkgver
  install -Dm755 target/release/sfil-cli ${pkgdir}/usr/bin/sfil
  install -Dm644 completons/sfil.bash $pkgdir/usr/share/bash-completion/completions/sfil
}

