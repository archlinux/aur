# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lokalize-git
pkgver=2.0.r1175.78595a9
pkgrel=1
pkgdesc="Computer-Aided Translation System. (GIT version)"
url='https://www.kde.org/applications/development/lokalize'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('kross' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'hunspell' 'python')
optdepends=('hunspell: Spell checker')
conflicts=('kdesdk-lokalize' 'lokalize')
provides=('lokalize')
source=('git://anongit.kde.org/lokalize.git')
sha1sums=('SKIP')
install=lokalize-git.install

pkgver() {
  cd lokalize
  _ver="$(cat src/version.h | grep -m1 'define LOKALIZE_VERSION' | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed 's|${DATA_INSTALL_DIR}|${KXMLGUI_INSTALL_DIR}|g' -i lokalize/src/CMakeLists.txt
}

build() {
  cd build
  cmake ../lokalize \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTS=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
