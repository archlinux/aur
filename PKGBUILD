# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=marble-git
pkgname=('marble-git'
         'libastro-git'
         'marble-data-git')
pkgver=v15.08.0.159.g30a9448
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
             'qextserialport-qt5'
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

package_libastro-git() {
  pkgdesc='Marble astronomy library'
  depends=('gcc-libs')
  conflicts=('kdeedu-marble<15.07'
             'marble-qt'
             'libastro'
             )

  make -C build/src/lib/astro DESTDIR="${pkgdir}" install
}

package_marble-git() {
  depends=('libastro-git'
           'marble-data-git'
           'qt5-webkit'
           'kparts'
           'knewstuff'
           'opencv'
           )
  optdepends=('gpsd: position information via gpsd'
              'quazip-qt5: reading and displaying .kmz files'
              'shapelib: reading and displaying .shp files'
              'qextserialport-qt5: reading from serial port in APRS plugin'
              'libwlocate: Position information based on neighboring WLAN networks'
              'phonon-qt5: That enables the use of audio and video content'
              'krunner: Krunner plugin for marble'
              )
  conflicts=('kdeedu-marble<15.04.3-3'
             'marble-qt'
             'marble'
             )
  replaces=('kdeedu-marble'
            'marble-qt<15.07'
            )
  groups=('kde-applications'
          'kdeedu'
          )
  install=marble-git.install

  make -C build DESTDIR="${pkgdir}" install

  # provided by libastro
  rm -r "${pkgdir}/usr/include/astro"
  rm "${pkgdir}/usr/lib/"libastro.*

  # provided by marble-data
  rm -r "${pkgdir}/usr/share/"{icons,marble/data}
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
  install=marble-git.install

  make -C build/data DESTDIR="${pkgdir}" install
}
