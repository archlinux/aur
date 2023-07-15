# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Luca P <meti at lplab.net>

_name=luajson
pkgbase=lua-${_name}
pkgname=("${pkgbase}" "lua53-${_name}") 
pkgver=1.3.4
pkgrel=9
pkgdesc="JSON parser/encoder for Lua"
url="https://www.eharning.us/wiki/${_name}/"
arch=(any)
license=(MIT)
makedepends=('lua' 'lua53')
source=(https://github.com/harningt/${_name}/archive/$pkgver.tar.gz)
sha1sums=('2ea25e4147ad661ff3b6d0427439bf99c06eb46d')

prepare() {
  sed -i 's/local DecimalLpegVersion = lpeg.version and tonumber(lpeg.version():match("^(%d+%.%d+)")) or 0.7/local DecimalLpegVersion = 1.1/g' "${srcdir}/${_name}-${pkgver}/lua/json/decode/util.lua"
}

package_lua-luajson() {
  depends=(lua-lpeg)
  LUAVERSION=$(lua -v | grep -P -o '([0-9]+\.[0-9]+)')
  echo ${LUAVERSION}
  cd ${srcdir}/${_name}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)'/share/lua/${LUAVERSION} \
    INSTALL_CMOD='$(INSTALL_TOP)'/lib/lua/${LUAVERSION} install
  install -Dt "$pkgdir/usr/share/licenses/$pkgbase" -m644 LICENSE
}
package_lua53-luajson() {
  depends=(lua53-lpeg)
  cd ${srcdir}/${_name}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" \
    INSTALL_LMOD='$(INSTALL_TOP)'/share/lua/5.3 \
    INSTALL_CMOD='$(INSTALL_TOP)'/lib/lua/5.3 install
  install -Dt "$pkgdir/usr/share/licenses/lua53-${_name}" -m644 LICENSE
}
