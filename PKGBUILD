# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=cannonball
pkgver=0.22
pkgrel=2
pkgdesc='Enhanced OutRun Engine'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl' 'gcc-libs' 'bash')
makedepends=('cmake' 'boost' 'chrpath')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/djyt/cannonball/archive/v$pkgver.tar.gz"
        "$pkgname.sh")
sha256sums=('c3624bca9e7ef72eb3fcbfef22549231a7d124f470160efa5a449443a844e0c7'
            '3400daeb32033967e2e6a8202ab38943786f8b9d61b662e77d4caaeb47d89277')

prepare() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake ../cmake -DTARGET=debian
  make
}

package() {
  cd $pkgname-$pkgver

  # launcher + binary
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/$pkgname "$pkgdir"/usr/lib/$pkgname/$pkgname
  # remove rpath
  chrpath -d "$pkgdir"/usr/lib/$pkgname/$pkgname
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/$pkgname/config.xml
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
