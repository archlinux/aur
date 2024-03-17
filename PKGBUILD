# Maintainer:
# Contributor: DuckSoft <realducksoft@gmail.com>

_pkgname="across"
pkgname="$_pkgname"
pkgver=0.1.3
pkgrel=2
pkgdesc="The next GUI client for v2ray core"
url="https://github.com/ArkToria/ACross"
license=('GPL-3.0-only')
arch=('x86_64')

depends=(
  'curl'
  'fmt'
  'grpc'
  'hicolor-icon-theme'
  'protobuf'
  'qt6-5compat'
  'qt6-base'
  'qt6-quickcontrols2'
  'spdlog'
  'zxing-cpp'
)
makedepends=(
  'clang'
  'cmake'
  'gcc'
  'git'
  'gtest'
  'ninja'
  'nlohmann-json'
  'qt6-tools'
)
optdepends=(
  'v2ray: use system v2ray core.'
  'noto-fonts: default display fonts'
)

_pkgsrc="ACross-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('5010a2473a4e25f4fcd329ca6ff54912157744f53a3b890fcd6f80c177172b32')

prepare() {
  local _ver_zxing="2.2.1"

  sed -E \
    -e '/zxing-cpp/{n;s&^(\s*VERSION) [0-9\.]+$&\1 '"${_ver_zxing}"'&}' \
    -i "$_pkgsrc/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_INFO="Arch Linux - $pkgver"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
