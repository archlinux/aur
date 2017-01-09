# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=memlockd
pkgver=1.2
pkgrel=1
pkgdesc="A daemon that locks files into memory. It is meant to increase the chances of recovery from paging issues."
arch=('i686' 'x86_64')
url="https://doc.coker.com.au/projects/memlockd/"
license=('GPL')
depends=('glibc')
backup=(etc/memlockd.cfg)
install=memlockd.install
changelog=
source=($pkgname-$pkgver.tar.gz::https://www.coker.com.au/$pkgname/$pkgname\_$pkgver.tar.gz
        memlockd-sysusers.conf
        $pkgname-$pkgver.patch)
sha512sums=('96879aca7dbc07f84f0eb3c022beecae27106dc2c15c239f0120d13cd868840dccb9aaef0bed74bb8987246ba3f802197f7dc712298b8688e85a07b44d6d04a3'
            '609fb89887a7d7cdc7a0aeae21dee54618162479ac6696d70e47e11213be6d678eba0963dc8b867a956e792c4f116e9d9ce57e7c9dcdbf126d7b0d6311dce35a'
            '27da225c383a6e9067d76485319ec4350c6308a4190cc43747c552284151cdb92fc1cd74e6da0cd1a6ddb6dddd1ed12d11103ebf645d330074cac3e7d8866b2c')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
        install -D -m 644 memlockd.cfg "$pkgdir/etc/memlockd.cfg"
        install -d -m 755 "$pkgdir/etc/memlockd.d"
        install -D -m 755 memlockd "$pkgdir/usr/bin/memlockd"
        install -D -m 644 memlockd.8 "$pkgdir/usr/share/man/man8/memlockd.8"
        install -d -m 755 "$pkgdir/usr/lib/memlockd"
        install -D -m 644 memlockd.service "$pkgdir/usr/lib/systemd/system/memlockd.service"
        install -D -m 644 "$srcdir/memlockd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/memlockd.conf"
}
