# Maintainer: Ben Blain <ben[at]servc[dot]eu>

pkgbase='lua-gd'
pkgname=('lua-gd' 'lua51-gd' 'lua52-gd' 'lua53-gd' 'lua-gd-docs') # lua54-gd
pkgver='2_0_33r3'
pkgrel=1
_commit=2ce8e478a8591afd71e607506bc8c64b161bbd30
pkgdesc='GD graphics library bindings for Lua'
url='https://github.com/ittner/lua-gd'
arch=('x86_64')
license=('MIT')
depends=('gd')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'git') # 'lua54'
source=("git+https://github.com/ittner/lua-gd.git#commit=${_commit}")
sha512sums=('SKIP')

_luaversions=(5.1 5.2 5.3 5.4)
_luaversioncurrent="${_luaversions[-1]}"

prepare() {
  cd "${srcdir}/${pkgbase}"
  sed -i -e 's/^CFLAGS=/CFLAGS+=/' -e 's/^LFLAGS=/LFLAGS+=/' Makefile
}

build() {
  cd "${srcdir}/${pkgbase}"
  for v in ${_luaversions[@]}; do
    echo "Building for Lua version: ${v}"
    CFLAGS="$CPPFLAGS $CFLAGS" LFLAGS="$LDFLAGS" make all LUABIN="lua${v}" LUAPKG="lua${v}"
    mv "gd.so" "gd${v/\./}.so"
    rm gd.lo
  done
}

_package() {
  cd "${srcdir}/${pkgbase}"
  local v="${1}"
  echo "Packaging for Lua version: ${v}"

  local destdir="$(pkg-config lua${v} --variable=INSTALL_CMOD)"
  install -D "gd${v/\./}.so" "${pkgdir}/${destdir}/gd.so"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_try_package_lua_version() {
  pkg-config "lua${1}" --exists || return 1

  pkgdesc+=" ${1}"
  [[ "${1}" != "${_luaversioncurrent}" ]] && depends+=("lua${1/\./}") || depends+=("lua")

  _package "${1}"
}

package_lua-gd() {
  _try_package_lua_version "${_luaversioncurrent}"
}

package_lua51-gd() {
  _try_package_lua_version "5.1"
}

package_lua52-gd() {
  _try_package_lua_version "5.2"
}

package_lua53-gd() {
  _try_package_lua_version "5.3"
}

package_lua-gd-docs() {
  pkgdesc+=" documentation"
  depends=('lua')
  arch=('any')

  cd "${srcdir}/${pkgbase}"
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 doc/* -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 demos/* -t "${pkgdir}/usr/share/${pkgbase}/demos"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
