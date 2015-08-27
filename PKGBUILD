# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chad Versace <chad.versace@linux.intel.com>
# Contributor: Emil Velikov <emil.l.velikov@gmail.com>

pkgname='waffle'
pkgver='1.5.2'
pkgrel='1'
pkgdesc='a library for choosing window system and OpenGL API at runtime'
arch=('i686' 'x86_64')
url='http://www.waffle-gl.org'
license=('BSD')

depends=('libx11' 'libxcb' 'wayland')
makedepends=('cmake' 'xcb-proto' 'libegl' 'libgbm' 'libgl' 'libxslt' 'docbook-xsl')

source=("https://github.com/waffle-gl/waffle/archive/v$pkgver.tar.gz")
sha256sums=('d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=Release \
		-Dwaffle_has_gbm=1 \
		-Dwaffle_has_glx=1 \
		-Dwaffle_has_x11_egl=1 \
		-Dwaffle_has_wayland=1 \
		-Dwaffle_build_manpages=1 \
		-Dwaffle_build_htmldocs=1 \
		-Dwaffle_build_examples=0
	make
}

package() {
	optdepends=('libegl: for x11_egl, gbm or wayland support' 'libgbm: for gbm support')

	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
