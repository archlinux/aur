# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=mingw-w64-xlnt-git
pkgver=1.2.0.r2.g8bd85f9
pkgrel=1
pkgdesc='Cross-platform user-friendly xlsx library for C++11 (mingw-w64)'
url='https://github.com/tfussell/xlnt'
arch=('any')
license=('MIT')
makedepends=('git' 'mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-xlnt')
provides=('mingw-w64-xlnt')
source=('git://github.com/tfussell/xlnt.git')
sha512sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd xlnt
  git describe | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  sed -e 's/DengXian Light/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -e 's/DengXian/\\xe5\\xae\\x8b\\xe4\\xbd\\x93/' -i  xlnt/source/detail/serialization/xlsx_producer.cpp
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DTESTS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ../xlnt
    make
    popd
  done
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DTESTS=OFF \
      -DSTATIC=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ../xlnt
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
