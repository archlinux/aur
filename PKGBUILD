# Maintainer:  Karl-Felix Glatzer <karl.glatzer@gmx.de>

pkgname=mingw-w64-x265
pkgver=4.2
pkgrel=1
pkgdesc='Open Source H265/HEVC video encoder (mingw-w64)'
arch=('any')
url=https://www.x265.org/
license=('GPL-2.0-or-later')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs !debug)
makedepends=('mingw-w64-cmake' 'git' 'nasm' 'ninja')
source=(
  "git+https://github.com/Multicorewareinc/x265.git#tag=${pkgver}"
  0001-Fix-build-with-GCC-15.patch
  mingw.patch
)
b2sums=('1ad111130a64ca822b5b78dc84e0078e30bbadb67a9db16bdd6a860a4210c17701ae5681930e10ec3e6335ea767ac01391fc1a68ce5ca72450c4a075b664a348'
        'af2ee0460c0c2f6f36e4f124a9ac16610e3884001262a6f08043fa1de4a85e2b5fd4fb12c64b8c94cfb59c3031bb7a1324e307fa2049e3378e2add9a58f5bd9e'
        'ec8e763beb4f6fd93bd959b18b75b038b1cad2f137be488dffed383ea14b1e880e3830be09da32a67821b628f30fd120364052b0a02ff82a65ddebd68293f645')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd x265

  # Fix build with GCC 15
  git apply -3 ../0001-Fix-build-with-GCC-15.patch

  patch -Np1 -i "${srcdir}/mingw.patch"
}

build() {
  local common_options=(
    -S "${srcdir}"/x265/source
    -G Ninja
    -D ENABLE_HDR10_PLUS=TRUE
    -D LIB_INSTALL_DIR="lib"
    -W no-dev
  ) hdr_options=(
    "${common_options[@]}"
    -D ENABLE_CLI=FALSE
    -D ENABLE_SHARED=FALSE
    -D EXPORT_C_API=FALSE
    -D HIGH_BIT_DEPTH=TRUE
  ) final_options=(
    "${common_options[@]}"
    -D ENABLE_SHARED=TRUE
    -D EXTRA_LIB='x265_main10.a;x265_main12.a'
    -D EXTRA_LINK_FLAGS='-L .'
    -D LINKED_10BIT=TRUE
    -D LINKED_12BIT=TRUE
  )

  for _arch in ${_architectures}; do
    unset LDFLAGS CPPFLAGS

    if [[ ${_arch} == x86_64-w64-mingw32 ]]; then
      mkdir -p "${srcdir}"/build-10-${_arch}

      ${_arch}-cmake -B build-10-${_arch} "${hdr_options[@]}"
      cmake --build build-10-${_arch}

      mkdir -p "${srcdir}"/build-12-${_arch}

      ${_arch}-cmake -B build-12-${_arch} "${hdr_options[@]}" -D MAIN12=TRUE
      cmake --build build-12-${_arch}

      mkdir -p "${srcdir}"/build-${_arch}

      ${_arch}-cmake -B build-${_arch} "${final_options[@]}" -DENABLE_CLI='TRUE'
      ln -sr build-10-${_arch}/libx265.a build-${_arch}/libx265_main10.a
      ln -sr build-12-${_arch}/libx265.a build-${_arch}/libx265_main12.a
      cmake --build build-${_arch}
    else
      mkdir -p "${srcdir}"/build-${_arch}
      ${_arch}-cmake \
         -B build-${_arch} \
         -G Ninja \
         -DLIB_INSTALL_DIR="lib" \
         -DENABLE_SHARED='TRUE' \
         -DENABLE_CLI='TRUE' \
         -Wno-dev \
         "${srcdir}"/x265/source
      cmake --build build-${_arch}
    fi
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
