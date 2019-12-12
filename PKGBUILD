# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor : Trevor Turner <turn3r.tr3v0r at gmail dot com>

pkgbase=virtualbox-modules-aufs
pkgname=('virtualbox-host-modules-aufs')
pkgver=6.1.0
pkgrel=1
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL')
makedepends=('linux-aufs-headers' "virtualbox-host-dkms>=$pkgver" 'dkms')

_kernver="$(</usr/src/linux-aufs/version)"

build() {
	# dkms need modification to be run as user
	cp -r /var/lib/dkms .
	echo "dkms_tree='$srcdir/dkms'" > dkms.conf
	# build host modules
	msg2 'Host modules'
	dkms --dkmsframework dkms.conf build "vboxhost/${pkgver}_OSE" -k "$_kernver"
}

package_virtualbox-host-modules-aufs() {
	pkgdesc='Host kernel modules for VirtualBox running under linux-aufs.'
	provides=("VIRTUALBOX-HOST-MODULES")
	depends=('linux-aufs>=5.3' 'linux-aufs<5.4')
	
	cd "/var/lib/dkms/vboxhost/${pkgver}_OSE/$_kernver/$CARCH/module"
        install -Dt "$pkgdir/usr/lib/modules/$_kernver/extramodules" -m0644 *

        # compress each module individually
        find "$pkgdir" -name '*.ko' -exec xz -T1 {} +
	
        # systemd module loading
        printf '%s\n' vboxdrv vboxnetadp vboxnetflt |
        install -D -m0644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
