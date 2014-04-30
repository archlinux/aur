# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=freeablo
pkgver=0.1
pkgrel=2
pkgdesc='Modern, FLOSS reimplementation of the Diablo 1 game engine'
arch=('i686' 'x86_64')
url="http://freeablo.org/"
license=('GPL3')
depends=('sdl2' 'boost-libs')
makedepends=('cmake')
source=(freeablo-$pkgver.tar.gz::"https://github.com/wheybags/freeablo/archive/cdv$pkgver.tar.gz"
        stormlib-for-$pkgver.tar.gz::"https://github.com/wheybags/StormLib/archive/0857abc78c1d4bb924dc885781ca788cf64757a7.zip")
sha256sums=('ae9c023d296f9152cb14bf9973c367fb03a9138d636edf3d38e3c79785a6b04c'
            '5c47d6674354357680f6b296f0ac768846142b358a1949b58591c304737b11ce')

prepare() {
  # copy submodule to right location
  cp -rup StormLib-0857abc78c1d4bb924dc885781ca788cf64757a7/* $pkgname-cdv$pkgver/extern/StormLib

  # reset build folder
  rm -rf build
  mkdir build

  # patch resources directory location
  sed 's|"resources/|"/usr/share/freeablo/resources/|' -i \
    freeablo-cdv$pkgver/apps/freeablo/falevelgen/levelgen.cpp \
    freeablo-cdv$pkgver/components/diabloexe/diabloexe.cpp
}

build() {
  cd build

  cmake ../$pkgname-cdv$pkgver
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
  cp -r freeablo-cdv$pkgver/resources "$pkgdir"/usr/share/freeablo
  # doc
  install -Dm644 freeablo-cdv$pkgver/readme.md "$pkgdir"/usr/share/doc/freeablo/readme.md
}
