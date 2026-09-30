# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Jordan Rudess <jrudess@gmail.com>

_pkgname=slang
pkgname=$_pkgname-verilog
pkgver=12.0
pkgrel=1
pkgdesc="SystemVerilog Language Services"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
depends=(
  'fmt'
  'mimalloc'
  'glibc'
  'libstdc++'
  'libgcc'
  'boost'
  'tomlplusplus'
)
makedepends=(
  'cmake'
  'gcc'
)
checkdepends=('catch2')
provides=('slang-verilog')
conflicts=('slang-verilog-git')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/MikePopoloski/slang/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64b3eb9d38ee126e009cbb8da0cfa6f68d970334e52ba084ad7c68e4b5fa804c')

build() {
  local cmake_options=(
    -B build
    -S $_pkgname-$pkgver
    -W no-author
    -D CMAKE_CXX_COMPILER=g++
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D BUILD_SHARED_LIBS=ON
    -D SLANG_USE_MIMALLOC=ON
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D CMAKE_CXX_SCAN_FOR_MODULES=OFF
    -D SLANG_USE_SYSTEM_FMT=ON
    -D SLANG_USE_SYSTEM_BOOST=ON
    -D SLANG_USE_MIMALLOC=ON
    -D SLANG_INCLUDE_TOOLS=ON
    -D SLANG_INCLUDE_TESTS=OFF
    -D SLANG_INCLUDE_INSTALL=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  cmake -S "$_pkgname-$pkgver" -B build \
    -D SLANG_INCLUDE_TESTS=ON

  cmake --build build

  ctest \
    --test-dir build \
    --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
