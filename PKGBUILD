# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor : Trevor Turner <turn3r.tr3v0r at gmail dot com>

pkgbase=virtualbox-modules-uksm
pkgname=('virtualbox-host-modules-uksm' 'virtualbox-guest-modules-uksm')
pkgver=5.2.0
pkgrel=1
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-uksm-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.13-uksm
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/${pkgver}_OSE" -k "$_kernver"
	# build guest modules
	msg2 'Guest modules'
	dkms --dkmsframework dkms.conf build "vboxguest/${pkgver}_OSE" -k "$_kernver"
}

package_virtualbox-host-modules-uksm() {
	pkgdesc='Host kernel modules for VirtualBox running under Linux-uksm.'
	license=('GPL')
	depends=('linux-uksm>=4.13' 'linux-uksm<4.14')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
	
	# compress each module individually
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	# systemd module loading
	install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-uksm.conf"
	printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" >  \
		"$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-uksm.conf"
}

package_virtualbox-guest-modules-uksm() {
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-uksm.'
	license=('GPL')
	depends=('linux-uksm>=4.13' 'linux-uksm<4.14')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/${pkgver}_OSE/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
	
	# compress each module individually
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	# systemd module loading
        install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/virtualbox-guest-modules-uksm.conf"
        printf "vboxguest\nvboxsf\nvboxvideo\n" >  \
		"$pkgdir/usr/lib/modules-load.d/virtualbox-guest-modules-uksm.conf"
}
