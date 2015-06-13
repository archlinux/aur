# Contributor: Jared Casper <jaredcasper@gmail.com>
pkgname=magic
pkgver=8.0.206
pkgrel=1
pkgdesc="A VLSI layout system"
url="http://opencircuitdesign.com/magic/"
arch=('i686' 'x86_64')
license=('custom:copyright')
depends=('tcl' 'tk' 'libx11')
makedepends=('tcsh')
optdepends=('mesa: for better graphics'
            'blt: to create a tree diagram of the cell hierarchy in a design')
changelog=$pkgname.changelog
source=(http://opencircuitdesign.com/magic/archive/$pkgname-$pkgver.tgz)
md5sums=('c153fbde29fcf589a58dc23889ebf064')

build() {
   cd "$srcdir/$pkgname-$pkgver/"
   ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/$pkgname-$pkgver/"
   make -j1 DESTDIR="$pkgdir" MANDIR=/usr/share/man install
   install -d "$pkgdir/usr/share/licenses/$pkgname"
   if [ -x /usr/bin/ps2ascii ]; then
      /usr/bin/ps2ascii "$pkgdir/usr/lib/magic/doc/copyright.ps" > "$pkgdir/usr/share/licenses/$pkgname/copyright"
   else
      install -m644 "$pkgdir/usr/lib/magic/doc/copyright.ps" "$pkgdir/usr/share/licenses/magic"
   fi
   mv "$pkgdir/usr/share/man/man1/extcheck.1" "$pkgdir/usr/share/man/man1/extcheck-magic.1"
}

