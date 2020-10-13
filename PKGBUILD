# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.30.1
pkgrel=2
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
        "${url}/releases/${pkgname}-${pkgver}.tar.xz.asc"
		"0001-Merge-r268350-REGRESSION-r256892-WPE-GTK-Build-broke.patch")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('251228a6e2917eff90a3eb6e9a7e920d'
         'SKIP'
         '9bf98437bdab11f0da5d292cbd21a68f')
sha1sums=('7f5bdc79d4694ab5644b7fed9bd7311c2cbc988f'
          'SKIP'
          '7bab09bc9a32e1a6fcd057fc83fef8a05e59f944')
sha256sums=('78c0135d935b980fc64fbddf1fbaf441920edda4eeb4c16857ee8dc985650c25'
            'SKIP'
            '6e333205cec87b6b306ebb2c9ee31f4168f7762081d48f8f745ea57900f5e70e')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/0001-Merge-r268350-REGRESSION-r256892-WPE-GTK-Build-broke.patch"
}

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
