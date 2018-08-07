# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.20.2
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 wpebackend)
makedepends=(gperf ruby cmake python2)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=(07cb30291a8311f3cf126e3a2e3d0efb)
sha1sums=(69f1206255989e969fcdfb5c63401fb1f5a37864)
sha256sums=(0950befe6e970c9219ccbc29f5ff08bcc0923f0a9ca5a4c7531d74f9e26617f2)

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
