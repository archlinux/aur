# Maintainer: Sven Viilup <s dot viilup at gmail dot com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead at gmail dot com>
pkgname=madfuload
pkgver=1.2
pkgrel=6
provides=(madfuload)
depends=(glibc)
pkgdesc="USB and MIDI firmware loaders for M-Audio (or Midiman) hardware"
arch=('i686' 'x86_64' 'armv7h')
url="http://sourceforge.net/projects/usb-midi-fw"
license=('GPL')
source=("http://downloads.sourceforge.net/usb-midi-fw/$pkgname-$pkgver.tar.gz"
        'use-udevadm-in-configure.patch'
        'fix-64-bit-implicit-declarations.patch'
        '42-madfuload.rules')
md5sums=('6a2c68021e2e05c4eb35e67158b9414e'
         '7e77d22ecc489eb849d2b6fadc97e1ca'
         '49075ca2b54d75639fdca3be34f1815c'
         'b7b883dc6d35676f93d598daebaa5c90')
install=madfuload.install

build() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -p0 < "$srcdir/use-udevadm-in-configure.patch"
 patch -p0 < "$srcdir/fix-64-bit-implicit-declarations.patch"
 ./configure --sbindir=/usr/bin --prefix=/usr --with-udev=/etc/udev
 make
}

package() {
 cd "$srcdir/$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 install -Dm 644 "$srcdir/42-madfuload.rules" "$pkgdir/etc/udev/rules.d/42-madfuload.rules"
}
