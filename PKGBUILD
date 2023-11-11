# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcddb-git
pkgver=24.01.75.1.g0719217
pkgrel=1
pkgdesc="KDE CDDB library. (GIT version)"
arch=('x86_64')
url='https://invent.kde.org/multimedia/libkcddb'
license=('GPL' 'LGPL' 'FDL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'ki18n5' # libKF5I18n.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'qt5-base' # libQt5Core.so libQt5Gui.so ibQt5Network.so libQt5Widgets.so
  'libmusicbrainz5' 'libmusicbrainz5.so'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'kdoctools5'
  'python'
)
checkdepends=('appstream')
provides=(
  'libkcddb'
  'libKF5Cddb.so'
)
conflicts=('libkcddb')
source=('git+https://invent.kde.org/multimedia/libkcddb.git')
sha256sums=('SKIP')

pkgver() {
  cd libkcddb
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S libkcddb -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure || true
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
