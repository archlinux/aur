# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-xorg-util-macros
pkgver=1.20.2
pkgrel=1
pkgdesc="X.Org Autotools macros (mingw-w64)"
arch=(any)
license=('MIT')
url="http://xorg.freedesktop.org/"
makedepends=('mingw-w64-configure')
source=(${url}/releases/individual/util/util-macros-${pkgver}.tar.gz{,.sig})
sha512sums=('464cd272bb4f6385e527f9d115d9ef768eb7c423b97611dd04342dfdb691d5c60d77f00d02e6094a326fedd2da263d6f01f95ec87a0794aa2bad2f64a7fa7ba7'
	'SKIP')
validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A'
	'4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd util-macros-${pkgver}
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure
		make
		popd
	done

}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/util-macros-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		install -m755 -d "${pkgdir}/usr/${_arch}/lib"
		mv "${pkgdir}/usr/${_arch}/share/pkgconfig" "${pkgdir}/usr/${_arch}/lib/"
	done
	install -D -m644 "$srcdir/util-macros-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim: set sw=2 ts=2 et:
