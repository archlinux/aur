# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor : Trevor Turner <turn3r.tr3v0r at gmail dot com>

pkgbase=virtualbox-modules-bfq
pkgname=('virtualbox-host-modules-bfq' 'virtualbox-guest-modules-bfq')
pkgver=5.0.14
pkgrel=3
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-bfq-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.5-bfq
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

package_virtualbox-host-modules-bfq() {
	pkgdesc='Host kernel modules for VirtualBox running under Linux-bfq.'
	license=('GPL')
	depends=('linux-bfq>=4.5' 'linux-bfq<4.6')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-guest-modules-bfq() {
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-bfq.'
	license=('GPL')
	depends=('linux-bfq>=4.5' 'linux-bfq<4.6')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}
