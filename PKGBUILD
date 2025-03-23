# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FTXUI"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=6.0.0
pkgrel=1
pkgdesc="A C++ Functional Terminal User Interface (32-bit)"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/${_Name}"
license=('MIT')
depends=("${_name}>=${pkgver}")
makedepends=('cmake>=3.12' 'lib32-benchmark>=1.8.2' 'lib32-gtest>=1.10')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6a5fa043ce37e307214b23f1a72b2735b1c792eddf204cf614a2402394ff16935d6c4b9b5468bc2fb47fd692913e4499d0b679aaec249c38974a083beb352e4d')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_non-existent_include_path.patch"
}

build() {
  export CFLAGS+=" -m32 -ffat-lto-objects"
  export CXXFLAGS+=" -m32 -ffat-lto-objects"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib32'
    -DFTXUI_ENABLE_INSTALL:BOOL=ON
    -DFTXUI_BUILD_EXAMPLES:BOOL=OFF
    -DFTXUI_BUILD_TESTS:BOOL=ON
    -DFTXUI_BUILD_DOCS:BOOL=OFF
    -Wno-dev
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
