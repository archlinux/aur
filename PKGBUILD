# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=iup-gtk
_realname=iup
pkgver=3.10.1
pkgrel=1
pkgdesc="C cross platform GUI toolkit"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
depends=('webkitgtk' 'cd' 'lua')
makedepends=('im' 'mesa' 'ffcall')
provides=('iup')
conflicts=('iup')

source=(http://sourceforge.net/projects/${_realname}/files/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz)
sha1sums=('c66a88724e31dffe9591084376dabe0e2e40ab47')

build() {
  cd "$srcdir/$_realname"
  chmod -R ugo+rwx .

  sed -i 's|$(GTK)/include/webkit-1.0|$(GTK)/include/webkit-1.0 /usr/include/webkit-1.0 /usr/include/libsoup-2.4|g' srcweb/config.mak
  sed -i 's|iup_mglplot|iup_scintilla|' srcscintilla/Makefile

  export C_INCLUDE_PATH="/usr/include/webkitgtk-1.0"

  sed -i 's|CD_BASE_HAIKU|-100|g' srccd/iup_cd.c
  sed -i 's|liblua$(LUA_SUFFIX).a|liblua$(LUA_SUFFIX).so|g' tecmake.mak

  make IM_LIB=/usr/lib CD_LIB=/usr/lib LUA_LIB=/usr/lib LUA_SUFFIX="" USE_PKGCONFIG=Yes USE_LUA52=Yes
}

package() {
  cd "$srcdir/$_realname"
	
  mkdir -p "$pkgdir/usr/"{include,lib}
  install -m644 "$srcdir/$_realname/lib/"Linux*/libiup*.a "$pkgdir/usr/lib/"
  install -m755 "$srcdir/$_realname/lib/"Linux*/libiup*.so "$pkgdir/usr/lib/"
  install "$srcdir/$_realname/include/"* "$pkgdir/usr/include/"
  install -Dm644 "$srcdir/$_realname/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

