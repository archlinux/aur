# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=cannonball
pkgver=0.3
pkgrel=1
pkgdesc='Enhanced OutRun Engine'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl' 'gcc-libs' 'bash')
makedepends=('cmake' 'boost')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/djyt/cannonball/archive/v$pkgver.tar.gz"
        "$pkgname-fixes.patch"
        "$pkgname.sh")
sha256sums=('572b983b5490f1131d502e573d59e87ff841d5baa608b40482c198686818a476'
            '6e8c5788b00c2c89b9e61729cac47bd47d577c72109bdac2b255af29df1c525e'
            '3400daeb32033967e2e6a8202ab38943786f8b9d61b662e77d4caaeb47d89277')

prepare() {
  cd $pkgname-$pkgver

  # fix for new boost api, also a missing include
  patch -Np1 < ../$pkgname-fixes.patch

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake ../cmake -DTARGET=debian -DCMAKE_SKIP_BUILD_RPATH=TRUE
  make
}

package() {
  cd $pkgname-$pkgver

  # launcher + binary
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/$pkgname "$pkgdir"/usr/lib/$pkgname/$pkgname
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/$pkgname/config.xml
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
