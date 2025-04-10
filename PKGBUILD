# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libavif"
pkgname="lib32-${_name}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Library for encoding and decoding .avif files (32-bit)"
arch=('x86_64')
url="https://github.com/AOMediaCodec/${_name}"
license=('LicenseRef-libavif')
depends=('lib32-aom' 'lib32-libdav1d' 'lib32-gcc-libs' 'lib32-glib2'
         'lib32-glibc' 'lib32-libwebp' 'lib32-libyuv' 'lib32-rav1e'
         'lib32-svt-av1' "${_name}>=${pkgver}")
makedepends=('cmake>=3.13' 'lib32-gdk-pixbuf2' 'lib32-gtest') # 'nasm'
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_name}_gtest.patch")
sha256sums=('9c859c7c12ccb0f407511bfe303e6a7247f5f6738f54852662c6df8048daddf4'
            '2b35300a447f70d56809f35be961e6c12dff3e9034043775a42f4c0aba6a09c5')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_gtest.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib32'
    -DAVIF_BUILD_APPS:BOOL=OFF
    -DAVIF_BUILD_TESTS:BOOL=ON
    -DAVIF_BUILD_EXAMPLES:BOOL=OFF
    -DAVIF_BUILD_MAN_PAGES:BOOL=OFF
    -DAVIF_BUILD_GDK_PIXBUF:BOOL=ON
    -DAVIF_CODEC_AOM=SYSTEM
    -DAVIF_CODEC_DAV1D=SYSTEM
    -DAVIF_CODEC_RAV1E=SYSTEM
    -DAVIF_CODEC_SVT=SYSTEM
    -DAVIF_LIBSHARPYUV=SYSTEM
    -DAVIF_GTEST:BOOL=ON
)
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
