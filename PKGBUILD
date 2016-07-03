# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=marble-git
pkgname=('marble-git'
         'libastro-git'
         'marble-data-git')
pkgver=1.14.21.r11423.b4dd268
pkgrel=1
pkgdesc="Desktop Globe. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/system/marble'
license=('GPL')
makedepends=('cmake'
             'git'
             'gpsd'
             'quazip-qt5'
             'shapelib'
             'qextserialport'
             'libwlocate'
             'phonon-qt5'
             'extra-cmake-modules'
             'qt5-webkit'
             'krunner'
             'python'
             'qt5-webkit'
             'qt5-tools'
             'kparts'
             'knewstuff'
             'opencv'
             'hicolor-icon-theme'
             )
source=('git://anongit.kde.org/marble.git')
sha1sums=('SKIP')

pkgver() {
  cd marble
  _ver="$(cat src/apps/marble-ui/ControlView.cpp | grep -m1 'return' | cut -d '"' -f2 | cut -d ' ' -f1)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

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
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_KF5=ON \
    -DQT_PLUGINS_DIR=lib/qt/plugins \
    -DBUILD_MARBLE_EXAMPLES=ON \
    -DBUILD_MARBLE_TOOLS=ON \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF
  make
}

package_libastro-git() {
  pkgdesc='Marble astronomy library'
  depends=('gcc-libs')
  conflicts=('kdeedu-marble<15.07'
             'marble-qt'
             'libastro'
             )
  provides=('libastro')

  make -C build/src/lib/astro DESTDIR="${pkgdir}" install
}

package_marble-git() {
  depends=('libastro-git'
           'marble-data-git'
           'qt5-webkit'
           'kparts'
           'knewstuff'
           'opencv'
           'quazip-qt5'
           )
  optdepends=('gpsd: position information via gpsd'
              'shapelib: reading and displaying .shp files'
              'qextserialport: reading from serial port in APRS plugin'
              'libwlocate: Position information based on neighboring WLAN networks'
              'krunner: Krunner plugin for marble'
              )
  conflicts=('kdeedu-marble<15.04.3-3'
             'marble-qt'
             'marble'
             )
  provides=('marble')
  replaces=('kdeedu-marble'
            'marble-qt<15.07'
            )
  groups=('kde-applications'
          'kdeedu'
          )

  make -C build DESTDIR="${pkgdir}" install

  # provided by libastro
  rm -r "${pkgdir}/usr/include/astro"
  rm "${pkgdir}/usr/lib/"libastro.*

  # provided by marble-data
  rm -r "${pkgdir}/usr/share/"{icons,mime,marble/data}
}

package_marble-data-git() {
  pkgdesc='Data for Marble'
  arch=('any')
  depends=('hicolor-icon-theme')
  conflicts=('kdeedu-marble<15.07'
             'marble<15.07.80-3'
             'marble-qt'
             'marble-data'
             )
  provides=('marble-data')

  make -C build/data DESTDIR="${pkgdir}" install
}
