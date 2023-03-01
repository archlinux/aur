# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=telegram-qt
pkgname=telegram-qt-git
pkgver=r2660.cd033446
pkgrel=1
pkgdesc="Qt bindings for the Telegram protocol"
arch=(i686 x86_64)
url="https://github.com/Kaffeine/telegram-qt"
license=(GPL)
depends=(qt5-declarative qt6-declarative openssl)
makedepends=(cmake git)
provides=(telegram-qt)
conflicts=(telegram-qt)
source=("git+https://github.com/Kaffeine/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Build for QT5
  cmake -S $_gitname -B build_qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WITH_QT_VERSION=Qt5
  # Build for QT6
  cmake -S $_gitname -B build_qt6 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_WITH_QT_VERSION=Qt6
}

build() {
  echo "--> Building QT5 library"
  cmake --build build_qt5
  echo "--> Building QT6 library"
  cmake --build build_qt6
}

package() {
  echo "--> Installing QT5 library"
  DESTDIR="$pkgdir" cmake --install build_qt5
  echo "--> Installing QT6 library"
  DESTDIR="$pkgdir" cmake --install build_qt6
}
