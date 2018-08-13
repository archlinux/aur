# Maintainer: Michael Yang <ohmyarchlinux@pm.me>

pkgname=mingw-w64-fmt-git
pkgver=5.1.0.r45.g5c0101a
pkgrel=1
pkgdesc='An open-source formatting library for C++ (mingw-w64)'
url='http://fmtlib.net'
arch=('any')
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-fmt')
provides=('mingw-w64-fmt')
source=('git+https://github.com/fmtlib/fmt.git')
sha512sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd fmt
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DFMT_DOC=OFF \
      -DFMT_TEST=OFF \
      ../fmt
    make
    popd
  done
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DFMT_DOC=OFF \
      -DFMT_TEST=OFF \
      -DBUILD_SHARED_LIBS=FALSE \
      ../fmt
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    mkdir -p "${pkgdir}"/usr/${_arch}/bin
    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
