#  Maintainer: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=loop-aes
_pkgname=loop-AES
pkgver=v3.7g
pkgrel=5
pkgdesc="This package provides loadable Linux kernel module loop
that has AES,Twofish,Blowfish,Serpent cipher built-in."
arch=('i686' 'x86_64')
license=('GPL2')
url="http://loop-aes.sourceforge.net"
depends=('linux' 'util-linux-aes')
makedepends=('linux-headers')
install=${pkgname}.install

source=(${url}/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)

md5sums=('6fb2217b15586295ce949e93538a701d')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make MODINST=n EXTRA_CIPHERS=y -j1 LINUX_SOURCE=/usr/lib/modules/$(uname -r)/build || return 1

}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/tmp-d-kbuild/
	gzip loop.ko
	install -D loop.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/loop-aes.ko.gz
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	install -d -m755 "${pkgdir}/usr/lib/modules-load.d"
	echo "blacklist loop" >> "${pkgdir}/usr/lib/modprobe.d/loop.conf"
	echo "alias loop loop-aes" > "${pkgdir}/usr/lib/modprobe.d/loop.conf"
	echo "loop-aes" > "${pkgdir}/usr/lib/modules-load.d/loop.conf"
}
