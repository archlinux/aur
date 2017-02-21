# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Ionut Biru <ibiru@archlinux.org>
# Contributer: Sébastien Luttringer <seblu@aur.archlinux.org>
pkgbase=(virtualbox-ck-modules)
pkgname=(virtualbox-ck-host-modules virtualbox-ck-guest-modules)
pkgver=5.1.14
pkgrel=4
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-ck-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.9-ck
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

package_virtualbox-ck-host-modules() {
	#_Hpkgdesc='Host kernel modules for VirtualBox running under Linux-ck.'
	#pkgdesc="${_Hpkgdesc}"
	pkgdesc='Host kernel modules for VirtualBox running under Linux-ck.'
	provides=("VIRTUALBOX-HOST-MODULES")
	depends=('linux-ck>=4.9' 'linux-ck<4.10')
	#replaces=('virtualbox-ck-host-modules-corex')
	#groups=('ck-generic')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
	
	# compress each module individually
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	# systemd module loading
	install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-ck.conf"
	printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" >  \
		"$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-ck.conf"
}

package_virtualbox-ck-guest-modules() {
	#_Gpkgdesc='Guest kernel modules for VirtualBox running under Linux-ck.'
	#pkgdesc="${_Gpkgdesc}"
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-ck.'
	license=('GPL')
	provides=("VIRTUALBOX-GUEST-MODULES")
	depends=('linux-ck>=4.9' 'linux-ck<4.10')
	#replaces=('virtualbox-ck-guest-modules-corex')
	#groups=('ck-generic')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/${pkgver}_OSE/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
	
	# compress each module individually
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +

	# systemd module loading
  install -Dm644 /dev/null "$pkgdir/usr/lib/modules-load.d/virtualbox-guest-modules-ck.conf"
  printf "vboxguest\nvboxsf\nvboxvideo\n" >  \
		"$pkgdir/usr/lib/modules-load.d/virtualbox-guest-modules-ck.conf"
}
