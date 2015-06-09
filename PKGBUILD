# Maintainer: Christoph Korn <c_korn@gmx.de>
_pkgname=NetMauMau
pkgbase=netmaumau
pkgname=('netmaumau-server' 'netmaumau-client' 'libnetmaumaucommon4' 'libnetmaumauclient3' 'netmaumau-dev')
pkgver=0.20.1
pkgrel=1
pkgdesc='Server for the popular card game Mau Mau'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/netmaumau/"
license=('GPL3')
makedepends=('lua51' 'vim-minimal' 'file' 'popt' 'sqlite')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/velnias75/NetMauMau/archive/V${pkgver}.tar.gz"
        "netmaumau.install")
md5sums=('ca496629a08f45273183fbdcd9a7de14'
         'ff49fcd3b06719e1d0a2555f3faf5225')

build() {
	cd "${_pkgname}-${pkgver}"
	autoreconf -fi
	./configure --prefix=/usr --bindir=/usr/bin --enable-cli-client \
	--enable-ai-name="arch" --localstatedir=/var/games

	make
}

package_netmaumau-server() {
	pkgdesc="Server for the popular card game Mau Mau - server"
	depends=('popt' 'sqlite' 'lua51' "libnetmaumaucommon4=$pkgver")
	install=${pkgbase}.install
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
	rm "${pkgdir}/usr/bin/nmm-client"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/usr/include"
	rm -r "${pkgdir}/usr/lib"
}

package_netmaumau-client() {
	pkgdesc="Server for the popular card game Mau Mau - console client"
	depends=('popt' 'gcc-libs' "libnetmaumaucommon4=$pkgver" "libnetmaumauclient3=$pkgver")
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/etc"
	rm "${pkgdir}/usr/bin/nmm-server"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/usr/include"
	rm -r "${pkgdir}/usr/lib"
	rm -r "${pkgdir}/usr/share"
}

package_libnetmaumaucommon4() {
	pkgdesc="Server for the popular card game Mau Mau - common library"
	depends=('file' 'gcc-libs')
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/etc"
	rm -r "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/usr/include"
	rm -r "${pkgdir}/usr/lib/pkgconfig"
	find "${pkgdir}/usr/lib/" -name "*client*" -delete
	rm -r "${pkgdir}/usr/share"
	find "${pkgdir}/usr/lib/" -name "*.so" -delete
	find "${pkgdir}/usr/lib/" -name "*.a" -delete
}

package_libnetmaumauclient3() {
	pkgdesc="Server for the popular card game Mau Mau - client library"
	depends=('file' 'gcc-libs' "libnetmaumaucommon4=$pkgver")
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/etc"
	rm -r "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/usr/include"
	rm -r "${pkgdir}/usr/lib/pkgconfig"
	find "${pkgdir}/usr/lib/" -name "*common*" -delete
	rm -r "${pkgdir}/usr/share"
	find "${pkgdir}/usr/lib/" -name "*.so" -delete
	find "${pkgdir}/usr/lib/" -name "*.a" -delete
}

package_netmaumau-dev() {
	pkgdesc="Server for the popular card game Mau Mau - development files"
	depends=("libnetmaumaucommon4=$pkgver" "libnetmaumauclient3=$pkgver")
	arch=('any')
	cd "${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/etc"
	rm -r "${pkgdir}/var"
	rm -r "${pkgdir}/usr/bin"
	rm -r "${pkgdir}/usr/share"
	find "${pkgdir}/usr/lib/" -name "*.so.*" -delete
}
