# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=lokalize-git
pkgver=2.0.r1254.8930707
pkgrel=1
pkgdesc="Computer-Aided Translation System. (GIT version)"
url='https://www.kde.org/applications/development/lokalize'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdesdk')
depends=('kross'
         'hunspell'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
replaces=('kdesdk-lokalize')
conflicts=('kdesdk-lokalize' 'lokalize')
provides=('lokalize')
source=('git://anongit.kde.org/lokalize.git')
sha1sums=('SKIP')
install=lokalize-git.install

pkgver() {
  cd lokalize
  _ver="$(cat src/version.h | grep -m1 'define LOKALIZE_VERSION' | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../lokalize \
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
