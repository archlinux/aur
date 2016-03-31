# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
# Note to self. It is necessary to remove the current Go4 installation -if any- otherwise the compilation fails.
#
pkgname=go4
_Pkgname=Go4
pkgver=5.1.0
pkgrel=1
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('i686' 'x86_64')
depends=('root5' 'qt4')
url="http://www-win.gsi.de/go4/"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('9d5e5a25a7d7ab399a1b3c3ff885ef4d')

_USEQT=4

prepare() {

  cd ${pkgname}-${pkgver}

  # make it installation friendly
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)/&#g' Makefile

}

build() {

  cd ${pkgname}-${pkgver}
  make prefix=/usr withqt=$_USEQT GO4_OS=Linux rpath=true withdabc=no debug=1 all || return 1

}

package() {

  #install the package
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  #install the license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/Go4License.txt" "$pkgdir/usr/share/licenses/${pkgname}/Go4License.txt"

  #install the desktop file
  echo "
	[Desktop Entry]
	Name=${_PKGNAME}
	Comment=${pkgdesc}
	Exec=${pkgname}
	Icon=xchm-32
	Terminal=false
	Type=Application
	Categories=Utility;Science;
	StartupNotify=false
	" > $srcdir/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}
