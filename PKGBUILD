# Contributor: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=loop-aes
_pkgname=loop-AES
pkgver=3.7t
pkgrel=1
pkgdesc="loop Linux kernel module that has AES,Twofish,Blowfish,Serpent cipher built-in"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://loop-aes.sourceforge.net"
depends=('linux' 'util-linux-aes')
makedepends=('linux-headers')
install=${pkgname}.install
source=(https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2{,.sign})
md5sums=('974a0705207d97772b8c1388c43aee58'
         'SKIP')
validpgpkeys=('12D64C3ADCDA0AA427BDACDFF0733C808132F189') # Jari Ruusu (2013) <jariruusu@users.sourceforge.net>


build() {
	cd "${_pkgname}-v${pkgver}"
	make MODINST=n EXTRA_CIPHERS=y -j1 LINUX_SOURCE=/usr/lib/modules/$(uname -r)/build
}

package() {
	cd "${_pkgname}-v${pkgver}/tmp-d-kbuild/"
	gzip loop.ko
	gzip loop_serpent.ko
	gzip loop_twofish.ko
	gzip loop_blowfish.ko
	install -D loop.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/loop-aes.ko.gz
	install loop_serpent.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/
	install loop_twofish.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/
	install loop_blowfish.ko.gz ${pkgdir}/usr/lib/modules/$(uname -r)/$(readlink /usr/lib/modules/$(uname -r)/extramodules)/
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	install -d -m755 "${pkgdir}/usr/lib/modules-load.d"
	echo "blacklist loop" >> "${pkgdir}/usr/lib/modprobe.d/loop.conf"
	echo "alias loop loop-aes" > "${pkgdir}/usr/lib/modprobe.d/loop.conf"
	echo "loop-aes" > "${pkgdir}/usr/lib/modules-load.d/loop.conf"
	echo "loop_serpent" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
	echo "loop_twofish" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
	echo "loop_blowfish" >> "${pkgdir}/usr/lib/modules-load.d/loop.conf"
}
