# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krusader-git
pkgver=15.08.beta.r5088.49b8589
pkgrel=1
pkgdesc="Advanced twin panel file manager for KDE. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.krusader.org'
license=('GPL')
depends=('kparts' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python' 'acl')
optdepends=('acl: Access control list utilities')
provides=('krusader')
conflicts=('krusader')
source=('git://anongit.kde.org/krusader')
sha1sums=('SKIP')
install=krusader-git.install

pkgver() {
  cd krusader
  _ver="$(cat CMakeLists.txt | grep -m1 'set(VERSION' | cut -d '"' -f2 | tr - .)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

#   sed -e '6s|#||g' \
#       -e 's|LibKonq|KF5Konq|g' \
#       -e 's|LIBKONQ|KF5Konq|g' \
#       -i krusader/krusader/CMakeLists.txt
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
