# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: SneakySnake <radiantstatue@gmail.com>
# Contributor: Karro <karolina.lindqvist@kramnet.se>

pkgbase=libim
pkgname=('libim' 'lua-im' 'lua51-im' 'lua52-im' 'lua53-im')
pkgver=3.15
pkgrel=4
pkgdesc="Toolkit for digital imaging"
arch=('i686' 'x86_64')
url="https://www.tecgraf.puc-rio.br/im/"
makedepends=('lsb-release' 'lua' 'lua51' 'lua52' 'lua53' 'fftw')
license=('MIT')
source=(
  "https://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Sources.tar.gz"
  "https://downloads.sourceforge.net/project/imtoolkit/${pkgver}/Docs%20and%20Sources/im-${pkgver}_Docs.pdf"
)
md5sums=('9fb18d151dd8e7e540aa76ae409c37b2'
         '794196d4e6d48e3257d7357d7ea62f94')
noextract=(im-${pkgver}_Sources.tar.gz)

prepare() {
  tar xf im-${pkgver}_Sources.tar.gz # sources have a problem with bsdtar, use gnutar instead

  sed -i -e 's/JAS_HAVE_UNISTD_H/HAVE_UNISTD_H/' "$srcdir"/im/src/libjasper2/base/jas_stream.c

  # ensure proper building in parallel (specifying targets' dependencies)
  sed -i 's/^im_.*/\0 im/g;s/^im_fftw3.*/\0 im_process/g;s/^imlua_.*/\0 imlua5/g' "$srcdir"/im/src/Makefile
}

build() {
  cd "$srcdir"/im/src
  echo 'Building libim without Lua'
  make -k im im_jp2 im_process im_process_omp im_fftw3

  echo 'Building Lua 5.4 bindings'
  make -k imlua5 imlua_jp25 imlua_process5 imlua_process_omp5 imlua_fftw35 \
   STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.4,--enable-new-dtags,--as-needed" \
   USE_LUA54=Yes LUA_SFX=5.4

  echo 'Building Lua 5.3 bindings'
  make -k imlua5 imlua_jp25 imlua_process5 imlua_process_omp5 imlua_fftw35 \
   STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.3,--enable-new-dtags,--as-needed" \
   LUA_INC=/usr/include/lua5.3 \
   USE_LUA53=Yes LUA_SFX=5.3

  echo 'Building Lua 5.2 bindings'
  make -k imlua5 imlua_jp25 imlua_process5 imlua_process_omp5 imlua_fftw35 \
   STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.2,--enable-new-dtags,--as-needed" \
   LUA_INC=/usr/include/lua5.2 \
   USE_LUA52=Yes LUA_SFX=5.2

  echo 'Building Lua 5.1 bindings'
  make -k imlua5 imlua_jp25 imlua_process5 imlua_process_omp5 imlua_fftw35 \
   STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.1,--enable-new-dtags,--as-needed" \
   LUA_INC=/usr/include/lua5.1 \
   USE_LUA51=Yes LUA_SFX=5.1
}

package_libim() {
  pkgdesc="Imaging toolkit library"
  depends=('zlib' 'libpng')

  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  install -m755 -d "$pkgdir"/usr/lib
  install -m644 "$srcdir"/im/lib/${_linux_ver}/libim* "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/im-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/im
  install -m644 "$srcdir"/im/include/* "$pkgdir"/usr/include/im
  install -Dm644 "$srcdir"/im/COPYRIGHT "$pkgdir"/usr/share/licenses/libim/LICENSE
}

_lua_im_package_helper() {
  # $1 ... Lua version ("5.1", "5.2", "5.3" or "5.4")

  _lua_ver=$1
  _lua_ver_nodot=`echo $1 | cut -c1,3`
  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 "$srcdir"/im/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -d "$pkgdir"/usr/lib/lua/${_lua_ver}
  install -Dm644 "$srcdir"/im/lib/${_linux_ver}/Lua${_lua_ver_nodot}/*.so "$pkgdir"/usr/lib/lua/${_lua_ver}

  # create symlinks required for Lua modules
  for name in \
    imlua \
    imlua_process \
    imlua_process_omp \
    imlua_jp2 \
    imlua_fftw ; do
      _lib=lib${name}${_lua_ver_nodot}.so
      ln -s /usr/lib/lua/${_lua_ver}/${_lib} "${pkgdir}"/usr/lib/lua/${_lua_ver}/${name}.so
  done
}

package_lua-im() {
  pkgdesc="Lua (5.4) bindings for IM toolkit"
  depends=('libim')

  _lua_im_package_helper "5.4"
}

package_lua53-im() {
  pkgdesc="Lua (5.3) bindings for IM toolkit"
  depends=('libim')

  _lua_im_package_helper "5.3"
}

package_lua52-im() {
  pkgdesc="Lua (5.2) bindings for IM toolkit"
  depends=('libim')

  _lua_im_package_helper "5.2"
}

package_lua51-im() {
  pkgdesc="Lua (5.1) bindings for IM toolkit"
  depends=('libim')

  _lua_im_package_helper "5.1"
}

# vim:set ts=2 sw=2 et:
