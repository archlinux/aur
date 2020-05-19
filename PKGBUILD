pkgname=mingw-w64-spirv-cross
pkgver=2020.04.03
pkgrel=1
pkgdesc='A tool and library for parsing and converting SPIR-V to other shader languages (mingw-w64)'
arch=('any')
url='https://github.com/KhronosGroup/SPIRV-Cross/'
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/KhronosGroup/SPIRV-Cross/archive/${pkgver//./-}.tar.gz")
sha256sums=('93f3a6dfad17c9ca0bf4d2d80809e90118e13b47502eb395baba8784025d7e97')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd SPIRV-Cross-${pkgver//./-}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LDFLAGS="-lssp" ${_arch}-cmake -DSPIRV_CROSS_CLI=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SPIRV-Cross-${pkgver//./-}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
#     ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
