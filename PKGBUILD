# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=marble-qt-git
pkgver=v15.03.97.136.ge640a4b
pkgrel=1
pkgdesc="Desktop Globe (Qt version. without KDE dependency). (GIT version)"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
provides=('marble-qt')
conflicts=('marble' 'marble-qt' 'kdeedu-marble')
depends=('qt5-script' 'qt5-svg' 'qt5-webkit' 'opencv' 'hicolor-icon-theme')
makedepends=('cmake' 'git' 'extra-cmake-modules' 'gpsd' 'quazip-qt5-svn' 'shapelib' 'qextserialport' 'libwlocate' 'phonon-qt5')
optdepends=('gpsd: position information via gpsd'
            'quazip-qt5-svn: reading and displaying .kmz files'
            'shapelib: reading and displaying .shp files'
            'qextserialport: eading from serial port in APRS plugin'
            'libwlocate: Position information based on neighboring WLAN networks'
            'phonon-qt5: That enables the use of audio and video content')
source=('git://anongit.kde.org/marble.git')
sha1sums=('SKIP')
install=marble-qt-git.install

pkgver() {
  cd marble
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # fix installation designer plugins path
  sed 's|LIB_SUFFIX}/plugins|LIB_SUFFIX}/qt/plugins|g' -i marble/CMakeLists.txt

  # only build the Qt app
  sed -e '/mobile/d' \
      -e '/kde/d'  \
      -e '/Quick/d' \
      -e '/touch/d' \
      -i marble/src/apps/CMakeLists.txt
}

build() {
  cd build
  cmake ../marble \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DQT5BUILD=ON \
    -DWITH_KF5=OFF \
    -DBUILD_MARBLE_EXAMPLES=ON \
    -DBUILD_MARBLE_TOOLS=ON \
    -DBUILD_MARBLE_TESTS=OFF \
    -DBUILD_TESTING=OFF \
    -DMOBILE=OFF \
    -DQEXTSERIALPORT_INCLUDE_DIR="/usr/include/qt/QtExtSerialPort" \
    -DQEXTSERIALPORT_LIBRARIES="/usr/lib64/libQt5ExtSerialPort.so" \
    -DPHONON_INCLUDE_DIR=/usr/include/phonon4qt5 \
    -DPHONON_LIBRARY=/usr/lib64/libphonon4qt5.so
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
