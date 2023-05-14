# -*- mode: sh; -*-
# Maintainer: kiasoc5 <kiasoc5 at disroot dot org>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Jeff Mickey <jeff@archlinux.org>
pkgname=shepherd
pkgver=0.10.0
pkgrel=1
pkgdesc="Service manager that looks after the herd."
arch=('x86_64')
url="https://www.gnu.org/software/shepherd/"
license=('GPL3')
depends=('guile' 'guile-fibers')
makedepends=('gcc' 'make' 'gawk' 'sed')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('1b0895fa5a0709ae612be50d5a486c137d862168')

OPTIONS=(!strip)

build() {
	cd "$pkgname-$pkgver"
	# We do not set sbindir here so it's easier to delete in the package step.
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	# get rid of halt / reboot and the var dir
	rm -r "$pkgdir/usr/var"
	rm -r "$pkgdir/usr/sbin"
	rm -r "$pkgdir/usr/share/man/man8"
}
