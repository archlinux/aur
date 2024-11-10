# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libkcddb-git
pkgver=24.01.90.46.g4c6da88
pkgrel=1
pkgdesc='KDE CDDB library. (GIT version)'
arch=('x86_64')
url='https://invent.kde.org/multimedia/libkcddb'
license=(
  'GPL-2.0-or-later'
  'LGPL-2.0-or-later'
)
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'kconfig' # libKF6ConfigCore.so libKF6ConfigGui.so
  'kcmutils' # libKF6KCMUtilsCore.so libKF6KCMUtils.so
  'kcoreaddons' # libKF6CoreAddons.so
  'ki18n' # libKF6I18n.so
  'kio' # libKF6KIOCore.so libKF6KIOWidgets.so
  'kwidgetsaddons' # libKF6WidgetsAddons.so
  'qt6-base' # libQt6Core.so libQt6Gui.so ibQt6Network.so libQt6Widgets.so
  'libmusicbrainz5' 'libmusicbrainz5.so'
)
makedepends=(
  'git'
  'extra-cmake-modules'
  'kdoctools'
  'python'
)
checkdepends=('appstream')
provides=(
  'libkcddb'
  'libKCddb6.so'
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
    -DBUILD_TESTING=ON \
    -DQT_MAJOR_VERSION=6

  cmake --build build
}

check() {
  LC_ALL=C ctest --test-dir build --output-on-failure || true
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
