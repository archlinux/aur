# Maintainer: xiota / aur.chaotic.cx

_pkgname="fairy-stockfish"
pkgname="$_pkgname"
pkgver=14.0.1
pkgrel=2
pkgdesc="A chess engine derived from Stockfish designed for the support of fairy chess variants and easy extensibility with more games."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ianfab/Fairy-Stockfish"
license=('GPL3')

makedepends=('git')
optdepends=(
  'polyglot-winboard: For xboard support'
)

_tag="fairy_sf_${pkgver//./_}_xq"
_pkgsrc="Fairy-Stockfish-$_tag/src"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://github.com/ianfab/Fairy-Stockfish/archive/refs/tags/$_tag.$_pkgext"
)
sha256sums=(
  '53914fc89d89afca7cfcfd20660ccdda125f1751f59a68b1f3ed1d4eb6cfe805'
)

prepare() {
  sed -e 's/^EXE = stockfish$/EXE = fairy-stockfish/' \
    -i "${srcdir:?}/$_pkgsrc/Makefile"
}

build() {
  cd "$srcdir/$_pkgsrc"

  case "$CARCH" in
    "x86_64")
      arch=x86-64
      ;;
    "i686")
      arch=x86-32
      ;;
    "aarch64")
      arch=armv8
      ;;
    *)
      echo "Unmapped architecture"
      exit 1
      ;;
  esac

  make build ARCH="$arch" largeboards=yes all=yes
}

package() {
  cd "$srcdir/$_pkgsrc"
  make PREFIX="${pkgdir:?}/usr" install
  install -Dm644 "../Copying.txt" "${pkgdir:?}/usr/share/licenses/$pkgname/LICENSE"
}
