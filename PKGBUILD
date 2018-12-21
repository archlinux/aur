# Maintainer: Deian Stefan

_pkgname=boolector
pkgname=boolector-git
pkgver=r9842.06b2357b
pkgrel=1
pkgdesc="A Satisfiability Modulo Theories (SMT) solver for the theories of fixed-size bit-vectors, arrays and uninterpreted functions"
arch=('any')
url="https://github.com/Boolector/boolector"
license=('MIT')
depends=()
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
  git clone git://github.com/Boolector/btor2tools.git
  git clone git://github.com/arminbiere/lingeling.git
}

build() {

  # btor2tools

  cd "$srcdir/btor2tools"
  CFLAGS="" ./configure.sh -shared -fPIC
  make

  # lingeling

  cd "$srcdir/lingeling"
  CFLAGS="" ./configure.sh -fPIC
  make

  # boolector

  cd "$srcdir/boolector"
  CFLAGS="" ./configure.sh --shared
  cd build
  make

}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"
   
  # btor2tools

  install -m755 btor2tools/bin/* "$pkgdir/usr/bin/"
  install -m755 btor2tools/build/*.so "$pkgdir/usr/lib/"
  install -m755 btor2tools/build/*.a "$pkgdir/usr/lib/"

  # lingeling

  mkdir -p "$pkgdir/usr/include/lingeling"
  install -m755 lingeling/lingeling "$pkgdir/usr/bin/"
  install -m755 lingeling/*.a "$pkgdir/usr/lib/"
  install -m644 lingeling/*.h "$pkgdir/usr/include/lingeling/"

  # boolector

  mkdir -p "$pkgdir/usr/include/boolector"
  install -m755 boolector/build/bin/boolector "$pkgdir/usr/bin/"
  install -m755 boolector/build/lib/*.so "$pkgdir/usr/lib/"
  install -m644 boolector/src/*.h "$pkgdir/usr/include/boolector/"
}
