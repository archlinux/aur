# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >

pkgname=go4
_Pkgname=Go4
pkgver=4.7.0
pkgrel=2
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('i686' 'x86_64')
depends=('root5' 'qt4')
url="http://www-win.gsi.de/go4/"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('bfcc2d82a2b51a7bd1b3a4e929af5603')

_USEQT=4

prepare() {
  cd ${pkgname}-${pkgver}

  # this replaces the patch
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)/&#g' Makefile

  ## problem at linking time. Likely a typo.
  sed -i 's#localtime_t#localtime_r#g' ./RawAPI/rawapin.c
}

build() {
  cd ${pkgname}-${pkgver}
  make debug=1 prefix=/usr rpath=false withqt=$_USEQT GO4_OS=Linux all || return 1
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
