# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Maintainer: Yevhenii Kolesnikov <sigexp.acc@gmail.com>
# Contributor: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>

_pkgbasename=waffle
pkgname=lib32-${_pkgbasename}
pkgver=1.7.0
pkgrel=3
pkgdesc='a library for choosing window system and OpenGL API at runtime (32 bits)'
arch=('x86_64')
url='https://waffle.freedesktop.org'
license=('BSD')

depends=('lib32-libx11' 'lib32-libxcb' 'lib32-systemd' "${_pkgbasename}=${pkgver}")
optdepends=('lib32-libgl: for OpenGL or GLX support'
            'lib32-libgles: for GLES support'
            'lib32-libegl: for gbm, surfaceless, x11_egl or wayland support'
            'lib32-mesa: for gbm support'
            'lib32-wayland: for wayland support')
makedepends=('meson' 'xcb-proto' 'lib32-mesa' 'gcc-multilib' 'cmake' 'wayland-protocols')

source=(https://mesa.pages.freedesktop.org/waffle/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('69e42d15d08f63e7a54a8b8770295a6eb04dfd1c6f86c328b6039dbe7de28ef3'
            '7a7e064395551ce20a694be7ecb4795effc3fd6f614943e50445469631677f6e')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	arch-meson "${_pkgbasename}-$pkgver" build \
		--buildtype release \
		--libdir=/usr/lib32 \
		-D build-manpages=false \
		-D build-htmldocs=false \
		-D build-examples=false

	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	mv "$pkgdir/usr/bin/wflinfo" "$pkgdir/usr/bin/wflinfo32"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/share"

	install -m755 -d "$pkgdir/usr/share/licenses"
	ln -s "${_pkgbasename}" "$pkgdir/usr/share/licenses/$pkgname"
}
