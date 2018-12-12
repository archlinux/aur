# Maintainer: daurnimator <quae@daurnimator.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr
# Contributor: Jiří Klimeš <blueowl@centrum.cz>

pkgbase=iup
pkgname=('iup' 'lua-iup' 'lua51-iup' 'lua52-iup')
pkgver=3.25
pkgrel=2
pkgdesc="C cross platform GUI toolkit"
arch=('x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
makedepends=('lsb-release'
             'libcd'
             'ftgl'
             'webkitgtk'
             'openmotif'
             'libxpm'
             'lua'
             'lua51'
             'lua52'
             'lua-cd'
             'lua51-cd'
             'lua52-cd')

source=(
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Docs.pdf"
)

md5sums=('cecb337e3135519492466034c9d8d78b'
         'a814d6e7d88cdb6aca31dfc4771c3bd1')

prepare() {
  # Link iupview statically
  sed 's/USE_STATIC = Yes/USE_STATIC =/' -i "$srcdir"/iup/srcview/config.mak

  # We want to use dynamic liblua
  sed '/NO_LUALINK = Yes/{ n; s/.*/LIBS += lua$(LUA_SFX)/; }' -i "$srcdir"/iup/srcluaconsole/config.mak
  sed '/NO_LUALINK = Yes/{ n; s/.*/LIBS += lua$(LUA_SFX)/; }' -i "$srcdir"/iup/srcluascripter/config.mak

  # Add RUN_PATH variable to be able to set DT_RUNPATH
  sed 's/$(ECHO)$(LINKER)/& $(RUN_PATH)/' -i "$srcdir"/iup/tecmake.mak
  sed 's/$(ECHO)$(LD)/& $(RUN_PATH)/' -i "$srcdir"/iup/tecmake.mak
}

_lua_iup_build_helper() {
  # $1 ... Lua version ("5.1", "5.2" or "5.3")
  _lua_ver="$1"

  make \
    iuplua5 \
    iupluaconsole \
    iupluascripter \
    RUN_PATH="-Wl,-rpath=/usr/lib/lua/${_lua_ver},--enable-new-dtags,--as-needed" \
    IM_INC=/usr/include/im \
    IM_LIB=/usr/lib \
    CD_INC=/usr/include/cd \
    CD_LIB=/usr/lib \
    IMLUA_LIB="/usr/lib/lua/${_lua_ver}" \
    CDLUA_LIB="/usr/lib/lua/${_lua_ver}" \
    ZLIB_LIB=/usr/lib \
    USE_GTK3=Yes \
    "USE_LUA${_lua_ver//.}"=Yes \
    LUA_INC=/usr/include/lua${_lua_ver} \
    LUA_LIB=/usr/lib \
    LUA_SFX="${_lua_ver}"
}

build() {
  # Build main iup package (without Lua bindings)
  cd "$pkgname"
  make \
    iup \
    iupgtk \
    iupmot \
    iupcd \
    iupcontrols \
    iupgl \
    iup_plot \
    iup_mglplot \
    iup_scintilla \
    iupglcontrols \
    iupim \
    iupole \
    iupweb \
    iuptuio \
    iupimglib \
    ledc \
    iupview \
    CD_LIB=/usr/lib \
    CD_INC=/usr/include/cd \
    IM_LIB=/usr/lib \
    IM_INC=/usr/include/im \
    ZLIB_LIB=/usr/lib \
    USE_GTK3=Yes

  _lua_iup_build_helper "5.3"

  _lua_iup_build_helper "5.1"

  _lua_iup_build_helper "5.2"
}

_lua_iup_package_helper() {
  # $1 ... Lua version ("5.1", "5.2", "5.3", ... or "none")
  _lua_ver="$1"
  _lua_ver_nodot="${_lua_ver//.}"

  # install files
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/iup/bin/Linux*_??/Lua${_lua_ver_nodot}/*" "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/lua/${_lua_ver}/"
  install -Dm755 "${srcdir}/iup/lib/Linux*_??/Lua${_lua_ver_nodot}/*.so" "${pkgdir}/usr/lib/lua/${_lua_ver}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/iup/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}"

  # create symlinks required for Lua modules
  for name in \
    iuplua \
    iupluacd \
    iupluagl \
    iupluaweb \
    iupluatuio \
    iupluaim \
    iupluaimglib \
    iupluacontrols \
    iupluaglcontrols \
    iuplua_mglplot \
    iuplua_plot \
    iuplua_scintilla \
    iupluascripterdlg ; do
      _lib="lib${name}${_lua_ver_nodot}.so"
      ln -s "/usr/lib/lua/${_lua_ver}/${_lib}" "${pkgdir}/usr/lib/lua/${_lua_ver}/${name}.so"
  done
}

package_iup() {
  pkgdesc="C cross platform GUI toolkit"
  depends=('libcd' 'ftgl' 'webkitgtk' 'openmotif' 'libxpm')

  install -m755 -d "$pkgdir"/usr/lib
  install -m755 "$srcdir"/iup/lib/Linux*_??/libiup* "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 "$srcdir"/iup/bin/Linux*_??/[^Lua]* "$pkgdir"/usr/bin || true
  install -m755 -d "$pkgdir"/usr/include/iup
  install -m644 "$srcdir"/iup/include/* "$pkgdir"/usr/include/iup
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/iup-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/iup/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname
}

package_lua-iup() {
  pkgdesc="Lua 5.3 bindings for IUP GUI toolkit"
  depends=('iup' 'lua')
  optdepends=('lua-im: IM toolkit support'
              'lua-cd: Canvas Draw support')

  _lua_iup_package_helper "5.3"
}

package_lua51-iup() {
  pkgdesc="Lua 5.1 bindings for IUP GUI toolkit"
  depends=('iup' 'lua51')
  optdepends=('lua51-im: IM toolkit support'
              'lua51-cd: Canvas Draw support')

  _lua_iup_package_helper "5.1"
}

package_lua52-iup() {
  pkgdesc="Lua 5.2 bindings for IUP GUI toolkit"
  depends=('iup' 'lua52')
  optdepends=('lua52-im: IM toolkit support'
              'lua52-cd: Canvas Draw support')

  _lua_iup_package_helper "5.2"
}
