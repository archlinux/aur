# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FTXUI"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=5.0.0
pkgrel=2
pkgdesc="A C++ Functional Terminal User Interface (32-bit)"
arch=('x86_64')
url="https://github.com/ArthurSonzogni/${_Name}"
license=('MIT')
depends=("${_name}")
makedepends=('cmake>=3.12' 'lib32-benchmark>=1.8.2' 'lib32-gtest>=1.10')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_name}_non-existent_include_path.patch::${url}/pull/817.patch?full_index=1")
b2sums=('aaf6060641c3f63814002fcba3c17ad7a0d3d0681bc2f31cec8e666b25e35c55a4f0fdd9e2855ea91e9e546edcc2cad2c172e8a06dbc55ed7caf9ce9178b2302'
        '92e0cd5853dec21eaa8b02bccecdce7479f3786c07b845f9d33a8c29cada6195520d91a5080a5544c75da061f8ab1e08e1929878a22774b730ad585f130c47af')

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
