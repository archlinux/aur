pkgname=mingw-w64-mpi_stubs
pkgver=1.0.1
pkgrel=1
pkgdesc="A dummy, no-op MPI implementation (mingw-w64)"
arch=('any')
url="https://github.com/scivision/mpi_stubs"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/scivision/mpi_stubs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5dca59df87398ddcbc351ff73447781b7ff74e218f4466ac272ef8daf6db757')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/mpi_stubs-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
    make
    popd
  done
}

package ()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/mpi_stubs-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
