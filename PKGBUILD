# Maintainer: Rizakulov Temur <riakulovtemur0@gmail.com>
pkgname=cmdflow
pkgver=3.0.0
pkgrel=1
pkgdesc="A minimalist CLI tool written in Rust that parses shell history and renders graphs"
arch=('x86_64' 'aarch64')
url="https://github.com/voideez/cmdflow"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
install=cmdflow.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cdd1e0b24c01ecd6e52aba59a227c57fec6615c3218a0229fba1482b96c23406')

prepare() {
  cd "$pkgname-$pkgver"
  # Убрали --target "$CARCH", чтобы Cargo сам взял дефолтный системный таргет
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  # Убрали лишние флаги компилятора, оставив чистый вызов
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  if [ -f LICENSE.txt ]; then
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  elif [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
