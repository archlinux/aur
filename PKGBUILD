# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.24.2
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
md5sums=('3604a2167827c8354f6dcbab98305d7b')
sha1sums=('1248d7723d0e6aec52cafc27a92c5c335c1abdd4')
sha256sums=('cf251a467b3bcae50f97e22f4baccca49fcbbd54162dc5b71c0b1ebf655fd95f')
sha512sums=('ee3f6767d9d153043635426f0998f9e5264fb8dfbe2ac2fbebcf0461d993c11b82d63d192f6053f9b1947e3488ead9c9526fa7c07d2e9dfc798bd49000956798')

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
