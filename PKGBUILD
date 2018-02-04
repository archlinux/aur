# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=caveexpress
pkgver=2.4
pkgrel=1
pkgdesc="Classic 2D platformer with physics-based gameplay and dozens of levels"
arch=('i686' 'x86_64')
url="http://www.caveproductions.org"
license=('GPL3' 'CCPL')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sqlite3' 'lua52' 'box2d')
makedepends=('cmake' 'glm')
source=($pkgname-$pkgver.tar.gz::"https://github.com/mgerhardy/$pkgname/archive/$pkgver.tar.gz"
        $pkgname-do-not-sort-empty-cmake-list.patch::"https://github.com/mgerhardy/caveexpress/pull/95.patch"
        $pkgname-use-system-box2d.patch
        $pkgname-installation-paths.patch)
sha256sums=('c1bf0707a4a2bcf2358b2791d97674a790d9fdce3ba29c695b9fa97030d74d3f'
            'ab3a804fcd538cffb7caeddc8fc1fc81918f9ddf0008f54aee51fd5b92c2fad1'
            '8818e828dcd859b7a678d1a224f104e1d58c8e74edf8ee01a3d763a8870f7f49'
            '9e1e3e505af64e2f81bef75788ce099d7f68a2cc8fdbab29295a035418c589b4')

prepare() {
  rm -rf build
  mkdir build

  cd $pkgname-$pkgver
  # build fixes
  patch -Np1 < ../$pkgname-do-not-sort-empty-cmake-list.patch
  patch -Np1 < ../$pkgname-use-system-box2d.patch
  sed -i '/-Wpointer-sign/d' src/modules/common/Compiler.h

  # packaging fixes
  patch -Np1 < ../$pkgname-installation-paths.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DPKGDATADIR=/usr/share/$pkgname -DCAVEPACKER=off -DUNITTESTS=off
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  # doc
  cd ../$pkgname-$pkgver
  install -d "$pkgdir"/usr/share/doc
  cp -rup docs/$pkgname "$pkgdir"/usr/share/doc
}
