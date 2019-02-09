# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.22.4
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
makedepends=(gperf ruby cmake python2 ninja)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=('6e5c668473c57906bdec1c641bac4579')
sha1sums=('002b8b25f4fc26bfef68767b3ff1eba1aac53fa5')
sha256sums=('871e86b7e989de0c1224ac7ab8ed6d8b52756cf793a8c253b56ab8ba8d288c96')
sha512sums=('be6d60661cee393d35a21323ecd5b204dfdd140aa3b2ec6f119a1effd1032701b81c0f20968e7c5c58e3f988cffe16084c52c55e0cde5757128a91b7a44b5bca')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake -GNinja -DPORT=WPE \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DPYTHON_EXECUTABLE=/usr/bin/python2 \
		"../${pkgname}-${pkgver}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install

	cd "${pkgname}-${pkgver}"
	local _f
	while IFS= read -d $'\0' -r _f ; do
		echo "### ${_f} ###" ; cat "${_f}" ; echo
	done < <(find Source -name COPYING -or -name 'LICENSE*' -print0 | sort -zu) |
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
