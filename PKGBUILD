# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-frameworks-git
pkgver=4.3.0.r2159.de3503b
pkgrel=1
pkgdesc="A powerful BitTorrent client. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='https://userbase.kde.org/KTorrent'
license=('GPL')
depends=('knotifyconfig'
         'libktorrent-frameworks-git'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             'boost'
             )
conflicts=('libktorrent')
source=('git://anongit.kde.org/ktorrent.git#branch=frameworks')
sha1sums=('SKIP')
install=ktorrent-frameworks-git.install

pkgver() {
  cd ktorrent
  _ver="$(cat libktcore/ktversion.h | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '=' -f2 | tr -d ';' | tr -d ' ' | paste -sd'.')"
  echo -e "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  sed 's|DESTINATION ${DATA_INSTALL_DIR}/ktorrent|DESTINATION ${KXMLGUI_INSTALL_DIR}|g' -i ktorrent/ktorrent/CMakeLists.txt
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
