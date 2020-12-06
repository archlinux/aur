# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=3.13.0
epoch=1
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
conflicts=('archipelago-bin')
depends=('nodejs' 'libxkbfile' 'libx11')
makedepends=("git" "yarn" 'python2' 'libpng'
             'libx11' 'node-gyp' 'libxtst')
source=("https://github.com/npezza93/archipelago/archive/v$pkgver.tar.gz")
sha512sums=('13c9789e9e591d9c0b160859ad67373037efbce04b6422d733b6e9e9526f4d74d7586be4fc8afadfd6ffcb4cbaceab789e6f4126bcf6eff116a733258de5b226')

build() {
  cd $srcdir/$pkgname-$pkgver
  yarn install --ignore-engines
  yarn run compile
  yarn run pack
  ./node_modules/.bin/electron-builder --linux deb
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ar -x dist/*.deb
  tar -xf data.tar.xz
  cp -r {opt/,usr/} $pkgdir/

install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
