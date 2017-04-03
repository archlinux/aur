# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kscd-git
pkgver=v17.03.80.7.g57b6870
pkgrel=1
pkgdesc="KDE CD player. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/multimedia/kscd/'
license=('GPL2')
depends=('libmusicbrainz3'
         'kdelibs4support'
         'hicolor-icon-theme'
         )
conflicts=('kdemultimedia-kscd'
           'kscd')
provides=('kscd')
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
source=('git://anongit.kde.org/kscd.git#branch=kf5')
sha256sums=('SKIP')

pkgver() {
  cd kscd
#   _ver="$(cat CMakeLists.txt | grep -m3 -e VERSION_MAJOR -e VERSION_MINOR -e VERSION_RELEASE | cut -d '"' -f2 | paste -sd'.')"
#   echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  
  cd kscd/pics
  for i in *.png; do mv ${i} ${i//app/apps}; done
  sed -i 's|app|apps|g' -i CMakeLists.txt
}

build() {
  cd build
  cmake ../kscd \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
