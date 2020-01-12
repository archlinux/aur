# Maintainer: Deian Stefan

_pkgname=boolector
pkgname=boolector-git
pkgver=r10213.b9d1bef7
pkgrel=1
pkgdesc="A Satisfiability Modulo Theories (SMT) solver for the theories of fixed-size bit-vectors, arrays and uninterpreted functions"
arch=('any')
url="https://github.com/Boolector/boolector"
license=('MIT')
depends=('btor2tools-git')
makedepends=()
conflicts=()
source=("git://github.com/Boolector/boolector.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir
}

build() {

  cd "$srcdir/boolector"

  # Download and build Lingeling
  ./contrib/setup-lingeling.sh

  CFLAGS="" ./configure.sh --shared
  cd build
  make

}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
   
  mkdir -p "$pkgdir/usr/include/boolector"
  install -m755 boolector/build/bin/boolector "$pkgdir/usr/bin/"
  install -m755 boolector/build/lib/*.so "$pkgdir/usr/lib/"
  install -m644 boolector/src/*.h "$pkgdir/usr/include/boolector/"
}
