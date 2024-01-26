# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
#
pkgname=go4
_Pkgname=Go4
pkgver=6.3.0
pkgrel=1
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('x86_64')
makedepends=('cmake')
depends=('root' 'qt6-webengine' 'hdf5' 'cern-vdt')
conflicts=('mbseventapi')
url="https://www.gsi.de/en/work/research/experiment_electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=("http://web-docs.gsi.de/~go4/download/go4-${pkgver}.tar.gz")
sha256sums=('93cf8fe4ddcb9e2e494ebe8c8cf1df2ddf25cbc1bc64f3cc7dc09348c26e3841')

prepare() {

  unset GO4SYS

  #
  # Most files created at the end of CMakeLists.txt end up in weird locations.
  #           for now it works... this will be fixed in a new release
  #
  # # ================== Copy files, create old support files ==========
  #
  # /usr/Go4License.txt --> /usr/share/licenses/go4/Go4License.txt
  # /usr/README.txt     --> /usr/share/doc/{pkg}
  # /usr/CHANGES.txt    --> /usr/share/doc/{pkg}
  #
  # /usr/go4login        --> /usr/bin/go4login
  #
  #
  # /usr/etc/   -->   /etc/{pkg}
  # /usr/docs/  -->   /usr/share/doc/{pkg}
  # /usr/icons  -->   /usr/share/{pkg}/icons
  # /usr/html   -->   /usr/share/doc/{pkg}/html
  # /usr/macros -->   /usr/share/{pkg}/macros
  # /usr/python -->   /usr/share/{pkg}/python
  #

}

build() {

# took from /etc/makepkg.conf but -Werror=format-security removed

CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 -Wformat \
        -fstack-clash-protection -fcf-protection"
CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"

  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  ROOTSYS=/usr/lib/cmake/ROOT \
         cmake \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DGO4_PLATFORM=Linux \
         -DGO4_QTVERSION=Qt6 \
         -Ddabc=ON \
         -Dhdf5=ON \
         -Droot7=ON \
         -Dqt6web=ON \
         ../go4-${pkgver}

  make

}

package() {

  #install the package
  cd ${srcdir}/build
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
  source /usr/go4login

  # If ROOT_INCLUDE_PATH already exists, then add Go4 to it, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:+\$ROOT_INCLUDE_PATH:/usr/include/go4}

  # if ROOT_INCLUDE_PATH does not exist, define it as the one from Go4, otherwise do nothing
  export ROOT_INCLUDE_PATH=\${ROOT_INCLUDE_PATH:-/usr/include/go4}

EOF

  install -m755 ${srcdir}/go4.sh  ${pkgdir}/etc/profile.d/go4.sh

  # Csh no longer supported. Go4 itself does not seem to support it.
}
