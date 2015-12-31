# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=cannonball-git
pkgver=0.3.r9.g412576c
pkgrel=1
pkgdesc='Enhanced OutRun Engine (development version)'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl2' 'gcc-libs' 'bash')
makedepends=('git' 'cmake' 'boost' 'chrpath')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install=${pkgname%-*}.install
source=(${pkgname%-*}::"git+https://github.com/djyt/cannonball.git"
        "${pkgname%-*}.sh")
sha256sums=('SKIP'
            '2cb4472728b9e3657b40fa4202944d4c0736e3b7287cbeb5fc4d622de4d477c0')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname%-*}
  rm -rf build
  mkdir build
}

build() {
  cd ${pkgname%-*}/build

  cmake ../cmake -DTARGET=sdl2
  make
}

package() {
  cd ${pkgname%-*}

  # launcher + binary
  install -Dm755 ../${pkgname%-*}.sh "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm755 build/${pkgname%-*} "$pkgdir"/usr/lib/${pkgname%-*}/${pkgname%-*}
  # remove rpath
  chrpath -d "$pkgdir"/usr/lib/${pkgname%-*}/${pkgname%-*}
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/${pkgname%-*}/config.xml
  # widescreen tilemap data
  install -d "$pkgdir"/usr/share/${pkgname%-*}/res
  install -m644 res/*.bin "$pkgdir"/usr/share/${pkgname%-*}/res
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
