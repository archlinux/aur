# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: chisbread <chisbread@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libmediawiki
pkgver=5.37.0
pkgrel=7
pkgdesc='A KDE C++ interface for MediaWiki based web services like Wikipedia'
arch=('i686' 'x86_64')
url='https://invent.kde.org/libraries/libmediawiki'
license=('GPL2')
depends=(
  'gcc-libs'
  'glibc'
  'kcoreaddons'
  'qt5-base'
)
makedepends=('extra-cmake-modules')
_last_release_commit='1a6e469024128a10ac4d54457dbae58aaec52fb0'
source=("$pkgname-$pkgver.tar.bz2::${url}/-/archive/${_last_release_commit}/${pkgname}-${_last_release_commit}.tar.bz2")
sha256sums=('40c670699f06e3fe0856a08406e9cc8674d2ea7c3cd53561dfd6ce730eaf6842')

prepare() {
  # Rename source directory to match source tar name
  mv "${pkgname}-${_last_release_commit}" "$pkgname-$pkgver"

  mkdir -p build

  sed -i '0,/.*add_subdirectory.*/s/.*add_subdirectory.*/REMOVE_DEFINITIONS(-DQT_NO_CAST_FROM_ASCII)\n&/' $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  cmake --build . --target all
}

package() {
  cd build
  cmake --install . --prefix="${pkgdir}/usr"
}
