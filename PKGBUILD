# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_pkgbasename=libpcap
pkgname=lib32-libpcap
pkgver=1.7.4
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=('x86_64')
url="http://www.tcpdump.org/"
license=('BSD')
depends=('lib32-glibc' 'lib32-libnl' 'lib32-libusb' 'sh' "${_pkgbasename}")
makedepends=('flex')
source=("http://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
sha256sums=('7ad3112187e88328b85e46dce7a9b949632af18ee74d97ffc3f2b41fe7f448b0'
            'SKIP')
validpgpkeys=(1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D)

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	cd ${srcdir}/${_pkgbasename}-${pkgver}
	./configure \
		--prefix=/usr \
		--libdir=/usr/lib32 \
		--enable-ipv6 \
		--enable-bluetooth=no
	make
}

package() {
	cd ${srcdir}/${_pkgbasename}-${pkgver}

	make DESTDIR=${pkgdir} install

	rm -rf ${pkgdir}/usr/lib32/libpcap.a
	rm -rf ${pkgdir}/usr/{include,share,bin}

	mkdir -p "${pkgdir}/usr/share/licenses"
	ln -s ${_pkgbasename} "${pkgdir}/usr/share/licenses/${pkgname}"
}
