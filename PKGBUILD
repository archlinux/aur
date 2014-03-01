# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=cannonball
pkgname=$_pkgbase-git
pkgver=0.22.r3.g9b5ed35
pkgrel=1
pkgdesc='Enhanced OutRun Engine (development version)'
arch=('i686' 'x86_64')
url="http://reassembler.blogspot.de/"
license=('custom')
depends=('sdl' 'bash')
makedepends=('git' 'cmake' 'boost')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/djyt/cannonball.git"
        "$_pkgbase.sh")
md5sums=('SKIP'
         '06ea516bc9a4454da988074465e25943')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd $_pkgbase
  rm -rf build
  mkdir build
}

build() {
  cd $_pkgbase/build

  cmake ../cmake -DTARGET=debian
  make
}

package() {
  cd $_pkgbase

  # launcher + binary
  install -Dm755 ../$_pkgbase.sh "$pkgdir"/usr/bin/$_pkgbase
  install -Dm755 build/$_pkgbase "$pkgdir"/usr/lib/$_pkgbase/$_pkgbase
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/$_pkgbase/config.xml
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
