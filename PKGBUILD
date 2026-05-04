# Merged with official ABS marble PKGBUILD by João, 2024/03/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=marble-git
pkgname=(marble-git
         marble-behaim-git
         marble-common-git
         marble-maps-git
         marble-qt-git)
pkgver=26.07.70_r14655.g19c3ab319
pkgrel=1
pkgdesc='Desktop Globe'
arch=($CARCH)
url="https://github.com/KDE/${pkgbase%-git}"
license=(GPL-2.0-or-later)
makedepends=(git extra-cmake-modules-git gpsd kdoctools-git knewstuff-git kparts-git krunner-git libplasma-git libwlocate phonon-qt6-git protobuf qt6-serialport qt6-tools qt6-webengine shapelib)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgbase%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_CXX_STANDARD=17 \
    -DQT_PLUGINS_DIR=lib/qt6/plugins \
    -DBUILD_QT_AND_KDE=ON \
    -DBUILD_TESTING=OFF \
    -DBUILD_TOUCH=ON \
    -DBUILD_MARBLE_EXAMPLES=OFF \
    -DMOBILE=OFF
  cmake --build build
}

package_marble-common-git() {
  pkgdesc='Common libraries and plugins for Marble'
  conflicts=(marble-common)
  provides=(marble-common)
  depends=(gcc-libs
           glibc
           phonon-qt6-git
           protobuf
           qt6-5compat
           qt6-base
           qt6-declarative
           qt6-positioning
           qt6-svg
           qt6-webchannel
           qt6-webengine
           zlib)
  optdepends=('gpsd: GPS based geolocation'
              'libwlocate: WLAN based geolocation'
              'qt6-serialport: APRS plugin'
              'shapelib: SHP plugin')

  DESTDIR="$pkgdir" cmake --install build
  rm -r "$pkgdir"/usr/share/{config.kcfg,kxmlgui5,metainfo} \
        "$pkgdir"/usr/bin \
        "$pkgdir"/usr/lib/qt6/plugins/{kf6,*.so} \
        "$pkgdir"/usr/share/applications/org.kde.marble*.desktop \
        "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.kde.marble*.svg \
        "$pkgdir"/usr/share/plasma
}

package_marble-qt-git() {
  pkgdesc+=' (Qt version)'
  conflicts=(marble-qt)
  provides=(marble-qt)
  depends=(gcc-libs
           glibc
           marble-common-git
           qt6-base)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-qt
}

package_marble-git() {
  conflicts=(marble)
  provides=(marble)
  depends=(gcc-libs
           glibc
           kconfig-git
           kconfigwidgets-git
           kcoreaddons-git
           kcrash-git
           ki18n-git
           kparts-git
           kwidgetsaddons-git
           kxmlgui-git
           marble-common-git
           qt6-base)
  optdepends=('kcmutils-git: Plasma applets'
              'kirigami-addons-git: Plasma applets'
              'libplasma-git: Plasma applets')
  groups=(kde-applications-git
          kde-education-git)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-kde
  DESTDIR="$pkgdir" cmake --install build/src/plasma
  DESTDIR="$pkgdir" cmake --install build/src/plasmarunner
  DESTDIR="$pkgdir" cmake --install build/src/thumbnailer
  rm -r "$pkgdir"/usr/share/{icons,doc,locale}
}

package_marble-maps-git() {
  pkgdesc='OpenStreetMap Navigation'
  conflicts=(marble-maps)
  provides=(marble-maps)
  depends=(gcc-libs
           glibc
           kconfig-git
           kcoreaddons-git
           kcrash-git
           ki18n-git
           kirigami-git
           kirigami-addons-git
           marble-common-git
           qt6-base
           qt6-declarative
           qt6-webengine)

  DESTDIR="$pkgdir" cmake --install build/src/apps/marble-maps
}

package_marble-behaim-git() {
  pkgdesc='Behaim Globe'
  url='https://apps.kde.org/marble.behaim/'
  conflicts=(marble-behaim)
  provides=(marble-behaim)
  depends=(gcc-libs
           glibc
           kcoreaddons-git
           kcrash-git
           ki18n-git
           kirigami-addons-git
           marble-common-git
           qt6-base
           qt6-declarative
           qt6-webengine)

  DESTDIR="$pkgdir" cmake --install build/src/apps/behaim
}
