# Maintainer: Alonso Rodriguez <alonso.rodriguez (at) udc.es>

pkgname=pato
pkgver=0.0.2
pkgrel=0
pkgdesc="PATO: high PerformAnce TriplexatOr is a high performance tool for the fast and efficient detection of triple helices and triplex features in nucleotide sequences"
arch=('any')
url="https://github.com/UDC-GAC/pato"
license=('MIT')
depends=()
optdepends=()
conflicts=('pato' 'pato-git')
provides=('pato')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/UDC-GAC/pato/archive/v${pkgver}.tar.gz")
sha256sums=('3763d7ff5d3f3e85baf8c97682b2b50bdb5f7d5d8ca1d818d25c61e79beabdb6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/-march=native//g' makefiles/Makefile.gnu
  sed -i "s/\"v${pkgver}\"/\"v${pkgver}-${pkgrel}arch\"/g" src/command_line_parser.hpp
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make gnu BUILD=release $MAKEFLAGS
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  make gnu BUILD=serial $MAKEFLAGS

  ./test/test.bash gnu
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # TODO fix if cross-compiling (please don't do that)
  ./target/gnu/pato.release --export-help=man | gzip > pato.1.gz
  install -Dm644 pato.1.gz "$pkgdir/usr/share/man/man1/pato.1.gz"
  ./target/gnu/pato.release --export-help=html > pato.html
  install -Dm644 pato.html "$pkgdir/usr/share/doc/pato/html/pato.html"

  # Install pato.release
  install -Dm755 target/gnu/pato.release "$pkgdir/usr/bin/pato"

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
