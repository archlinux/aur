# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-frameworks-git
pkgver=5.0.0.r2202.faf83d2
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
             'taglib'
             'geoip'
             'plasma-workspace'
             'kdnssd'
             )
optdepends=('taglib: for mediaplayer plugin'
            'geoip: for infowidget plugin'
            'plasma-workspace: for shutdown plugin'
            'kdnssd: for zeroconf plugin'
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
}

build() {
  cd build
  cmake ../ktorrent \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_SYSTEM_GEOIP=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
