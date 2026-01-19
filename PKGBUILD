pkgname=('mingw-w64-flint')
pkgver=3.4.0
pkgrel=1
pkgdesc='A C library for doing number theory (mingw-w64)'
url='http://www.flintlib.org'
arch=('any')
license=(LGPL-3.0-only)
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-mpfr' 'mingw-w64-cblas')
source=("https://github.com/flintlib/flint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a681ee6f02356ae8ab1b87eab2ad239598ec78563740547f6039cc256153eb8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd flint-${pkgver}
  curl -L https://github.com/flintlib/flint/pull/2558.patch | patch -p1

  # copy generic flint-mparam.h
  sed -i "s|CMAKE_SIZEOF_VOID_P EQUAL 8|TRUE|g" CMakeLists.txt

  # headers are configured in the source dir
  for _arch in ${_architectures}; do
    cp -r "${srcdir}"/flint-${pkgver} "${srcdir}"/flint-${pkgver}-${_arch}
  done
}

build() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/flint-${pkgver}-${_arch}
    ${_arch}-cmake -DIPO_SUPPORTED=OFF -DENABLE_ARCH=NO -DENABLE_AVX2=OFF -DHAS_FLAG_AVX2=0 -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/flint-$pkgver-${_arch}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
