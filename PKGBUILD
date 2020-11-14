# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=mingw-w64-pteros
pkgver=2.8.r125.g16923940
pkgrel=1
pkgdesc="C++ library for molecular modeling. (mingw-w64)"
arch=('any')
url='https://github.com/yesint/pteros'
license=('Artistic License 2.0')
depends=('mingw-w64-crt' 'mingw-w64-boost')
makedepends=('mingw-w64-cmake' 'git' 'mingw-w64-eigen' 'mingw-w64-fmt' 'mingw-w64-spdlog')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}"'::git+https://github.com/yesint/pteros.git#branch=master')
sha1sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/${pkgname}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_PYTHON=OFF -DWITH_OPENBABEL=OFF -DWITH_GROMACS=OFF -DDOWNLOAD_DEPS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}/build-${_arch}"
    make DESTDIR="${pkgdir}" install 
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
 
pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
