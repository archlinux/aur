# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Yevhenii Kolesnikov <sigexp.acc@gmail.com>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

_pkgbasename=waffle
pkgname=lib32-${_pkgbasename}
pkgver=1.6.1
pkgrel=2
pkgdesc='a library for choosing window system and OpenGL API at runtime (32 bits)'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' "${_pkgbasename}=${pkgver}")
makedepends=('meson' 'xcb-proto' 'lib32-mesa-libgl' 'lib32-mesa' 'gcc-multilib')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('31565649ff0e2d8dff1b8f7f2264ab7a78452063c7e04adfc4ce03e64b655080'
            'SKIP')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	arch-meson "${_pkgbasename}-$pkgver" build \
		--libdir=/usr/lib32 \
		-D gbm=enabled \
		-D glx=enabled \
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
