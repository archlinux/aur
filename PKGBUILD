# Contributor: Sinnamon (George Aladin) <AngleSi at yahoo dot com>

pkgname=loop-aes
_pkgname=loop-AES
pkgver=3.7z
pkgrel=1
pkgdesc="loop Linux kernel module that has AES,Twofish,Blowfish,Serpent cipher built-in"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://loop-aes.sourceforge.net"
depends=('linux' 'util-linux-aes')
makedepends=('linux-headers')
install=${pkgname}.install
source=(https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/v${pkgver}/${_pkgname}-v${pkgver}.tar.bz2{,.sign}
	loop-aes.mod
	loop-aes.modules)
b2sums=('44a64f6f071a2263ba9aec7e9d576ede4761ef12cdded1725f897fdf8f8c8aa0a841bd34380d020159d1509cd78b7f80fd8c0f7f340cc5b35d16690aacfa6e0b'
        'SKIP'
        'c9fed266434094f41257da7e9ca5e9a59f19bd2f4c408269ae957f96d449d4191f03415a2d57b370508efdf1413e04c237bf523eec4189e6864b039a3ef21b66'
        '1ff89adc37dce634befdbe8d4bbd6420df3ae55bb4bd902f6d73783f6a19959fbfd3128275f59bd038d635419db882834d04996fd7784c28aa605055747f28fa')
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

	# setup modules handling
	install -d -m755 "${pkgdir}/usr/lib/modprobe.d"
	install -Dm644 "${srcdir}/${pkgname}.mod" "${pkgdir}/usr/lib/modprobed.d/loop.conf"
	install -d -m755 "${pkgdir}/usr/lib/modules-load.d"
	install -Dm644 "${srcdir}/${pkgname}.modules" "${pkgdir}/usr/lib/modules-load.d/loop.conf"
}
