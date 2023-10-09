# Maintainer: Anima <animafps@pm.me>
pkgname=irqbalance-openrc
pkgver=1.9.2
pkgrel=3
pkgdesc="Daemon that distributes interrupts over the processors"
url="https://github.com/Irqbalance/irqbalance"
arch=('any')
license=('GPL-2.0-or-later')
conflicts=('irqbalance')
provides=('irqbalance')
makedepends=('glib2' 'autoconf' 'automake' 'libtool' 'ncurses' 'numactl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Irqbalance/irqbalance/archive/v$pkgver.tar.gz"
	'musl.patch'
	'irqbalance.confd'
	'irqbalance.initd'
	)

prepare() {
        cd irqbalance-$pkgver
	./autogen.sh
}

build() {
        cd irqbalance-$pkgver
	./configure \
		--build=$CBUILD \
		--host=$CHOST \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info\
                --sbindir=/usr/bin
	make
}

check() {
        cd irqbalance-$pkgver
	make check
}

package() {
        cd irqbalance-$pkgver
	make DESTDIR="$pkgdir" install
        cd ..
	install -m755 -D "$srcdir"/irqbalance.initd "$pkgdir"/etc/init.d/irqbalance
	install -m644 -D "$srcdir"/irqbalance.confd "$pkgdir"/etc/conf.d/irqbalance
}
sha256sums=('19a1feb379803cc27f86a71cf1b94bb2e103811691ff7448119d8f1e88645bd3'
            'c98932f04ff362e16aaece28bda2cb3ab90e882935bc2a98f207360d2f761b2e'
            '98bb18cd977a0706c3e63a36a7dfb2aa01cd84cabb719da0ea5bf795e5d02413'
            '7c6b7a0c0385fcc63a693bb705bc378a333ff69a6ec100ce9695de1d92bca262')
