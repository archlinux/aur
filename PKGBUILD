# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.30.2
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686 aarch64 armv7l armv7h)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 libseccomp bubblewrap xdg-dbus-proxy
		 geoclue at-spi2-atk 'libwpe>=1.6.0')
makedepends=(gperf ruby cmake python ninja gtk-doc patch)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz"
        "${url}/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('5b0fed3333b53dbb36e572935fd54a7b'
         'SKIP')
sha1sums=('a143723fb77c2ea20bad888b95ccc37a7dd5b375'
          'SKIP')
sha256sums=('c94925ca2d655c7fc07dbc2d4b7a47a822c7699816a8cca35ed9efd676b5ba86'
            'SKIP')

build () {
	cmake -H"${pkgname}-${pkgver}" -Bbuild \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_SKIP_RPATH=ON \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DENABLE_GTKDOC=ON \
		-DPORT=WPE \
		-GNinja
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --build build --target install

	cd "${pkgname}-${pkgver}"
	local _f
	while IFS= read -d $'\0' -r _f ; do
		echo "### ${_f} ###" ; cat "${_f}" ; echo
	done < <(find Source -name COPYING -or -name 'LICENSE*' -print0 | sort -zu) |
	install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
