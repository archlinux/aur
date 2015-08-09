# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=freeablo
pkgver=0.3
pkgrel=1
_stormlibhash=5da7bbb379e99014fbb9a2de5a43daf1483bb201
pkgdesc='Modern, FLOSS reimplementation of the Diablo 1 game engine'
arch=('i686' 'x86_64')
url="http://freeablo.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'boost-libs' 'librocket' 'libgl' 'qt5-base')
makedepends=('cmake' 'boost')
install=$pkgname.install
source=(freeablo-$pkgver.tar.gz::"https://github.com/wheybags/freeablo/archive/v$pkgver.tar.gz"
        stormlib-for-$pkgver.tar.gz::"https://github.com/wheybags/StormLib/archive/$_stormlibhash.zip")
sha256sums=('c1b47e0944004e8cd7d76a323b03ef38e466ad697be34d2030eba3bc63b38533'
            '5580a5e1ffc7ce43040895c3c295a9e186e438139042d2c6425743d52dfea0d2')

prepare() {
  # copy submodule to right location
  cp -rup StormLib-$_stormlibhash/* $pkgname-$pkgver/extern/StormLib

  # reset build folder
  rm -rf build
  mkdir build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver
  make
}

package() {
  # binaries
  install -Dm755 build/freeablo "$pkgdir"/usr/bin/freeablo
  for _f in celview exedump mpqtool launcher; do
    install -Dm755 build/$_f "$pkgdir"/usr/bin/freeablo-$_f
  done
  # data
  install -d "$pkgdir"/usr/share/freeablo
  cp -r freeablo-$pkgver/resources "$pkgdir"/usr/share/freeablo
  # doc
  install -Dm644 freeablo-$pkgver/readme.md "$pkgdir"/usr/share/doc/freeablo/readme.md
}
