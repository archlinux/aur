# Maintainer: queueRAM <queueRAM@gmail.com>
pkgname=hydan
pkgver=0.13
pkgrel=1
pkgdesc="steganographically conceal messages in 32-bit applications"
arch=('i686' 'x86_64')
url="http://www.crazyboy.com/hydan/"
license=('unknown')
depends=('openssl')
source=("http://www.crazyboy.com/hydan/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
sha256sums=('47f295a20c6a07fa0c244b48ab506067a981fc780305c307b8f345b6b6302023'
            'e5f0773ca2f1577df353ca195451d17d924c6ed166a03d30537ec2c5c168acf7')

prepare() {
	cd "$pkgname"
   # patch for opaque struct changes in openssl 1.1.0+
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname"
	make CFLAGS="$CFLAGS -Ilibdisasm/src/arch/i386/libdisasm -DVARBITS"
}

package() {
	cd "$pkgname"
   install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
   ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-decode"
   ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname-stats"
   install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
   install -Dm644 README.details "$pkgdir/usr/share/$pkgname/README.details"
}
