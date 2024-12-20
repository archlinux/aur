# Maintainer:  CloverGit <clovergit@hotmail.com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libjpeg-turbo
pkgver=3.1.0
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
sha512sums=('63231854529f59a95814cf2414fe384360a4ed96c572764fabc535c3770c559d26943e129c905a63d5949088fa79138b1ffdb175b817f2f4d36329a3cbb23ea7')

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
