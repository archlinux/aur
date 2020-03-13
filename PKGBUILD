# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.28.0
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
md5sums=(4298b9d38b4f05f92995422ea9979893 SKIP)
sha1sums=(9e791b6112cca8cda51ae7e991b545f4bf0bb46c SKIP)
sha256sums=(a85cd3cb46206a4929a9562d53379a7e7e2ec1a3224b34e2dcf5da30bb906722 SKIP)

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
