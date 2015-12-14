# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-ipoe-module
pkgver=1.10.0
pkgrel=1
pkgdesc="Ipoe kernel module for accel-ppp running under linux"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('linux')
makedepends=('dkms' 'linux-headers' "accel-ppp-ipoe-dkms=$pkgver")
conflicts=('')
install='accel-ppp-ipoe-module.install'

_extramodules=extramodules-4.0-ARCH

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

