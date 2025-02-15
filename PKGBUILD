# Maintainer:
# Contributor: Hoang Nguyen <toi at doclai dot com>

_pkgname="nchat"
pkgname="$_pkgname"
pkgver=5.5.14
pkgrel=1
pkgdesc="console-based chat client with support for Telegram"
url="https://github.com/d99kris/nchat"
license=('MIT')
arch=('x86_64')

depends=(
  'ncurses'
  'openssl'
  'sqlite'
  'zlib'
)
makedepends=(
  'cmake'
  'go'
  'gperf'
  'ninja'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('70c8519eeac3c8210731c11b0255e0c638d1c57ab168c833585cb737c0d05175')

build() {
  export GOFLAGS+=' -buildvcs=false'

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_MANDIR='/usr/share/man'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
