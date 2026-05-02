# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

_Name="oneTBB"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=2023.0.0
pkgrel=1
pkgdesc="oneAPI Threading Building Blocks - a high level abstract threading library (32-bit)"
arch=(
  'x86_64'
)
url="https://uxlfoundation.github.io/oneTBB/"
_url="https://github.com/uxlfoundation/${_Name}"
license=(
  'Apache-2.0'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-hwloc'
)
makedepends=(
  'cmake>=3.5'
)
provides=(
  "lib32-intel-tbb=${pkgver}"
  "lib32-tbb=${pkgver}"
  'libtbb'{,bind_2_5,malloc{,_proxy}}'.so'
)
conflicts=(
  'lib32-intel-tbb'
  'lib32-tbb'
)
replaces=(
  'lib32-intel-tbb'
  'lib32-tbb'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  '010-onetbb-fix-linkage-of-test-malloc-pure-c.patch'
)
sha512sums=('7db4a41e3b0e34a559299451f7eef633190e7e4be1819f609f773ac6b7f3d31ff5e45f3cfabd3606e280adb930d47a77a31377e5ef72c85dcb37a354d8b87e55'
            '155dca8391571f8790e77de4f6b76491e07c982b87826fbca8ab084a3f8786e55bf1fb64331fa3e9704dbf8c9c6f94547533b47845bdb50bf7f33a0294a3cd2b')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://github.com/uxlfoundation/oneTBB/issues/1735
  # https://gitlab.archlinux.org/archlinux/packaging/packages/onetbb/-/merge_requests/2
  patch -Np1 -i "${srcdir}/010-onetbb-fix-linkage-of-test-malloc-pure-c.patch"
}


build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D TBB_STRICT:BOOL=OFF
    -D TBB4PY_BUILD:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests="test_partitioner" # hangs on build server
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
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
