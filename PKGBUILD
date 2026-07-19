# Maintainer:
# Contributor: Hoang Nguyen <toi at doclai dot com>

_pkgname="nchat-no-telegram"
pkgname="$_pkgname"
pkgver=5.17.26
pkgrel=1
pkgdesc="Console-based chat client with support for Telegram"
url="https://github.com/d99kris/nchat"
license=('MIT')
arch=('x86_64')

depends=(
  'file'
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

conflicts=('nchat')
provides=('nchat')
replaces=('nchat')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('0c8730052d1c4ca2b41102eb433bdae8643b0e261a6dbaab8c0aca9f2971465e')

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
    -DHAS_DUMMY=OFF
    -DHAS_TELEGRAM=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

