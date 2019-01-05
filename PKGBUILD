# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.22.3
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
makedepends=(gperf ruby cmake python2)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
sha512sums=('00bedcbcd5aee947e5a415d0acc45ca0e066fd5c0f58ddac5cdba114a7284159f27b67025139f4a5df147e6bedc7ad2ac42b60c63c4ff25de156b02cf8d863ea')

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
