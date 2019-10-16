# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor : Trevor Turner <turn3r.tr3v0r at gmail dot com>

pkgbase=virtualbox-modules-lqx
pkgname=('virtualbox-host-modules-lqx')
pkgver=6.0.14
pkgrel=1
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-lqx-headers' "virtualbox-host-dkms>=$pkgver" 'dkms')

_extramodules=extramodules-lqx
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/${pkgver}_OSE" -k "$_kernver"
}

package_virtualbox-host-modules-lqx() {
	pkgdesc='Host kernel modules for VirtualBox running under linux-lqx.'
	provides=("VIRTUALBOX-HOST-MODULES")
	depends=('linux-lqx>=5.2' 'linux-lqx<5.3')
	
	cd "dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
        install -Dt "$pkgdir/usr/lib/modules/$_extramodules" -m644 *

        # compress each module individually
        find "$pkgdir" -name '*.ko' -exec gzip -n {} +
	
        # systemd module loading
        printf "vboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt\n" |
        install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/virtualbox-host-modules-lqx.conf"
}




