# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="graphite"
pkgname="lib32-${_name}"
pkgver=1.3.15
pkgrel=2
pkgdesc='A "smart font" system to handle the complexities of lesser-known languages of the world (32-bit)'
arch=('x86_64')
url="https://graphite.sil.org"
_url="https://github.com/silnrsi/$_name"
license=('LGPL-2.1-or-later OR MPL-2.0 OR GPL-2.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-glibc')
makedepends=('cmake' 'lib32-freetype2' 'lib32-gcc-libs')
provides=("lib${_name}2.so")
_pkgsrc="graphite2-$pkgver"
source=("$_url/releases/download/$pkgver/$_pkgsrc.tgz")
sha256sums=('c6bc8b4252724665297f7cad0c55897285c673f9b8e6db3522ace833593fe0b1')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -B "$_pkgsrc/build"
    -S "$_pkgsrc"
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    # -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D LIB_SUFFIX:STRING='32'
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_SKIP_INSTALL_RPATH:BOOL=ON
    -D GRAPHITE2_COMPARE_RENDERER:BOOL=OFF
    -D GRAPHITE2_VM_TYPE=direct
  )

  cd "$srcdir"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  local ctest_exclude_regex="nametabletest" # fails with CFLAGS=+" -march=native"
  local ctest_options=(
    --test-dir "$_pkgsrc/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "$srcdir"
  ctest "${ctest_options[@]}"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${_pkgsrc}/build"

  cd "$pkgdir/usr"
  rm -rf "bin" "include" "share"
}
