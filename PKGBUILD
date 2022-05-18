# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=pinktrace-1
pkgname=(pinktrace-1 python-pinktrace)
pkgdesc='Lightweight ptrace() wrapper library'
pkgver=1.0.0
pkgrel=4
license=(custom:BSD)
depends=(glibc)
makedepends=(python)
url=https://pinktrace.exherbo.org/
source=("https://dev.exherbo.org/distfiles/pinktrace/pinktrace-${pkgver}.tar.bz2")
arch=(x86_64)
sha512sums=('35a3071902d1e7bfaaec2880c6d1fd8ecd085d9fea6b455e1b193da808a52cb16c54bdac38af69760bb16847c0d03530e04c9e3fae055fd8f719d8bced977cd9')

prepare () {
	cd "pinktrace-${pkgver}"
	autoreconf -fvis
}

build () {
	cd "pinktrace-${pkgver}"
	./configure --prefix=/usr --enable-python
	make
}

check () {
	make -C "pinktrace-${pkgver}" check
}

_package_common () {
	cd "pinktrace-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	rm -r "${pkgdir}/usr/lib/libpinktrace_1.0.a"
}

package_pinktrace-1 () {
	_package_common
	rm -rf "${pkgdir}/usr/lib"/python3.*/
}

package_python-pinktrace ()
{
	depends=(pinktrace-1 python)
	_package_common
	rm -rf "${pkgdir}/usr/share/doc" "${pkgdir}/usr/lib/pkgconfig" \
		"${pkgdir}/usr/include"
	rm -f "${pkgdir}/usr/lib"/libpinktrace_1.0.so*
}
