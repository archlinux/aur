# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>
# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=qjoypad
pkgver=4.1.0
pkgrel=5
pkgdesc='Program with a QT interface that converts gamepad/joystick events into key strokes and mouse actions in XWindows'
arch=('i686' 'x86_64')
url='http://qjoypad.sourceforge.net/'
license=('GPL')
depends=('qt4' 'libxtst')
install=${pkgname}.install

source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
	'qjoypad.desktop'
	'x11.patch')

md5sums=('d4a262c29bd3955c0fe51e9a0d31f619'
         'a90839531415df510410558c47076cfc'
         'f6e8a44d0a4b53c7f28e6b98beb265de')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  patch -p3 <../../x11.patch
  sed -i 's/ qmake / qmake-qt4 /' config
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  ./config --prefix=/usr --install-dir=$pkgdir --devdir=/dev/input --debug --qmake4bin=/usr/lib/qt4/bin/qmake
  make

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/icons/hicolor/24x24/apps/"
  install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
  install -m644 "${srcdir}/qjoypad.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/$pkgname-$pkgver/icons/gamepad4-24x24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/qjoypad.png"
  install -m644 "${srcdir}/$pkgname-$pkgver/icons/gamepad4-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qjoypad.png"
}
