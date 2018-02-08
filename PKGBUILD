# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
# Note to self. It is necessary to remove the current Go4 installation -if any- otherwise the compilation fails.
#               Also, after removal, use a fresh terminal as go4login variables are no longer valid
#
# It looks that ROOT6 requires the modification/definition of the variable ROOT_INCLUDE_PATH to /usr/include/go4
#
pkgname=go4
_Pkgname=Go4
pkgver=5.2.0
pkgrel=5
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('i686' 'x86_64')
depends=('root=6.10.08' 'qt4')
url="https://www.gsi.de/en/work/research/electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/go4-${pkgver}.tar.gz")
md5sums=('eede668b446e899da12487f182957ed0')

_USEQT=4 # qt4 - Qt 4.6.x and higher (recommended) <-- from the source code 5.1.2

prepare() {

  cd go4-${pkgver}

  # make it installation friendly
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)&#g' Makefile

  # Does not seem needed since 5.2.0
  #msg "fixing QGo4Widget.cpp:324:25: error: cannot convert ‘bool’ to ‘TGo4ViewPanel*’ in initialization"
  #sed -i 's#TGo4ViewPanel\* res = false;#TGo4ViewPanel\* res = 0;#g' qt4/Go4GUI/QGo4Widget.cpp

}

build() {

  cd go4-${pkgver}
  make clean-bin
  make clean
  make prefix=/usr withqt=$_USEQT GO4_OS=Linux rpath=true withdabc=yes nodepend=0 debug=1 all || return 1

}

package() {

  #install the package
  cd go4-${pkgver}
  make DESTDIR="${pkgdir}/" install

  #install the license
  install -Dm644 "${srcdir}/go4-${pkgver}/Go4License.txt" "$pkgdir/usr/share/licenses/go4/Go4License.txt"

  #install the desktop file
  echo "
	[Desktop Entry]
	Name=${_PKGNAME}
	Comment=${pkgdesc}
	Exec=go4
	Icon=xchm-32
	Terminal=false
	Type=Application
	Categories=Utility;Science;
	StartupNotify=false
	" > $srcdir/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  install -d ${pkgdir}/etc/profile.d

  echo <<EOF > ${srcdir}/go4.sh
  # source go4login script
  source /usr/bin/go4login

  # If ROOT_INCLUDE_PATH already exists, then add Go4 to it, otherwise do nothing
  export ROOT_INCLUDE_PATH=${ROOT_INCLUDE_PATH:+$ROOT_INCLUDE_PATH:/usr/include/go4}

  # if ROOT_INCLUDE_PATH does not exist, define it as the one from Go4, otherwise do nothing
  export ROOT_INCLUDE_PATH=${ROOT_INCLUDE_PATH:-/usr/include/go4}

EOF

  install -m755 ${srcdir}/go4.sh  ${pkgdir}/etc/profile.d/go4.sh

  # Csh no longer supported. Go4 itself does not seem to support it.

  # for later maybe? uninstall and therefore remove packages
  # PATH="${PATH/\/path\/to\/remove/}"

}
