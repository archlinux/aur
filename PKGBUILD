# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-occ-cadquery-git
_pkgname=pythonocc-core
pkgver=r929.701e924
pkgrel=1
pkgdesc="A python library whose purpose is to provide 3D modeling features -- CadQuery's fork"
url="https://github.com/CadQuery/pythonocc-core"
arch=('i686' 'x86_64')
license=('Apache')
makedepends=('cmake' 'swig')
depends=('oce' 'python')
conflicts=('python-occ')
source=("git://github.com/CadQuery/pythonocc-core.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  mkdir -p build
  cd build
  flags=""
  flags="$flags -DCMAKE_INSTALL_PREFIX=/usr/local"
  flags="$flags -DOCE_INCLUDE_PATH=/opt/oce/include/oce"
  flags="$flags -DOCE_LIB_PATH=/opt/oce/lib"
  cmake $flags ..
}

check(){
  cd ${_pkgname}-${pkgver}/test
  python run_tests.py
}

build() {
  cd ${_pkgname}/build
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
