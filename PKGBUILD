pkgname=digikam-git
pkgver=r36468.5efd13702a
pkgrel=1
pkgdesc='Digital photo management application for KDE'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('marble-common' 'libksane-git' 'liblqr' 'libkipi-git' 'kcalcore' 'qtav' 'lensfun' 'knotifyconfig' 'akonadi-contacts' 'kfilemetadata' 'opencv' 'threadweaver')
makedepends=('git' 'extra-cmake-modules-git' 'eigen' 'doxygen' 'boost' 'mariadb' 'kdoctools')
optdepends=('kipi-plugins-git: more tools and plugins'
	    'hugin: panorama tool')
conflicts=('digikam')
provides=('digikam')
install=digikam-git.install
source=('digikam::git+git://anongit.kde.org/digikam')
md5sums=('SKIP')
groups=('digikamsc-git')

pkgver() {
  cd "${srcdir}/digikam"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
if [[ -d "${srcdir}/build" ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "${srcdir}/digikam" -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIB_INSTALL_DIR=lib \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-DBUILD_TESTING=OFF -DENABLE_AKONADICONTACTSUPPORT=ON -DENABLE_KFILEMETADATASUPPORT=ON \
		-DENABLE_MYSQLSUPPORT=ON -DENABLE_INTERNALMYSQL=ON -DENABLE_MEDIAPLAYER=ON \
		-DENABLE_OPENCV3=ON -DENABLE_APPSTYLES=ON
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
