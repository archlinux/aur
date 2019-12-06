# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=3.8.1
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
sha512sums=('aaa926a4b149c5289437b7d01d1ac969d47a55eb1727923db6a3d7ac693170bf005773dac81d2aabafef4e3a813568d762a01ed6cb213d524949469a035d7139')

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
