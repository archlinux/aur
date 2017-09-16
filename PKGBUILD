
pkgname='mingw-w64-xdmf-git'
pkgver=r2384.605db515
pkgrel=1
pkgdesc="eXtensible Data Model and Format (mingw-w64)"
arch=('any')
url="http://www.xdmf.org"
license=('BSD')
depends=('mingw-w64-hdf5' 'mingw-w64-libxml2' 'mingw-w64-libtiff')
makedepends=('mingw-w64-cmake' 'mingw-w64-boost')
provides=('mingw-w64-xdmf')
conflicts=('mingw-w64-xdmf')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+git://xdmf.org/Xdmf.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/Xdmf"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd Xdmf
}

build() {
  cd Xdmf
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Xdmf/build-${_arch}
    make DESTDIR="$pkgdir/" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
