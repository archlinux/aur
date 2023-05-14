# -*- mode: sh; -*-
# Maintainer: kiasoc5 <kiasoc5 at disroot dot org>
# Contributor: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
pkgname=shepherd
pkgver=0.10.1
pkgrel=1
pkgdesc="Service manager that looks after the herd."
arch=('x86_64')
url="https://www.gnu.org/software/shepherd/"
license=('GPL3')
depends=('guile' 'guile-fibers')
makedepends=('gcc' 'make' 'gawk' 'sed')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('b0bdd9eda7a44f14d9ef4502263e4a7a2b8d4725')

OPTIONS=(!strip)

build() {
	cd "$pkgname-$pkgver"
	# We do not set sbindir here so it's easier to delete in the package step.
	./configure --prefix=/usr --sysconfdir=/etc
	GUILE_AUTO_COMPILE=0 make
}

check() {
	cd "$pkgname-$pkgver"
	GUILE_AUTO_COMPILE=0 make -k check
}

package() {
	cd "$pkgname-$pkgver"
	GUILE_AUTO_COMPILE=0 make DESTDIR="$pkgdir/" install

	# get rid of halt / reboot and the var dir
	rm -r "$pkgdir/usr/var"
	rm -r "$pkgdir/usr/sbin"
	rm -r "$pkgdir/usr/share/man/man8"
}
