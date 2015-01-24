# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=freeablo
pkgver=0.2
pkgrel=1
pkgdesc='Modern, FLOSS reimplementation of the Diablo 1 game engine'
arch=('i686' 'x86_64')
url="http://freeablo.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'boost-libs' 'librocket')
makedepends=('cmake')
install=$pkgname.install
source=(freeablo-$pkgver.tar.gz::"https://github.com/wheybags/freeablo/archive/v$pkgver.tar.gz"
        stormlib-for-$pkgver.tar.gz::"https://github.com/wheybags/StormLib/archive/5da7bbb379e99014fbb9a2de5a43daf1483bb201.zip")
sha256sums=('0a5315a68403a5931e970cb6eae9ba07f004c1050a22579c20653835e55ebeb4'
            '59154b9748071802eb2e19ab6f694c8841f7681843a7b648dfc3d024729d048c')

prepare() {
  # copy submodule to right location
  cp -rup StormLib-5da7bbb379e99014fbb9a2de5a43daf1483bb201/* $pkgname-$pkgver/extern/StormLib

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
  for _f in celview exedump mpqtool; do
    install -Dm755 build/$_f "$pkgdir"/usr/bin/freeablo-$_f
  done
  # data
  install -d "$pkgdir"/usr/share/freeablo
  cp -r freeablo-$pkgver/resources "$pkgdir"/usr/share/freeablo
  # doc
  install -Dm644 freeablo-$pkgver/readme.md "$pkgdir"/usr/share/doc/freeablo/readme.md
}
