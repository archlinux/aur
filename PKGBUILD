# $Id$
# Maintainer: danitool <dgcbueu@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kaffeine-legacy
pkgver=1.2.2
pkgrel=6
pkgdesc='KDE media player. Old 1.2.2 version using Xine frontend'
license=('GPL')
arch=('i686' 'x86_64')
url="http://kaffeine.kde.org"
depends=('kdebase-runtime' 'xine-lib')
makedepends=('cmake' 'automoc4')
conflicts=('kaffeine' 'kaffeine-git')
install=kaffeine.install
source=(http://downloads.sourceforge.net/kaffeine/kaffeine-${pkgver}.tar.gz
        kaffeine-1.2.2-gcc4.7.patch
        kaffeine-1.2.2-dvbdevice.patch)
md5sums=('690e48d2e5fe123887109aa9b1bc1c31'
         '48afe5ec99b38fe02782db57a847033f'
         'fa923a1c4adb5f14a5e22bf2c4f1f85e')

prepare() {
  cd kaffeine-${pkgver}
  patch -p1 -i "${srcdir}/kaffeine-1.2.2-gcc4.7.patch"
  patch -p1 -i "${srcdir}/kaffeine-1.2.2-dvbdevice.patch"
  sed -i -e '2aINCLUDE(CheckIncludeFiles)' CMakeLists.txt
}

build() {
  mkdir -p build
  cd build
  cmake ../kaffeine-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
