# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.28.4
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686 aarch64 armv7l armv7h)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 libseccomp bubblewrap xdg-dbus-proxy
		 geoclue at-spi2-atk 'libwpe>=1.4.0')
makedepends=(gperf ruby cmake python ninja gtk-doc)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz"
        "${url}/releases/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=(6ab041f6ebdb2e053981de5980c864e7 SKIP)
sha1sums=(b31739a86a269eac4ddd5e537cdf954224672450 SKIP)
sha256sums=(785d83b99cd45cedb7c4f1f697db773a5a81eb0a42aeeafa3c623053f6fde87a SKIP)

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
