# Maintainer:  Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-x265
pkgver=3.4
pkgrel=2
pkgdesc='Open Source H265/HEVC video encoder (mingw-w64)'
arch=('any')
url='https://www.videolan.org/developers/x265.html'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-cmake' 'git' 'nasm' 'ninja')
_tag=a4f320054d67fc3cff04ef72ac3382a4925d53b9
source=(x265::git+https://bitbucket.org/multicoreware/x265_git.git#tag=${_tag}
        mingw.patch)
sha256sums=('SKIP'
            'b1953c70b734b91e7916448c4636b70305c1d5bfaf86f17f94b769499635a191')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd x265

  git describe --tags | sed 's/^v//'
}

prepare() {
    cd x265
    patch -Np1 -i "${srcdir}/mingw.patch"
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS CPPFLAGS

    if [[ ${_arch} == x86_64-w64-mingw32 ]]; then
      mkdir -p "${srcdir}"/build-12-${_arch} && cd "${srcdir}"/build-12-${_arch}

      ${_arch}-cmake \
         -G Ninja \
         -DLIB_INSTALL_DIR="lib" \
         -DHIGH_BIT_DEPTH='TRUE' \
         -DMAIN12='TRUE' \
         -DEXPORT_C_API='FALSE' \
         -DENABLE_CLI='FALSE' \
         -DENABLE_SHARED='FALSE' \
         -Wno-dev \
         "${srcdir}"/x265/source
      ninja

      mkdir -p "${srcdir}"/build-10-${_arch} && cd "${srcdir}"/build-10-${_arch}

      ${_arch}-cmake \
         -G Ninja \
         -DLIB_INSTALL_DIR="lib" \
         -DHIGH_BIT_DEPTH='TRUE' \
         -DEXPORT_C_API='FALSE' \
         -DENABLE_CLI='FALSE' \
         -DENABLE_SHARED='FALSE' \
         -Wno-dev \
         "${srcdir}"/x265/source
      ninja

      mkdir -p "${srcdir}"/build-8-${_arch} && cd "${srcdir}"/build-8-${_arch}

      ${_arch}-cmake \
         -G Ninja \
         -DLIB_INSTALL_DIR="lib" \
         -DENABLE_SHARED='TRUE' \
         -DENABLE_HDR10_PLUS='TRUE' \
         -DEXTRA_LIB='x265_main10.a;x265_main12.a' \
         -DEXTRA_LINK_FLAGS='-L .' \
         -DLINKED_10BIT='TRUE' \
         -DLINKED_12BIT='TRUE' \
         -DENABLE_CLI='TRUE' \
         -Wno-dev \
         "${srcdir}"/x265/source
      ln -s ../build-10-${_arch}/libx265.a libx265_main10.a
      ln -s ../build-12-${_arch}/libx265.a libx265_main12.a
      ninja
    else
      mkdir -p "${srcdir}"/build-8-${_arch} && cd "${srcdir}"/build-8-${_arch}
      ${_arch}-cmake \
         -G Ninja \
         -DLIB_INSTALL_DIR="lib" \
         -DENABLE_SHARED='TRUE' \
         -DENABLE_CLI='TRUE' \
         -Wno-dev \
         "${srcdir}"/x265/source
      ninja
    fi
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-8-${_arch}

    DESTDIR="$pkgdir" ninja install
    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
