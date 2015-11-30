# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-frameworks-git
pkgver=4.3.0.r2168.abdc509
pkgrel=1
pkgdesc="A powerful BitTorrent client. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://userbase.kde.org/KTorrent'
license=('GPL')
depends=('libktorrent-frameworks-git'
         'knotifyconfig'
         'kcmutils'
         'kdelibs4support'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'boost'
             )
provides=('ktorrent')
source=('git://anongit.kde.org/ktorrent.git#branch=frameworks')
sha1sums=('SKIP')
install=ktorrent-frameworks-git.install

pkgver() {
  cd ktorrent
  _ver="$(cat libktcore/ktversion.h | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '=' -f2 | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed 's|ui.rc DESTINATION ${DATA_INSTALL_DIR}|ui.rc DESTINATION ${KXMLGUI_INSTALL_DIR}|g' -i ktorrent/plugins/*/CMakeLists.txt
}

build() {
  cd build
  cmake ../ktorrent \
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
