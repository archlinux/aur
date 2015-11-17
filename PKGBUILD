pkgname=libkipi-git
pkgver=r1162.a6ecdba
pkgrel=1
pkgdesc='An interface to use kipi-plugins from a KDE application'
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
depends=('qt5-base' 'hicolor-icon-theme' 'kxmlgui')
makedepends=('git' 'extra-cmake-modules-git' 'kdoctools')
conflicts=('libkipi')
provides=('libkipi')
groups=('digikamsc-git')
source=('libkipi::git+git://anongit.kde.org/libkipi')
md5sums=('SKIP')
install=libkipi-git.install

pkgver() {
  cd "${srcdir}/libkipi"
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
  cmake "${srcdir}/libkipi" -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DLIB_INSTALL_DIR=lib \
                -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
                -DBUILD_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}