# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgbase=(virtualbox-think-modules)
pkgname=(virtualbox-think-host-modules virtualbox-think-guest-modules)
pkgdesc='Host and guest  kernel modules for VirtualBox running under linux-think'
pkgver=5.0.16
pkgrel=4
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-think>=4.5'
	 'linux-think<4.6')
makedepends=('linux-think-headers'
	     "virtualbox-host-dkms>=$pkgver" 
	     "virtualbox-guest-dkms>=$pkgver" 
	     'dkms')

_extramodules=extramodules-4.5-think
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/$pkgver"_OSE -k "$_kernver"
	# build guest modules
	msg2 'Guest modules'
	dkms --dkmsframework dkms.conf build "vboxguest/$pkgver"_OSE -k "$_kernver"
}

package_virtualbox-think-host-modules() {
	#_Hpkgdesc='Host kernel modules for VirtualBox running under linux-think.'
	#pkgdesc="${_Hpkgdesc}"
	pkgdesc='Host kernel modules for VirtualBox running under linux-think'
	provides=("virtualbox-host-modules")
	depends=('linux-think>=4.5' 'linux-think<4.6')
	conflicts=('virtualbox-ck-modules' 'virtualbox-ck-host-modules-atom' 'virtualbox-ck-host-modules-barcelona' 'virtualbox-ck-host-modules-bulldozer' 'virtualbox-ck-host-modules-corex' 'virtualbox-ck-host-modules-core2' 'virtualbox-ck-host-modules-haswell' 'virtualbox-ck-host-modules-broadwell' 'virtualbox-ck-host-modules-ivybridge' 'virtualbox-ck-host-modules-kx' 'virtualbox-ck-host-modules-k10' 'virtualbox-ck-host-modules-nehalem' 'virtualbox-ck-host-modules-p4' 'virtualbox-ck-host-modules-piledriver' 'virtualbox-ck-host-modules-pentm' 'virtualbox-ck-host-modules-sandybridge' 'virtualbox-ck-host-modules-silvermont')
	install=host.install
	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxhost/$pkgver"_OSE"/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/host.install"
}

package_virtualbox-think-guest-modules() {
	#_Gpkgdesc='Guest kernel modules for VirtualBox running under linux-think.'
	#pkgdesc="${_Gpkgdesc}"
	pkgdesc='Guest kernel modules for VirtualBox running under linux-think'
	license=('GPL')
	provides=("virtualbox-guest-modules")
	depends=('linux-think>=4.5' 'linux-think<4.6')
	conflicts=('virtualbox-ck-modules' 'virtualbox-ck-guest-modules-atom' 'virtualbox-ck-guest-modules-barcelona' 'virtualbox-ck-guest-modules-bulldozer' 'virtualbox-ck-guest-modules-corex' 'virtualbox-ck-guest-modules-core2' 'virtualbox-ck-guest-modules-haswell' 'virtualbox-ck-guest-modules-broadwell' 'virtualbox-ck-guest-modules-ivybridge' 'virtualbox-ck-guest-modules-kx' 'virtualbox-ck-guest-modules-k10' 'virtualbox-ck-guest-modules-nehalem' 'virtualbox-ck-guest-modules-p4' 'virtualbox-ck-guest-modules-piledriver' 'virtualbox-ck-guest-modules-pentm' 'virtualbox-ck-guest-modules-sandybridge' 'virtualbox-ck-guest-modules-silvermont')
	install=guest.install

	install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
	cd "dkms/vboxguest/$pkgver"_OSE"/$_kernver/$CARCH/module"
	install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='$_extramodules'/" "$startdir/guest.install"
}

