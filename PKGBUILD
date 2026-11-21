# Maintainer: bakatrouble bakatrouble@gmail.com
pkgname=guildmaster
pkgver=0.1
pkgrel=1
_commit=463382ba5b47625a9355832cd792a164c54237f9
pkgdesc='FIFO-like GNU make jobserver node via CUSE'
arch=('x86_64')
url='https://codeberg.org/amonakov/guildmaster'
license=('ISC')
depends=('fuse3')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf')
source=("$pkgname-$_commit.tar.gz::https://codeberg.org/amonakov/guildmaster/archive/$_commit.tar.gz"
        "$pkgname.service")
sha256sums=('825b1a2c5748eb89d57fe6ef1435c1bf8d33656a696f9f5ca6b87b0965ccbfcb'
            'c9748e7788a32288d8e80ae00c098485e7f039fdf9fa715ed7ec95b7dcb38b09')

build() {
  cd "$srcdir/$pkgname"
  arch-meson . "$srcdir/build" \
    -Dsystemd=false -Dopenrc=false -Dudev=false
  meson compile -C "$srcdir/build"
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C "$srcdir/build" --destdir "$pkgdir"
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
