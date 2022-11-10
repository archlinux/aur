# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ktorrent-git
pkgver=23.03.70.r2910.a6030200
pkgrel=1
pkgdesc="A powerful BitTorrent client. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/internet/org.kde.ktorrent'
license=('GPL')
depends=('libktorrent'
         'knotifyconfig'
         'kcmutils'
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
             'kplotting'
             'kdesignerplugin'
             'kde-syndication'
             )
optdepends=('kplotting: for stats plugin'
            'taglib: for mediaplayer plugin'
            'geoip: for infowidget plugin'
            'plasma-workspace: for shutdown plugin'
            'kdnssd: for zeroconf plugin'
            'kde-syndication: for syndication plugin'
            'kross: for scripting plugin'
            )
provides=('ktorrent')
conflicts=('ktorrent')
source=('git+https://invent.kde.org/network/ktorrent.git')
sha256sums=('SKIP')

pkgver() {
  cd ktorrent
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
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
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
