# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>
# Contributor: Emil Velikov <emil.l.velikov@gmail.com

_pkgbasename='waffle'
pkgname="lib32-${_pkgbasename}"
pkgver='1.5.1'
pkgrel='3'
pkgdesc='a library for choosing window system and OpenGL API at runtime (32 bits)'
arch=('x86_64')
url='http://www.waffle-gl.org'
license=('BSD')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-wayland' "${_pkgbasename}=${pkgver}")
makedepends=('gcc-multilib' 'cmake' 'xcb-proto' 'lib32-libegl' 'lib32-libgbm' 'lib32-libgl')

source=("https://github.com/waffle-gl/waffle/archive/v$pkgver.tar.gz")
sha256sums=('1cc8e63b47bc2273eeab3d82bc804953adae70beceb59839612ecedc4ea3cd59')

build() {
	cd "$srcdir/${_pkgbasename}-$pkgver"

	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	cmake  \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
		-DCMAKE_BUILD_TYPE=Release \
		-Dwaffle_has_gbm=1 \
		-Dwaffle_has_glx=1 \
		-Dwaffle_has_x11_egl=1 \
		-Dwaffle_has_wayland=1 \
		-Dwaffle_build_manpages=0 \
		-Dwaffle_build_htmldocs=0 \
		-Dwaffle_build_examples=0
	make
}

package() {
	optdepends=('lib32-libegl: for x11_egl, gbm or wayland support' 'lib32-libgbm: for gbm support')

	cd "$srcdir/${_pkgbasename}-$pkgver"
	make DESTDIR="$pkgdir/" install

	mv "$pkgdir/usr/bin/wflinfo" "$pkgdir/usr/bin/wflinfo32"
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/share"

	install -m755 -d "$pkgdir/usr/share/licenses"
	ln -s "${_pkgbasename}" "$pkgdir/usr/share/licenses/$pkgname"
}
