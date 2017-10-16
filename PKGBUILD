pkgname=lumail2
pkgver=3.1
pkgrel=1
pkgdesc="Console-based mail-client with integrated Lua scripting support"
arch=('i686' 'x86_64')
url="https://lumail.org"
license=('GPL')
depends=('lua' 'gmime' 'file' 'perl')
_LVER=lua53
_LUA_VERSION=5.3
source=(
  16c437fd68119c645c615032c40415bdedccd1f9.patch
  "https://lumail.org/download/lumail-$pkgver.tar.gz"{,.asc}
)
validpgpkeys=('D516C42B1D0E3F854CAB97231909D4080C626242') # Steve Kemp
sha256sums=('67379a546c86e72aad51e2ce266ab37c79fab19f95fe67a1a575c635ca261582'
            '8497a8b1028001df684c7fce2820898a30fb39938a467216477c5401dcb9476e'
            'SKIP')

build() {
  cd lumail-$pkgver
  make LUA_VERSION=$_LUA_VERSION LVER=$_LVER
}

check() {
  cd lumail-$pkgver
  make LUA_VERSION=$_LUA_VERSION LVER=$_LVER test test-lua
}

prepare() {
  cd lumail-$pkgver
  # fix installation, see https://github.com/lumail/lumail/pull/308
  sed -i '/if there is an old config/,+1d' Makefile

  patch < "${srcdir}/16c437fd68119c645c615032c40415bdedccd1f9.patch"

  # https://github.com/lumail/lumail/issues/327
  sed -i '/image\/png/d' t/test.mime.lua
}

package() {
  cd lumail-$pkgver
  make DESTDIR="$pkgdir" LUA_VERSION=$_LUA_VERSION LVER=$_LVER install
}
