# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.24.1
pkgrel=0
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686 aarch64)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 'libwpe>=1.2.0')
makedepends=(gperf ruby cmake python ninja)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=('0f7b792874853416d8005b020bd90685')
sha1sums=('d009c82afbc2c373a7f34ffda392e5c3b52dac7d')
sha256sums=('95f2fb68429fbd901ea415d09fdd88d6d9ac5ec2d170bec9977093b12e5093a6')
sha512sums=('fc89ff2100bd66a859afaaafcfcbed33c70f608174b7157d07b0ebe6c0dc0d000571b7faaa00d0617ce05c9bcd23499ab3bfc691ef6696b76c0218700211aaea')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake -GNinja -DPORT=WPE \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
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
