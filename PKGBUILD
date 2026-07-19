# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: Llewelyn Trahaearn <woefulderelict [at] gmail [dot] com>
# Contributor: Peter Lamby <peterlamby [at] web [dot] de>
# Contributor: Stéphane Gaudreault <stephane [at] archlinux [dot] org>
# Contributor: Thomas Dziedzic <gostrc [at] gmail [dot] com>
# Contributor: Denis Martinez <deuns.martinez [at] gmail [dot] com>

_Name="oneTBB"
_name="${_Name,,}"
pkgname="lib32-$_name"
pkgver=2023.1.0
pkgrel=1
pkgdesc="oneAPI Threading Building Blocks - a high level abstract threading library (32-bit)"
arch=('x86_64')
url="https://uxlfoundation.github.io/oneTBB/"
_url="https://github.com/uxlfoundation/$_Name"
license=('Apache-2.0')
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-hwloc'
)
makedepends=('cmake')
provides=(
  "lib32-intel-tbb=${pkgver}"
  "lib32-tbb=${pkgver}"
  'libtbb'{,bind_2_5,malloc{,_proxy}}'.so'
)
conflicts=('lib32-intel-tbb' 'lib32-tbb')
replaces=('lib32-intel-tbb' 'lib32-tbb')
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  '010-onetbb-fix-linkage-of-test-malloc-pure-c.patch'
)
b2sums=('78d91cc0eb6bd6d1d06cde1902a1d6c335a30f0ddc0a4976bc4878a31d037c645238774f68ee40be86b55b6d2f17621cd79786e0e0acc58c0ac78c451a44b211'
        '98e8087a3dff8487428a3f7761339f96a385725b09134c5fcaf3400c7386e5c62eb93bd40340f3a48cc5825b80f79dc954c61e4951f081d5bf6e26353b1f399b')

prepare() {
  # https://github.com/uxlfoundation/oneTBB/issues/1735
  # https://gitlab.archlinux.org/archlinux/packaging/packages/onetbb/-/merge_requests/2
  patch -Np1 -d "$srcdir/$_pkgsrc" -i "$srcdir/010-onetbb-fix-linkage-of-test-malloc-pure-c.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D TBB_STRICT:BOOL=OFF
    -D TBB4PY_BUILD:BOOL=OFF
  )

  cmake -B "$_pkgsrc/build" -S "$_pkgsrc" "${cmake_options[@]}"
  cmake --build "$_pkgsrc/build"
}

check() {
  local excluded_tests="test_partitioner" # hangs on build server
  local ctest_flags=(
    --test-dir "$_pkgsrc/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "$excluded_tests"
  )

  ctest "${ctest_flags[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$_pkgsrc/build"

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"
}
