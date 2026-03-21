# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libavif"
pkgname="lib32-${_name}"
pkgver=1.4.1
_libargparse=ee74d1b53bd680748af14e737378de57e2a0a954 # should match cmake/Modules/LocalLibargparse.cmake
pkgrel=1
pkgdesc="Library for encoding and decoding .avif files (32-bit)"
arch=(
  'x86_64'
)
url="https://github.com/AOMediaCodec/${_name}"
license=(
  'LicenseRef-libavif'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-aom'
  'lib32-libdav1d'
  'lib32-gcc-libs'
  'lib32-glib2'
  'lib32-glibc'
  'lib32-libwebp'
  'lib32-libyuv'
  'lib32-rav1e'
  'lib32-svt-av1'
)
makedepends=(
  'cmake>=3.13'
  'git'
  'lib32-gdk-pixbuf2'
  'lib32-gtest'
  'lib32-libxml2'
  # 'nasm'
)
provides=(
  "${_name}.so"
)
_pkgsrc="${url##*/}"
source=(
  "git+${url}.git#tag=v${pkgver}"
  "git+https://github.com/kmurray/libargparse.git#commit=${_libargparse}"
  "${_name}_gtest.patch"
)
sha256sums=('d9a958dfc7953c1c2ffb7fdf2ae670ea87c7972598bc55d8519d440670bd95bc'
            '235020da02227503eb09961efd664aca6e544a8b3ed5533cf81e1862bb94f48f'
            '2b35300a447f70d56809f35be961e6c12dff3e9034043775a42f4c0aba6a09c5')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -a "${srcdir}/libargparse" -t "ext"

  patch -Np1 -i "${srcdir}/${_name}_gtest.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib32'
    -D AVIF_BUILD_APPS:BOOL=OFF
    -D AVIF_BUILD_TESTS:BOOL=ON
    -D AVIF_BUILD_EXAMPLES:BOOL=OFF
    -D AVIF_BUILD_MAN_PAGES:BOOL=OFF
    -D AVIF_BUILD_GDK_PIXBUF:BOOL=ON
    -D AVIF_CODEC_AOM=SYSTEM
    -D AVIF_CODEC_DAV1D=SYSTEM
    -D AVIF_CODEC_RAV1E=SYSTEM
    -D AVIF_CODEC_SVT=SYSTEM
    -D AVIF_LIBSHARPYUV=SYSTEM
    -D AVIF_LIBXML2=SYSTEM
    -D AVIF_GTEST:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_arguments[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local ctest_exclude_regex=""
  local ctest_arguments=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
