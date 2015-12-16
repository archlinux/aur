# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

_pkgname=qjoypad
pkgname=${_pkgname}-svn
pkgver=133
pkgrel=1
pkgdesc='Program with a QT interface that converts gamepad/joystick events into key strokes and mouse actions in XWindows (SVN-version)'
arch=('i686' 'x86_64')
url='http://qjoypad.sourceforge.net/'
license=('GPL')
conflicts=('qjoypad')
provides=('qjoypad')
depends=('qt4' 'libxtst')
makedepends=('subversion')
install=${_pkgname}.install

source=("svn+http://qjoypad.svn.sourceforge.net/svnroot/${_pkgname}/trunk"
	"${_pkgname}.desktop"
	'x11.patch')

md5sums=('SKIP'
         'a90839531415df510410558c47076cfc'
         'f6e8a44d0a4b53c7f28e6b98beb265de')

pkgver() {
  cd "${srcdir}/trunk"
  svnversion | tr -d [A-z]
}

prepare() {
  cd "${srcdir}/trunk/src"
  patch -p3 <../../x11.patch
  sed -i 's/ qmake / qmake-qt4 /' config
}

package() {
  cd "${srcdir}/trunk/src"

  ./config --prefix=/usr --install-dir=$pkgdir --devdir=/dev/input --debug --qmake4bin=/usr/lib/qt4/bin/qmake
  make

  make DESTDIR="${pkgdir}/" install

  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/icons/hicolor/24x24/apps/"
  install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  install -m644 "${srcdir}/qjoypad.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/trunk/icons/gamepad4-24x24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/qjoypad.png"
  install -m644 "${srcdir}/trunk/icons/gamepad4-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qjoypad.png"
}
