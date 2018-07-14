# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.20.1
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686)
url='https://wpewebkit.org'
license=(custom)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 wpebackend)
makedepends=(gperf ruby cmake python2)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=(5e86ebd54bf49ff611f5623963362722)
sha1sums=(c23c6b416639b8b41819bf73580a3d37ca6500ac)
sha256sums=(42dfcc1090cf37a817e23beb7402a753a69c891d7581ac69d733e39312d1e68a)

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
