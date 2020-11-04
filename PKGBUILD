# Contributor: Luis Sarmiento < Luis.Sarmiento-ala-nuclear.lu.se >
#
#
pkgname=go4-git
_pkgname=go4
pkgver=r2054.111adfd6
pkgrel=1
pkgdesc='Object-oriented system (GSI Object Oriented On-line Off-line system) based on ROOT'
arch=('x86_64')
depends=('root' 'qt5-base')
url="https://www.gsi.de/en/work/research/experiment_electronics/data_processing/data_analysis/the_go4_home_page.htm"
license=('GPL')
source=($_pkgname::git+https://github.com/linev/go4.git)
sha256sums=('SKIP')
provides=(go4)
conflicts=(go4)

pkgver() {
  cd ${srcdir}/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {

  rm -rf ${srcdir}/build
  [[ -d  ${srcdir}/build ]] || mkdir ${srcdir}/build
  cd     ${srcdir}/build

  sed -i 's#$ENV{ROOTSYS}#/usr/lib/cmake/ROOT#g' ${srcdir}/${_pkgname}/cmake/modules/Go4Configuration.cmake

  # with Qt5 there is a change in path for some components
  find ${srcdir}/${_pkgname}/qt4/Go4GUI -type f -exec sed -e 's#QtGui/QAction#QtWidgets/QApplication#g' -i {} \;
  find ${srcdir}/${_pkgname}/qt4/Go4GUI -type f -exec sed -e 's#QtGui/QApplication#QtWidgets/QApplication#g' -i {} \;

  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -DGO4PREFIX=/usr \
        -DROOTSYS=/usr \
        -DGO4_OS=Linux \
        -DWITHQT=5 \
        -Dwithdabc=yes \
        ${srcdir}/go4

  # -Ddesigner=ON

}

build() {
  cd ${srcdir}/build

  make all || return 1

}

package() {

  #install the package
  cd ${srcdir}/build
  make install

  #install the license
  install -Dm644 "Go4License.txt" "$pkgdir/usr/share/licenses/go4/Go4License.txt"

  # cp /etc and /usr/bin and /usr/lib
  install -d ${pkgdir}/etc
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib
  for file in ${srcdir}/build/etc/*; do install -m755 ${file} ${pkgdir}/etc/; done
  for file in ${srcdir}/build/bin/*; do install -m755 ${file} ${pkgdir}/usr/bin/; done
  for file in ${srcdir}/build/lib/*; do install -m755 ${file} ${pkgdir}/usr/lib/; done

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
}
