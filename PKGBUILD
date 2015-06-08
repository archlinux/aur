# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>

pkgbase=virtualbox-modules-uksm-ck
pkgname=('virtualbox-host-modules-uksm-ck' 'virtualbox-guest-modules-uksm-ck')
pkgver=4.3.28
pkgrel=1
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-uksm-ck-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.0-uksm-ck
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
	# build guest modules
	msg2 'Guest modules'
	dkms --dkmsframework dkms.conf build "vboxguest/$pkgver" -k "$_kernver"
}

package_virtualbox-host-modules-uksm-ck() {
	pkgdesc='Host kernel modules for VirtualBox running under Linux-uksm-ck.'
	license=('GPL')
	depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-guest-modules-uksm-ck() {
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-uksm-ck.'
	license=('GPL')
	depends=('linux-uksm-ck>=4.0' 'linux-uksm-ck<4.1')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}