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
pkgver=2023.2.0
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
  '020-onetbb-fix-python-test.patch'::'https://github.com/uxlfoundation/oneTBB/commit/518d57b48adb48fec3aaf18b931d11d868ec646b.patch'
)
b2sums=('786a02f742015903c6c6fd852552d272912f4740e15847618a86e217f71f5419d25e1031afee585313896444934eb04b903a685b1448b755d56f701afe9be2ce'
        '466914a40d09c83ec6f52dbabf1db67313d4eed8aa4c7e77305b0bdc5b61cf0aac527d064825570381121b4082584bd0b59bf92f447f5f44ba79b2b2670191f4'
        '772ddee5447f03bacc5e6e1d1e0d33e3866dada50b210fd5dd578c09a995d0d41654f7d556e5ac1e246f5037c3ede6ea836e63609f0b54d997d46fead0a15094')

prepare() {
  # https://github.com/uxlfoundation/oneTBB/issues/1735
  # https://gitlab.archlinux.org/archlinux/packaging/packages/onetbb/-/merge_requests/2
  patch -Np1 -d "$srcdir/$_pkgsrc" -i "$srcdir/010-onetbb-fix-linkage-of-test-malloc-pure-c.patch"

  patch -Np1 -d "$srcdir/$_pkgsrc" -i "$srcdir/020-onetbb-fix-python-test.patch"
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
    -D TCM_STRICT:BOOL=OFF
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
