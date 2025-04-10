# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

_Name="oneTBB"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=2022.1.0
pkgrel=1
pkgdesc="oneAPI Threading Building Blocks - a high level abstract threading library (32-bit)"
arch=('x86_64')
url="https://uxlfoundation.github.io/oneTBB/"
_url="https://github.com/uxlfoundation/${_Name}"
license=('Apache-2.0')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-hwloc' "${_name}>=${pkgver}")
makedepends=('cmake>=3.5')
provides=("lib32-intel-tbb=${pkgver}" "lib32-tbb=${pkgver}" 'libtbb'{,bind_2_5,malloc{,_proxy}}'.so')
conflicts=('lib32-intel-tbb' 'lib32-tbb')
replaces=('lib32-intel-tbb' 'lib32-tbb')
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('7582748f7d0e0ab46ea6ee7771dfaf7fc08ca7ab7f274fb3373eae0e3411aaafbac192ece15008d9a3d9e8566f8737f96f3f4b5ccf11449ac089d5cd9ebb9eab')

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
    -DTBB_STRICT:BOOL=OFF
    -DTBB4PY_BUILD:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests="test_partitioner"
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
