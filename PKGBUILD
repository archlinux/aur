# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libjpeg-turbo
pkgver=3.0.4
pkgrel=1
arch=(any)
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (mingw-w64)"
license=("custom")
depends=(mingw-w64-crt)
makedepends=(yasm mingw-w64-cmake)
provides=(mingw-w64-libjpeg)
conflicts=(mingw-w64-libjpeg mingw-w64-libjpeg6-turbo)
options=(staticlibs !strip !buildflags)
url="https://libjpeg-turbo.org/"
source=("https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$pkgver/libjpeg-turbo-$pkgver.tar.gz")
validpgpkeys=('0338C8D8D9FDA62CF9C421BD7EC2DBB6F4DBF434') # The libjpeg-turbo Project (Signing key for official binaries) <information@libjpeg-turbo.org>
sha512sums=('04d37d65131f7ab8586507fe6520452e791e9b8d72a08cf52f81279450b4c6b8a5b49ff3e14e358d3c32cb5666b6d4576d1e16895af8213a1761464de5dc9d31')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir/libjpeg-turbo-$pkgver"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-cmake -DWITH_JPEG8=ON ..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/libjpeg-turbo-$pkgver/build-${_arch}"
		make DESTDIR="$pkgdir" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
		if [[ $NO_EXECUTABLES ]]; then
			find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
		else
			find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
		fi
	done
}
# vim: set sw=2 ts=2 et:
