# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-ipoe-module-lts
pkgver=1.9.0
pkgrel=1
pkgdesc="Ipoe kernel module for accel-ppp running under linux-lts"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('linux-lts')
makedepends=('dkms' 'linux-lts-headers' "accel-ppp-ipoe-dkms=$pkgver")
install='accel-ppp-ipoe-module-lts.install'

_extramodules=extramodules-3.14-lts

prepare() {
	# dkms need modification to be run as user
	mkdir dkms
	cp -r /var/lib/dkms/accel-ppp-ipoe dkms
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
}

build() {
	_kernver="$(cat /usr/lib/modules/$_extramodules/version)"
	cd "$srcdir"
	# build ipoe module
	msg2 'Ipoe module'
	dkms --dkmsframework dkms.conf build "accel-ppp-ipoe/$pkgver" -k "$_kernver"
}
package() {
	_kernver="$(cat /usr/lib/modules/$_extramodules/version)"
	cd "dkms/accel-ppp-ipoe/$pkgver/$_kernver/$CARCH/module"
	install -dm0755 "$pkgdir/usr/lib/modules/$_extramodules"
	install -Dm0644 ipoe.ko "$pkgdir/usr/lib/modules/$_extramodules/"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}

