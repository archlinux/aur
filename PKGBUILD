# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.30.3
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
md5sums=('75f6ef1819b182043a25b916272ebec6'
         'SKIP')
sha1sums=('2ed723f779513205449e0c5b7c080eb19d635aee'
          'SKIP')
sha256sums=('f2dfc1a6279810353f601bb9bd0d8ef671b41b38352d679b93d01631c2bf7b4b'
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
