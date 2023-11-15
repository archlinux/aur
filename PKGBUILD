# Maintainer: Stefen Wakefield <me@xstefen.dev>
_pkgname="xmap"
pkgname="$_pkgname-git"
pkgver=2.0.0.r15.gf30b823
pkgrel=2
pkgdesc="Fast Internet-wide IPv6 & IPv4 network scanner"
arch=('x86_64')
url="https://github.com/idealeer/xmap"
license=('Apache')
depends=('gmp' 'gengetopt' 'libpcap' 'json-c' 'libunistring')
makedepends=('cmake' 'flex' 'byacc' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("git+https://github.com/idealeer/xmap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -E 's|DESTINATION sbin|DESTINATION bin|' -i "$_pkgsrc/src/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DENABLE_DEVELOPMENT=OFF
    -DENABLE_LOG_TRACE=OFF
    -Wno-dev
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
