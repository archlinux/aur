# Maintainer: Ben Blain <ben[at]servc[dot]eu>

pkgbase='lua-gd'
pkgname=('lua-gd' 'lua51-gd' 'lua52-gd' 'lua53-gd' 'lua-gd-docs') # lua54-gd
pkgver='2_0_33r3'
pkgrel=2
_commit=2ce8e478a8591afd71e607506bc8c64b161bbd30
pkgdesc='GD graphics library bindings for Lua'
url='https://github.com/ittner/lua-gd'
arch=('x86_64')
license=('MIT')
depends=('gd>=2.0.33')
makedepends=('git')
optdepends=('lua' 'lua51' 'lua52' 'lua53') # 'lua54'
#makedepends=('lua' 'lua51' 'lua52' 'lua53' 'git') # 'lua54'
source=("git+https://github.com/ittner/lua-gd.git#commit=${_commit}")
sha512sums=('SKIP')

_luaversions=(5.1 5.2 5.3 5.4)
_luaversioncurrent="${_luaversions[-1]}"

# Cache original NOARCHIVE value to restore for later
_noarchive=${NOARCHIVE}

prepare() {
  cd "${srcdir}/${pkgbase}"
  sed -i -e 's/^CFLAGS=/CFLAGS+=/' -e 's/^LFLAGS=/LFLAGS+=/' Makefile
}

build() {
  cd "${srcdir}/${pkgbase}"
  for v in ${_luaversions[@]}; do
    local p=''; [[ "${v}" != "${_luaversioncurrent}" ]] && p+="${v}"
    if ! pkg-config "lua${p}" --exists; then
      warning "Lua version ${v} is required to build lua${p/\./}-gd. Install the \"lua${p/\./}\" package if you wish to continue."
      continue 2
    fi
    msg "Building for Lua version ${v}:"
    mkdir -p "out/${v}"
    CFLAGS="$CPPFLAGS $CFLAGS" LFLAGS="$LDFLAGS" make LUABIN="lua${v}" LUAPKG="lua${v}" gd.so
    mv "gd.so" "out/${v}/gd.so"
    rm gd.lo
  done
}

check() {
  cd "${srcdir}/${pkgbase}"
  for v in ${_luaversions[@]}; do
    if [[ ! -e "out/${v}/gd.so" ]]; then
      msg "Could not find compiled output for testing Lua version ${v}."
      continue 2
    fi
    msg "Testing with Lua version ${v}:"
    cd "out/${v}/"
    lua${v} "${srcdir}/${pkgbase}/test_features.lua" || warning "Check failed with Lua version ${v}"
    cd "${srcdir}/${pkgbase}"
  done
}

_package() {
  cd "${srcdir}/${pkgbase}"
  local v="${1}"
  msg "Packaging for Lua version: ${v}"

  if [[ ! -e "out/${v}/gd.so" ]]; then
    warning "Unable to find compiled library. Aborting."
    return 1
  fi

  local destdir="$(pkg-config lua${v} --variable=INSTALL_CMOD)"
  install -D -s "out/${v}/gd.so" "${pkgdir}/${destdir}/gd.so"

  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_has_lua_version() {
  local p=''; [[ "${1}" != "${_luaversioncurrent}" ]] && p+="${1}"
  if ! pkg-config "lua${p}" --exists; then
    warning "Lua version ${1} is required to build the \"lua${p/\./}-gd\" package. Install the \"lua${p/\./}\" package, if you intend to do so."
    NOARCHIVE=1

    # Return either:
    # 2: Exit failure; or
    # 1: Continue building other packages; or
    # 0: Continue packaging.
    return 1
  fi
}

package_lua-gd() {
  pkgdesc+=' 5.4'
  depends+=('lua')
  optdepends=()

  NOARCHIVE=${_noarchive}
  _check_has_lua_version '5.4' || return $(($?-1))

  _package '5.4'
}

package_lua53-gd() {
  pkgdesc+=' 5.3'
  depends+=('lua53')
  optdepends=()

  NOARCHIVE=${_noarchive}
  _check_has_lua_version '5.3' || return $(($?-1))

  _package '5.3'
}

package_lua52-gd() {
  pkgdesc+=' 5.2'
  depends+=('lua52')
  optdepends=()

  NOARCHIVE=${_noarchive}
  _check_has_lua_version '5.2' || return $(($?-1))

  _package '5.2'
}

package_lua51-gd() {
  pkgdesc+=' 5.1'
  depends+=('lua51')
  optdepends=()

  NOARCHIVE=${_noarchive}
  _check_has_lua_version '5.1' || return $(($?-1))

  _package '5.1'
}

package_lua-gd-docs() {
  NOARCHIVE=${_noarchive}
  pkgdesc="Documentation for the ${pkgdesc}"
  depends=()
  # Earlier versions of lua do not provide package `lua` of specific version
  optdepends=('lua>=5.1' 'lua-gd')
  arch=('any')

  cd "${srcdir}/${pkgbase}"
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 doc/* -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -Dm 644 demos/* -t "${pkgdir}/usr/share/${pkgbase}/demos"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
