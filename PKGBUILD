# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Ionut Biru <ibiru@archlinux.org>
# Contributer: Sébastien Luttringer <seblu@aur.archlinux.org>
pkgbase=(virtualbox-ck-modules)
pkgname=(virtualbox-ck-host-modules virtualbox-ck-guest-modules)
pkgver=5.2.4
pkgrel=1
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-ck-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-4.14-ck
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
	depends=('linux-ck>=4.14' 'linux-ck<4.15')
	#replaces=('virtualbox-ck-host-modules-corex')
	#groups=('ck-generic')

	cd "dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -Dt "$pkgdir/usr/lib/modules/$_extramodules" -m644 *

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec gzip -n {} +
	
  # systemd module loading
  printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-ck.conf"
}

package_virtualbox-ck-guest-modules() {
	#_Gpkgdesc='Guest kernel modules for VirtualBox running under Linux-ck.'
	#pkgdesc="${_Gpkgdesc}"
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-ck.'
	license=('GPL')
	provides=("VIRTUALBOX-GUEST-MODULES")
	depends=('linux-ck>=4.14' 'linux-ck<4.15')
	#replaces=('virtualbox-ck-guest-modules-corex')
	#groups=('ck-generic')

	cd "dkms/vboxguest/${pkgver}_OSE/$_kernver/$CARCH/module"
  install -Dt "$pkgdir/usr/lib/modules/$_extramodules" -m644 *

  # compress each module individually
  find "$pkgdir" -name '*.ko' -exec gzip -n {} +

  # systemd module loading
  printf "vboxguest\nvboxsf\nvboxvideo\n" |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/virtualbox-guest-modules-ck.conf"
}

# vim:set ts=2 sw=2 et:
