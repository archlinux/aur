# Maintainer: nemesys <nemstar AT zoho DOT com>
# Contributer: graysky <graysky AT archlinux DOT us>
# Contributer: Ionut Biru <ibiru@archlinux.org>
# Contributer: Sébastien Luttringer <seblu@aur.archlinux.org>
pkgbase=(virtualbox-ck-fbcondecor-modules)
pkgname=(virtualbox-ck-fbcondecor-host-modules virtualbox-ck-fbcondecor-guest-modules)
pkgver=4.3.20
pkgrel=4
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-ck-fbcondecor-headers' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-3.18-ck-fbcondecor
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

package_virtualbox-ck-fbcondecor-host-modules() {
	#_Hpkgdesc='Host kernel modules for VirtualBox running under Linux-ck-fbcondecor.'
	#pkgdesc="${_Hpkgdesc}"
	pkgdesc='Host kernel modules for VirtualBox running under Linux-ck-fbcondecor.'
	provides=("virtualbox-host-modules")
	depends=('linux-ck-fbcondecor>=3.18' 'linux-ck-fbcondecor<3.19')
	conflicts=('virtualbox-ck-host-modules-atom' 'virtualbox-ck-host-modules-barcelona' 'virtualbox-ck-host-modules-bulldozer' 'virtualbox-ck-host-modules-corex' 'virtualbox-ck-host-modules-core2' 'virtualbox-ck-host-modules-haswell' 'virtualbox-ck-host-modules-ivybridge' 'virtualbox-ck-host-modules-kx' 'virtualbox-ck-host-modules-k10' 'virtualbox-ck-host-modules-nehalem' 'virtualbox-ck-host-modules-p4' 'virtualbox-ck-host-modules-piledriver' 'virtualbox-ck-host-modules-pentm' 'virtualbox-ck-host-modules-sandybridge')
	#replaces=('virtualbox-ck-host-modules-corex')
	#groups=('ck-generic')
	install=host.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-ck-fbcondecor-guest-modules() {
	#_Gpkgdesc='Guest kernel modules for VirtualBox running under Linux-ck-fbcondecor.'
	#pkgdesc="${_Gpkgdesc}"
	pkgdesc='Guest kernel modules for VirtualBox running under Linux-ck-fbcondecor.'
	license=('GPL')
	provides=("virtualbox-guest-modules")
	depends=('linux-ck-fbcondecor>=3.18' 'linux-ck-fbcondecor<3.19')
	conflicts=('virtualbox-ck-guest-modules-atom' 'virtualbox-ck-guest-modules-barcelona' 'virtualbox-ck-guest-modules-bulldozer' 'virtualbox-ck-guest-modules-corex' 'virtualbox-ck-guest-modules-core2' 'virtualbox-ck-guest-modules-haswell' 'virtualbox-ck-guest-modules-ivybridge' 'virtualbox-ck-guest-modules-kx' 'virtualbox-ck-guest-modules-k10' 'virtualbox-ck-guest-modules-nehalem' 'virtualbox-ck-guest-modules-p4' 'virtualbox-ck-guest-modules-piledriver' 'virtualbox-ck-guest-modules-pentm' 'virtualbox-ck-guest-modules-sandybridge')
	#replaces=('virtualbox-ck-guest-modules-corex')
	#groups=('ck-generic')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}

