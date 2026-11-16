# Maintainer: Sosthène Guédon <sosthene@guedon.gdn>
pkgname=sfil
pkgver=0.1.1
pkgrel=1
pkgdesc='Convert between serialization format and filter elements'
url='https://codeberg.org/sgued/sfil'
arch=('x86_64')
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("https://codeberg.org/sgued/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0195f1c8c3c30fcb4c215a38a46e8891e21b904ca7506529003a1681b473b8da3b1005a336ce283c46f430ffc5bfb648113068ddbca6045a6dfc33e9fcf4410b')
b2sums=('539a75133ac5325efd5be93fe86fc6cee81677052b6d98137e41733d4c10feab90b44747071087be81610ffc0a0810a67ab55cf62802cd65ff1140f03a0e1a0f')

prepare() {
  cd $pkgname
  cargo fetch --frozen
  cargo fetch --frozen
}

check() {
  cd $pkgname
  cargo t --all-targets --all-features
}

build() {
  cd $pkgname
  cargo build --frozen --release -p "sfil-cli" --features all_formats
  cargo run -p sfil-packager --features sfil-cli/all_formats
}

package() {
  cd $pkgname
  install -Dm755 target/release/sfil-cli ${pkgdir}/usr/bin/sfil
  install -Dm644 completons/sfil.bash $pkgdir/usr/share/bash-completion/completions/sfil
}

