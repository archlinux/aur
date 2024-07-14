# Maintainer: Philipp Joram <mail at phijor dot me>
# Contributor: Petr Špaček <pspacek at isc dot org>

_lua_version=5.4
_lua_name=luaprompt

pkgname=(lua-${_lua_name} lua53-${_lua_name} lua52-${_lua_name} lua51-${_lua_name})
pkgver=0.8
pkgrel=1
pkgdesc="An embeddable Lua command prompt as well as a stand-alone interpreter with pretty-printing and autocompletion."
arch=(i686 x86_64)
url="https://github.com/dpapavas/luaprompt"
license=('MIT')
makedepends=(lua lua53 lua52 lua51)
depends=("lua-argparse")
source=("${pkgname}-${pkgver}::https://github.com/dpapavas/luaprompt/archive/v${pkgver}.tar.gz")
# Upstream does not provide source archives with a stable checksum
md5sums=('SKIP')

_package() {
  cp -a "$srcdir/$_lua_name-$pkgver" "$srcdir/$_lua_name-$pkgver-$1"
  cd "$srcdir/$_lua_name-$pkgver-$1"

  if [[ $1 != $_lua_version ]]; then
    depends=("lua${1/\./}-argparse")
    sed -i 's=\$(BINDIR)/luap=$(BINDIR)/luap'"$1=" Makefile
    sed -i 's=\$(MAN1DIR)/luap.1=$(MAN1DIR)/luap'"$1.1=" Makefile
    sed -i '1s=lua=lua'"$1"'=' luap.lua
  fi

  make PREFIX=/usr \
    VERSION=$1

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" \
    VERSION=$1 install

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-luaprompt() {
  _package 5.1
}

package_lua52-luaprompt() {
  _package 5.2
}

package_lua53-luaprompt() {
  _package 5.3
}

package_lua-luaprompt() {
  _package $_lua_version
}
# vim:set ts=2 sw=2 et:
