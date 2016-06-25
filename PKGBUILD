# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-git
pkgver=5.0.1.r2250.0b2ad94
pkgrel=1
pkgdesc="A powerful BitTorrent client. (GIT version)"
arch=('i686' 'x86_64')
url='https://userbase.kde.org/KTorrent'
license=('GPL')
depends=('libktorrent-git'
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
             'kross'
             )
optdepends=('taglib: for mediaplayer plugin'
            'geoip: for infowidget plugin'
            'plasma-workspace: for shutdown plugin'
            'kdnssd: for zeroconf plugin'
            )
provides=('ktorrent')
conflicts=('ktorrent')
source=('git://anongit.kde.org/ktorrent.git')
sha1sums=('SKIP')

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
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_SYSTEM_GEOIP=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
