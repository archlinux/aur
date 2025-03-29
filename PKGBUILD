# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Michał Janiszewski <janisozaur+aur@gmail.com>
# Contributor: Philipp Claßen <philipp.classen@posteo.de>

_name="benchmark"
pkgname="lib32-${_name}"
pkgver=1.9.2
pkgrel=1
pkgdesc="A microbenchmark support library (32-bit)"
arch=('x86_64')
url="https://github.com/google/${_name}"
license=('Apache-2.0')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('cmake>=3.13')
provides=("lib${_name}"{,'_main'}'.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('409075176168dc46bbb81b74c1b4b6900385b5d16bfc181d678afb060d928bd3')

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
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DBENCHMARK_ENABLE_LTO:BOOL=ON
    -DBENCHMARK_ENABLE_GTEST_TESTS:BOOL=OFF
    # -DBENCHMARK_ENABLE_GTEST_TESTS:BOOL=ON
    # -DGOOGLETEST_PREFIX:PATH='/usr/src/googletest'
    # -DGOOGLETEST_PATH:PATH='/usr/src/googletest'
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
