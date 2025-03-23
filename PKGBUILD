# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="FTXUI"
_name="${_Name,,}"
pkgver=5.0.0
pkgname="${_name}${pkgver%%.*}"
pkgrel=1
pkgdesc="A C++ Functional Terminal User Interface (legacy version 5)"
arch=('i686' 'x86_64')
url="https://github.com/ArthurSonzogni/${_Name}"
license=('MIT')
makedepends=('benchmark>=1.8.2' 'cmake>=3.12' 'gtest>=1.10')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('aaf6060641c3f63814002fcba3c17ad7a0d3d0681bc2f31cec8e666b25e35c55a4f0fdd9e2855ea91e9e546edcc2cad2c172e8a06dbc55ed7caf9ce9178b2302')

build() {
  export CXXFLAGS+=" -ffat-lto-objects"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_INCLUDEDIR="include/${pkgname}"
    -DCMAKE_INSTALL_LIBDIR="lib/${pkgname}"
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
}
