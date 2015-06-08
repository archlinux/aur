# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=marble-git
pkgver=v15.03.97.141.g7a411f4
pkgrel=1
pkgdesc="Desktop Globe. (GIT version)"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
provides=('marble')
conflicts=('marble' 'marble-qt' 'kdeedu-marble' )
depends=('qt5-webkit' 'kparts' 'knewstuff' 'opencv' 'hicolor-icon-theme') #
makedepends=('cmake' 'git' 'gpsd' 'quazip-qt5-svn' 'shapelib' 'qextserialport' 'libwlocate' 'phonon-qt5'
             'extra-cmake-modules' 'qt5-webkit' 'krunner' )
optdepends=('gpsd: position information via gpsd'
            'quazip-qt5-svn: reading and displaying .kmz files'
            'shapelib: reading and displaying .shp files'
            'qextserialport: reading from serial port in APRS plugin'
            'libwlocate: Position information based on neighboring WLAN networks'
            'phonon-qt5: That enables the use of audio and video content'
            'krunner: Krunner plugin for marble')
source=('git://anongit.kde.org/marble.git')
sha1sums=('SKIP')
install=marble-git.install

pkgver() {
  cd marble
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # fix installation designer plugins path
  sed 's|LIB_SUFFIX}/plugins|LIB_SUFFIX}/qt/plugins|g' -i marble/CMakeLists.txt

  # only build the KDE app
  sed -e '/mobile/d' \
      -e '/qt/d'  \
      -e '/Quick/d' \
      -e '/touch/d' \
      -i marble/src/apps/CMakeLists.txt
}

build() {
  cd build
  cmake ../marble \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_KF5=ON \
    -DBUILD_MARBLE_EXAMPLES=ON \
    -DBUILD_MARBLE_TOOLS=ON \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
