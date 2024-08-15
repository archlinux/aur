# Maintainer: Stefen Wakefield <me@xstefen.dev>

_pkgname="xmap"
pkgname="$_pkgname-git"
pkgver=2.0.1.r13.g15f628c
pkgrel=1
pkgdesc="Fast Internet-wide IPv6 & IPv4 network scanner"
url="https://github.com/idealeer/xmap"
license=('Apache-2.0')
arch=('x86_64')

depends=('gmp' 'gengetopt' 'libpcap' 'json-c' 'libunistring')
makedepends=('cmake' 'flex' 'byacc' 'git')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("git+https://github.com/idealeer/xmap.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  sed -E 's|DESTINATION sbin|DESTINATION bin|' -i "$_pkgsrc/src/CMakeLists.txt"

  # https://github.com/idealeer/xmap/issues/23
  sed -E '/source_ip_addresses/s& = NULL,& = 0,&' -i "$_pkgsrc/src/state.c"

  # https://github.com/idealeer/xmap/issues/24
  sed '1 i#include <sys/time.h>' \
    -i "$_pkgsrc"/src/probe_modules/module_dns*.c
}

build() {
  export CFLAGS
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=?/_FORTIFY_SOURCE=2}"

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
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
