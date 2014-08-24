# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=cannonball-git
pkgver=0.22.r3.g9b5ed35
pkgrel=1
pkgdesc='Enhanced OutRun Engine (development version)'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl' 'gcc-libs' 'bash')
makedepends=('git' 'cmake' 'boost' 'chrpath')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install=${pkgname%-*}.install
source=(${pkgname%-*}::"git+https://github.com/djyt/cannonball.git"
        "${pkgname%-*}.sh")
sha256sums=('SKIP'
            '3400daeb32033967e2e6a8202ab38943786f8b9d61b662e77d4caaeb47d89277')

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

  cmake ../cmake -DTARGET=debian
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
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
