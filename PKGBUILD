# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
# It looks that ROOT6 requires the modification/definition of the variable ROOT_INCLUDE_PATH to /usr/include/go4
# so we do this at the /etc/profile.d/go4.sh file.
#
pkgname=go4
_Pkgname=Go4
pkgver=5.3.0
pkgrel=10
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('x86_64')
depends=('root' 'qt4')
url="https://www.gsi.de/en/work/research/electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/go4-${pkgver}.tar.gz")
sha256sums=('fa6bd9707295f44a55084b880f164b826867fcb11b42ebe40ef3e712212d2fd7')

prepare() {

  unset GO4SYS

  cd go4-${pkgver}

  # make it installation friendly
  sed -i 's#\$(GO4EXEPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4INCPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4LIBPATH)#$(DESTDIR)/&#g' Makefile
  sed -i 's#\$(GO4TOPPATH)#$(DESTDIR)/&#g' Makefile

  sed -i 's#QMAKE_CXXFLAGS=#& -std=c++17#g' Makefile.config
}

build() {

  cd go4-${pkgver}
  make clean-bin
  make clean

  ##
  #  rpath=false seemed to reduce que volume of warnings with ROOT6
  ##
  make prefix=/usr withqt=4 GO4_OS=Linux rpath=false withdabc=yes nodepend=1 debug=1 all || return 1

}

package() {

  #install the package
  cd go4-${pkgver}
  make DESTDIR="${pkgdir}" install

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

  cat <<- EOF > ${srcdir}/go4.sh
  # source go4login script
  source /usr/bin/go4login

  # If ROOT_INCLUDE_PATH already exists, then add Go4 to it, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:+\$ROOT_INCLUDE_PATH:/usr/include/go4}

  # if ROOT_INCLUDE_PATH does not exist, define it as the one from Go4, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:-/usr/include/go4}

EOF

  install -m755 ${srcdir}/go4.sh  ${pkgdir}/etc/profile.d/go4.sh

  # Csh no longer supported. Go4 itself does not seem to support it.
}
