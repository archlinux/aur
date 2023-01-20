# Maintainer: Murmele <martin.marmsoler AT gmail DOT com>

pkgname=mdflib-git
pkgver=r83.g3215f84
pkgrel=1
pkgdesc="The MDF Library implements an interface against ASAM Measurement Data Files (MDF)"
arch=('i686' 'x86_64')
url="https://ihedvall.github.io/mdflib/"
license=('MIT')
depends=('expat' 'zlib')
makedepends=('git' 'cmake')  # gcc-fortran
provides=('mdflib')
conflicts=('mdflib')
options=('staticlibs')
source=("git+https://github.com/ihedvall/mdflib.git")
sha256sums=('SKIP')


pkgver() {
  cd "mdflib"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "mdflib"

  cmake \
    -B "build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DMDF_BUILD_DOC=OFF \
    -DMDF_BUILD_TEST=OFF \
    -DMDF_BUILD_TOOL=OFF \
    ./
  make -C "build"
}

package() {
  cd "mdflib"

  make -C "build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/mdflib"
}
