# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krusader-frameworks-git
pkgver=v2.4.0.beta3.186.g9ac6304
pkgrel=1
pkgdesc="Advanced twin panel file manager for KDE. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.krusader.org/"
license=('GPL')
depends=('kdelibs4support' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=('krusader')
conflicts=('krusader')
source=('git://anongit.kde.org/krusader#branch=plasma')
sha1sums=('SKIP')
install=krusader-frameworks-git.install

pkgver() {
  cd krusader
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  sed '110d' -i krusader/krusader/CMakeLists.txt
  sed '110d' -i krusader/krusader/CMakeLists.txt
  sed 's|              krviewer.rc|install(FILES krviewer.rc|g' -i krusader/krusader/CMakeLists.txt
  sed -e '119iinstall(FILES krusaderui.rc\n              krusaderlisterui.rc\n        DESTINATION ${KXMLGUI_INSTALL_DIR}/krusader)\n' -i krusader/krusader/CMakeLists.txt

}

build() {
  cd build

  cmake ../krusader \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}