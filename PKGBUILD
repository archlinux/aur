# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=memlockd
pkgver=1.1
pkgrel=1
pkgdesc="Memlockd is a daemon that locks files into memory. It is meant to increase the chances of recovery from paging issues."
arch=('any')
url="https://doc.coker.com.au/projects/memlockd/"
license=('GPL')
backup=(etc/memlockd.cfg)
install=memlockd.install
changelog=
source=($pkgname-$pkgver.tar.gz::https://www.coker.com.au/$pkgname/$pkgname\_$pkgver.tar.gz
        memlockd-sysusers.conf
        memlockd.install
        $pkgname-$pkgver.patch)
sha512sums=('0f7a61dcf82d58f518d631f979f876e62f952ff80507a6dc1369b88e6a4d99aa94d48b1d54fcc3b02860239f189fa1d83a8a595b1b5a1bc9b5c051c5c0217784'
            '609fb89887a7d7cdc7a0aeae21dee54618162479ac6696d70e47e11213be6d678eba0963dc8b867a956e792c4f116e9d9ce57e7c9dcdbf126d7b0d6311dce35a'
            'b2fb6ed0d061925cdb71778cb4fcea15eb61de5cdd60d324eaffcdabaa411c4f21404dd269af4e9ac48e8dc2dee17ae2aae2a49b875c0996c8f9ab725b7fe014'
            '39f694f740cafa4a2b314124c7fa6ebb5334c81130b2c5c7b7044637d6590b1d1df43de6d2e961edc295c7f3f41051795765a320d83a551b366d769e7379fd3f')

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
        install -D -m 644 memlockd.cfg $pkgdir/etc/memlockd.cfg
        install -d -m 644 $pkgdir/etc/memlockd.d
        install -D -m 755 memlockd $pkgdir/usr/bin/memlockd
        install -D -m 644 memlockd.8 $pkgdir/usr/share/man/man8/memlockd.8
        install -D -m 644 memlockd.service $pkgdir/usr/lib/systemd/system/memlockd.service
        install -D -m 644 $srcdir/memlockd-sysusers.conf $pkgdir/usr/lib/sysusers.d/memlockd.conf
}
