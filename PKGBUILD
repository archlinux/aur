# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=marble-git
pkgname=('marble-git'
         'libastro-git'
         'marble-data-git'
	 'marble-common-git')
pkgver=20.03.80.1.g4e727daf0
pkgrel=1
pkgdesc="Desktop Globe. (GIT version)"
arch=('i686' 'x86_64')
url='https://www.kde.org/applications/system/marble'
license=('GPL')
makedepends=('git' 'gpsd' 'quazip' 'shapelib' 'libwlocate' 'phonon-qt5'
	     'extra-cmake-modules' 'krunner' 'python' 'qt5-webkit'
	     'qt5-tools' 'qt5-serialport' 'kparts' 'knewstuff' 'opencv'
	     'hicolor-icon-theme')
source=('git://anongit.kde.org/marble.git')
sha256sums=('SKIP')

pkgver() {
  cd marble
  git describe --tags | cut -c2- |tr - .
}

prepare() {
  mkdir -p build

  # only build the KDE app
  sed -e '/mobile/d' \
      -e '/qt/d'  \
      -e '/Quick/d' \
      -e '/touch/d' \
      -i marble/src/apps/CMakeLists.txt
  # fix an example
  #sed -e 's/CV_RGB2BGR/CV_RGB/' \
  #    -i 's/marble/examples/cpp/animation-video/main.cpp
}

build() {
  cd build
  cmake ../marble \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DQT_PLUGINS_DIR=lib/qt/plugins \
    -DBUILD_TESTING=OFF \
    -DBUILD_MARBLE_EXAMPLES=OFF \
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
	   'marble-common-git'
           'marble-data-git'
           'qt5-webkit'
           'kparts'
           'knewstuff'
           'opencv'
           'quazip'
           )
  optdepends=('gpsd: position information via gpsd'
  'shapelib: reading and displaying .shp files'
  'qt5-serialport: reading from serial port in APRS plugin'
  'libwlocate: Position information based on neighboring WLAN networks'
  'krunner: Krunner plugin for marble'
  )
  conflicts=('kdeedu-marble<15.04.3-3'
 'marble-qt'
 'marble'
 )
  provides=('marble')
  groups=('kde-applications'
          'kdeedu'
          )

  make -C build DESTDIR="${pkgdir}" install

  # provided by libastro
  rm -fr "${pkgdir}/usr/include/astro"
  rm -fr "${pkgdir}/usr/lib/"libastro.*
  rm -fr "${pkgdir}/usr/lib/cmake/Astro"

  # provided by marble-data
  rm -fr "${pkgdir}/usr/share/"{icons,mime,marble}
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

package_marble-common-git() {
  pkgdesc="metapackage providing 'marble-common'-dependency"
  arch=('any')
  depends=('libastro-git' 'marble-git' 'marble-data-git')
  conflicts=("marble-common")
  provides=("marble-common=${pkgver}")
}
