# Contributor: daurnimator <quae@daurnimator.com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>
# Contributor: maoserr

pkgname=iup
pkgver=3.21
pkgrel=1
pkgdesc="C cross platform GUI toolkit"
arch=('i686' 'x86_64')
url="http://www.tecgraf.puc-rio.br/iup/"
license=('MIT')
makedepends=('lsb-release' 'lua')
depends=('libcd' 'libim' 'gtk3' 'libpng' 'ftgl' 'zlib' 'freetype2' 'cairo' 'pango' 'glib2' 'webkitgtk')
options=(staticlibs)

source=(
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Sources.tar.gz"
  "http://downloads.sourceforge.net/project/iup/${pkgver}/Docs%20and%20Sources/iup-${pkgver}_Docs.pdf"
)

md5sums=('146fa386c212892a5fe917c671056aeb'
         '78ab12cd403409930dc00abfd2165685')

build() {
  cd "$pkgname"
  # iup_plot not built due to libcd package not installing libcdcontextplus
  # iup_view not built due to needing static libraries
  # iuplua5 and iupconsole not built due to libcd package not installing libcdlua53
  make iup iupcd iupcontrols iupgl iupglcontrols iupmatrixex iup_mglplot iup_scintilla iupim iupimglib iupweb iuptuio ledc \
    CD_LIB=/usr/lib \
    CD_INC=/usr/include/cd \
    IM_LIB=/usr/lib \
    IM_INC=/usr/include/im \
    ZLIB_LIB=/usr/lib \
    IUPLIB="$srcdir/$pkgname"/lib \
    USE_GTK3=Yes \
    USE_LUA53=Yes \
    LUA_LIB=/usr/lib \
    NO_LUALINK=1
}

package() {
  install -m755 -d $pkgdir/usr/lib
  install -m644 iup/lib/*/* $pkgdir/usr/lib
  install -m755 -d $pkgdir/usr/include/iup
  install -m644 iup/include/* $pkgdir/usr/include/iup
  install -m755 -d $pkgdir/usr/share/$pkgname
  install -m644 iup-${pkgver}_Docs.pdf $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/iup
  install -m644 $srcdir/iup/COPYRIGHT $pkgdir/usr/share/licenses/iup
}
