# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libktorrent-git
pkgver=24.01.75.r631.343445e
pkgrel=1
pkgdesc="A BitTorrent protocol implementation. (GIT version)"
arch=('x86_64')
url='https://projects.kde.org/projects/extragear/network/libktorrent'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'qt5-base' # libQt5Core.so libQt5Network.so libQt5Xml.so
  'kconfig5' # libKF5ConfigCore.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kio5' # libKF5KIOCore.so
  'karchive5' # libKF5Archive.so
  'ki18n5' # libKF5I18n.so
  'libgcrypt' # libgcrypt.so
  'gmp' # libgmp.so
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
  'git'
  'python'
  'boost'
)
checkdepends=('appstream')
provides=(
  'libktorrent'
  'libKF5Torrent.so'
)
conflicts=('libktorrent')
source=('git+https://invent.kde.org/network/libktorrent.git')
sha256sums=('SKIP')

pkgver() {
  cd libktorrent
  _ver="$(cat CMakeLists.txt | grep -m3 -e RELEASE_SERVICE_VERSION_MAJOR -e RELEASE_SERVICE_VERSION_MINOR -e RELEASE_SERVICE_VERSION_MICRO | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake -S libktorrent -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON \

#     -DBUILD_WITH_QT6=ON # NOTE: ktorrent is still KF5, so lets keep

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failures
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
