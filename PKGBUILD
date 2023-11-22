# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libktorrent-git
pkgver=24.01.75.r644.4ee84fc
pkgrel=1
pkgdesc="A BitTorrent protocol implementation. (GIT version)"
arch=('x86_64')
url='https://invent.kde.org/network/libktorrent'
license=('GPL')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'qt6-base' # libQt6Core.so libQt6Network.so libQt6Xml.so
  'qt6-5compat' # libQt6Core5Compat.so
  'kconfig' # libKF6ConfigCore.so
  'kcoreaddons' # libKF6CoreAddons.so
  'kio' # libKF6KIOCore.so
  'karchive' # libKF6Archive.so
  'ki18n' # libKF6I18n.so
  'libgcrypt' # libgcrypt.so
  'gmp' # libgmp.so
)
makedepends=(
  'extra-cmake-modules'
  'kdoctools5'
  'git'
  'python'
  'boost'
#   'kdoctools'
)
checkdepends=('appstream')
provides=(
  'libktorrent'
  'libKTorrent6.so'
)
conflicts=('libktorrent')
source=('git+https://invent.kde.org/network/libktorrent.git')
sha256sums=('SKIP')
options=('debug')

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
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
