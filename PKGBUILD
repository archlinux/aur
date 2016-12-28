# Maintainer:  Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-x265
pkgver=2.2
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder (mingw-w64)'
arch=('any')
url='https://bitbucket.org/multicoreware/x265'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-cmake' 'yasm')
source=("https://bitbucket.org/multicoreware/x265/downloads/x265_${pkgver}.tar.gz"
        mingw.patch)
sha256sums=('b872552535e41fbffa03ba7cbcd3479c42c4053868309292e78e147b7773ac4b'
            '90b8e81cd5228d2b147fbd6c000921d5b7593819e378d0e73c11c8de390796bc')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd x265_${pkgver}
    patch -Np1 -i "${srcdir}/mingw.patch"
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}

    unset LDFLAGS CPPFLAGS
    ${_arch}-cmake \
       -DLIB_INSTALL_DIR="lib" \
       -DENABLE_SHARED='TRUE' \
       -DENABLE_CLI='FALSE' \
       "${srcdir}"/x265_${pkgver}/source
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
