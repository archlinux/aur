# Maintainer: daurnimator <quae@daurnimator.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr
# Contributor: Jiří Klimeš <blueowl@centrum.cz>

pkgbase=iup
pkgname=('iup' 'lua-iup' 'lua51-iup' 'lua52-iup' 'lua53-iup')
pkgver=3.30
pkgrel=1
pkgdesc="C cross platform GUI toolkit"
arch=('x86_64')
url="https://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
makedepends=('lsb-release'
             'libcd'
             'ftgl'
             'webkit2gtk'
             'openmotif'
             'libxpm'
             'lua'
             'lua51'
             'lua52'
             'lua53'
             'lua-cd'
             'lua51-cd'
             'lua52-cd'
             'lua53-cd')

source=(
  "https://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz"
  "https://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Docs.pdf"
)

md5sums=('2f01aed0de2186c08a0e639f46c08662'
         '2ea3e7e6d462175c3a3583443678da63')

prepare() {
  # Link to libcd, libim and libftgl dynamically (they are not part of iup source code)
  sed '/ifdef USE_STATIC/{ N; s|.*\n\(\s*ifdef USE_XRENDER\)|ifdef x_UNDEFINED_x\n\1|; }' -i "$srcdir"/iup/tecmake.mak
  sed '/ifdef USE_STATIC/{ N; s|.*\n\(\s*SLIB += $(IM_LIB)/libim.a\)|ifdef x_UNDEFINED_x\n\1|; }' -i "$srcdir"/iup/tecmake.mak
  sed '/ifdef USE_STATIC/{ N; s|.*\n\(\s*SLIB += $(FTGL_LIB)/libftgl.a\)|ifdef x_UNDEFINED_x\n\1|; }' -i "$srcdir"/iup/tecmake.mak

  # Link external libraries from libim and libcd dynamically for iupvled
  sed 's|SLIB += $(CD_LIB)/libcdgl.a|LIBS += cdgl|' -i "$srcdir"/iup/srcvled/config.mak
  sed 's|SLIB += $(CD_LIB)/libcdcontextplus.a|LIBS += cdcontextplus|' -i "$srcdir"/iup/srcvled/config.mak
  sed 's|\(SLIB += $(IUP_LIB)/libiupim.a\).*|\1\nLIBS += im_process cdim|' -i "$srcdir"/iup/srcvled/config.mak

  # We want to use dynamic liblua
  sed '/NO_LUALINK = Yes/{ n; s/.*/LIBS += lua$(LUA_SFX)/; }' -i "$srcdir"/iup/srcluaconsole/config.mak
  sed '/NO_LUALINK = Yes/{ n; s/.*/LIBS += lua$(LUA_SFX)/; }' -i "$srcdir"/iup/srcluascripter/config.mak

  # Add RUN_PATH variable to be able to set DT_RUNPATH
  sed 's/$(ECHO)$(LINKER)/& $(RUN_PATH)/' -i "$srcdir"/iup/tecmake.mak
  sed 's/$(ECHO)$(LD)/& $(RUN_PATH)/' -i "$srcdir"/iup/tecmake.mak

  # Add required gmodule-2.0 to pkg-config (temporary patch to build successfully)
  sed '/PKGLIBS += $(shell pkg-config --libs gtk+-$(GTKSFX).0 gdk-$(GTKSFX).0/ { s/\(.*\))/\1 gmodule-2.0)/ }' -i "$srcdir"/iup/tecmake.mak

  # Fix building iupweb library (temporary patch to build successfully)
  sed 's|SRC = iup_webbrowser.c|SRC = iup_webbrowser.c ../src/iup_str.c|' -i "$srcdir"/iup/srcweb/config.mak
}

_lua_iup_build_helper() {
  # $1 ... Lua version ("5.1", "5.2", "5.3" or "5.4")
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
    USE_PKGCONFIG=Yes \
    USE_GTK3=Yes \
    "USE_LUA${_lua_ver//.}"=Yes \
    LUA_INC=/usr/include/lua${_lua_ver} \
    LUA_LIB=/usr/lib \
    LUA_SFX="${_lua_ver}"
}

build() {
  # Build main iup package (without Lua bindings)
  cd "$pkgname"
  DEFINES="IUP_CZECH IUP_RUSSIAN" make \
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
    iupvled \
    CD_LIB=/usr/lib \
    CD_INC=/usr/include/cd \
    IM_LIB=/usr/lib \
    IM_INC=/usr/include/im \
    ZLIB_LIB=/usr/lib \
    USE_PKGCONFIG=Yes \
    USE_GTK3=Yes

  _lua_iup_build_helper "5.4"

  _lua_iup_build_helper "5.1"

  _lua_iup_build_helper "5.2"

  _lua_iup_build_helper "5.3"
}

_lua_iup_package_helper() {
  # $1 ... Lua version ("5.1", "5.2", "5.3", "5.4", ... or "none")
  _lua_ver="$1"
  _lua_ver_nodot="${_lua_ver//.}"
  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  # install files
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}"/iup/bin/${_linux_ver}/Lua${_lua_ver_nodot}/* "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/lua/${_lua_ver}/"
  install -Dm755 "${srcdir}"/iup/lib/${_linux_ver}/Lua${_lua_ver_nodot}/*.so "${pkgdir}/usr/lib/lua/${_lua_ver}/"
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
  depends=('libcd' 'ftgl' 'webkit2gtk' 'openmotif' 'libxpm')

  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  install -m755 -d "$pkgdir"/usr/lib
  install -m755 "$srcdir"/iup/lib/${_linux_ver}/libiup* "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/bin
  install -m755 "$srcdir"/iup/bin/${_linux_ver}/[^Lua]* "$pkgdir"/usr/bin
  install -m755 -d "$pkgdir"/usr/include/iup
  install -m644 "$srcdir"/iup/include/* "$pkgdir"/usr/include/iup
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/iup-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/iup/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname
}

package_lua-iup() {
  pkgdesc="Lua 5.4 bindings for IUP GUI toolkit"
  depends=('iup' 'lua')
  optdepends=('lua-im: IM toolkit support'
              'lua-cd: Canvas Draw support')

  _lua_iup_package_helper "5.4"
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

package_lua53-iup() {
  pkgdesc="Lua 5.3 bindings for IUP GUI toolkit"
  depends=('iup' 'lua53')
  optdepends=('lua53-im: IM toolkit support'
              'lua53-cd: Canvas Draw support')

  _lua_iup_package_helper "5.3"
}
