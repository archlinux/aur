# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=digikam-frameworks-git
pkgver=5.0.0.r32112.0d5276b
pkgrel=1
pkgdesc='Digital photo management application for KDE. KF5 Frameworks branch (GIT Version)'
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.digikam.org/"
depends=('knotifyconfig' 'kfilemetadata'
         'libkdcraw-frameworks-git'  'libkexiv2-frameworks-git' 'libkipi-frameworks-git' 'libkface-frameworks-git' 'libkgeomap-frameworks-git'
         'libpgf' 'libgphoto2' 'liblqr' 'lensfun')
makedepends=('eigen' 'doxygen' 'python' 'boost' 'extra-cmake-modules' 'kdoctools' 'git' 'mariadb')
optdepends=('kipi-plugins-frameworks-git: for more tools and plugins'
            'mariadb: MySQL support')
conflicts=('digikam')
provides=('digikam')
install=digikam-frameworks-git.install
source=('git://anongit.kde.org/digikam.git#branch=frameworks')
sha1sums=('SKIP')

pkgver() {
  cd digikam
  _ver="$(cat CMakeLists.txt | grep -e DIGIKAM_MAJOR_VERSION -e DIGIKAM_MINOR_VERSION -e DIGIKAM_PATCH_VERSION | head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake  ../digikam \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
