# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Yevhenii Kolesnikov <sigexp.acc@gmail.com>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

_pkgbasename=waffle
pkgname=lib32-${_pkgbasename}
pkgver=1.6.2
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime (32 bits)'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' "${_pkgbasename}=${pkgver}")
makedepends=('meson' 'xcb-proto' 'lib32-mesa-libgl' 'lib32-mesa' 'gcc-multilib')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('41ff9e042497e482c7294e210ebd9962e937631829a548e5811c637337cec5a5'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	arch-meson "${_pkgbasename}-$pkgver" build \
		--libdir=/usr/lib32 \
		-D gbm=enabled \
		-D glx=enabled \
		-D surfaceless_egl=enabled \
		-D x11_egl=enabled \
		-D wayland=enabled \
		-D build-manpages=false \
		-D build-htmldocs=false \
		-D build-examples=false

	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	mv "$pkgdir/usr/bin/wflinfo" "$pkgdir/usr/bin/wflinfo32"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/share"

	install -m755 -d "$pkgdir/usr/share/licenses"
	ln -s "${_pkgbasename}" "$pkgdir/usr/share/licenses/$pkgname"
}
