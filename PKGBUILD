# Maintainer: amF6enRpY2tldHNAZ21haWwuY29tCg==
# Contributor: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-mpg123
pkgver=1.32.10
pkgrel=1
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3 (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/mpg123"
license=('LGPL2.1')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${pkgver}.tar.bz2")
sha256sums=('87b2c17fe0c979d3ef38eeceff6362b35b28ac8589fbf1854b5be75c9ab6557c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "${srcdir}/mpg123-$pkgver/"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure --with-audio=dummy ..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/mpg123-$pkgver/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		rm -rf "$pkgdir"/usr/${_arch}/share/man
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		find "$pkgdir" -name '*.exe' -delete
		find "$pkgdir" -name 'libout123*' -delete
		find "$pkgdir" -name 'out123.h' -delete
	done
}

# vim: ts=4 sw=4 noet:
