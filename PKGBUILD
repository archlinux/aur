# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wpewebkit
pkgver=2.22.5
pkgrel=1
pkgdesc='Web content engine library optimized for embedded devices'
arch=(x86_64 i686)
url='https://wpewebkit.org'
license=(custom)
groups=(wpe)
depends=(cairo libxslt gst-plugins-base-libs libepoxy libsoup libwebp
         harfbuzz-icu woff2 'libwpe>=1.0.0')
makedepends=(gperf ruby cmake python2 ninja)
source=("${url}/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=('7b768bfae1295ebbc9a9038bf8fb6e6c')
sha1sums=('c85f927e0f17f1e7045a5d33c683d310c7af24de')
sha256sums=('d5e7b23e4f9e9f1b9d369faa4d527cdb59aef56b3e6a50a16dad243df5f699f3')
sha512sums=('d84ca94e4108e8e0a4fef6a34611d639f6f2de593092b5bc3fe6003edd594a33a2f4048215171d58128e8260033df8cee0901ab33d2528149d4d249084806e79')

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
