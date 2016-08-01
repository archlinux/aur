# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
# Note to self. It is necessary to remove the current Go4 installation -if any- otherwise the compilation fails.
#
pkgname=go4
_Pkgname=Go4
pkgver=5.1.2
pkgrel=1
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('i686' 'x86_64')
depends=('root' 'qt4')
url="https://www.gsi.de/en/work/fairgsi/rare_isotope_beams/electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('8083fe20cf894225039c4347de828f73')

_USEQT=4

prepare() {

  cd ${pkgname}-${pkgver}

  # make it installation friendly
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)/&#g' Makefile

  msg "fixing QGo4Widget.cpp:324:25: error: cannot convert ‘bool’ to ‘TGo4ViewPanel*’ in initialization"
  sed -i 's#TGo4ViewPanel\* res = false;#TGo4ViewPanel\* res = 0;#g' qt4/Go4GUI/QGo4Widget.cpp

}

build() {

  cd ${pkgname}-${pkgver}
  make clean-bin
  make clean
  make -j1 prefix=/usr withqt=$_USEQT GO4_OS=Linux rpath=true withdabc=no nodepend=1 debug=1 all || return 1

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
