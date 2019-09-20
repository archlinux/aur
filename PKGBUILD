# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.26.0
pkgrel=0
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686 aarch64)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 openjpeg2 libseccomp bubblewrap xdg-dbus-proxy
		 geoclue at-spi2-atk 'libwpe>=1.4.0')
makedepends=(gperf ruby cmake python ninja gtk-doc)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=('59a2e64f145b3445187a22eff1f73293')
sha1sums=('757ab5da23ef7944332d4c57fcf56a932e933ce4')
sha256sums=('a97a24fe0c22243c873c359d7636512c01016ea2068a457ba651040f1a07ee3e')
sha512sums=('a783fedb878a66251d77c51f6f5c6e55ac8ee285ad395ce1f4935f397ddf776b50359757d2d418ae07f9aa11d2eccdb699920d7cc377dc04df389b18b22985a2')

prepare () {
	mkdir -p _build
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
