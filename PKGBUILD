# Maintainer: Ben Widawsky <ben@bwidawsk.net>
# Contributor: Chris Forbes <chad.versace@intel.com>
# Contributor: Chad Versace <chrisf@ijw.co.nz>
# Contributor: Emil Velikov <emil.l.velikov@gmail.com>


pkgname=waffle-git
pkgver=20150217
pkgrel=2
pkgdesc="a library for choosing window system and OpenGL API at runtime (git version)"
arch=('i686' 'x86_64')
url="http://www.waffle-gl.org/"
license=('BSD')
depends=('libx11' 'libxcb' 'wayland')
makedepends=('git' 'cmake' 'xcb-proto' 'libegl' 'libgbm' 'libgl' 'libxslt' 'docbook-xsl')
provides=("${pkgname%-git}" "$pkgname")
conflicts=("${pkgname%-git}")
backup=()
options=()
install=
source=('waffle::git+https://github.com/waffle-gl/waffle.git#branch=master')
md5sums=('SKIP')

pkgver() {
	date +%Y%m%d
}

build() {
	cd "$srcdir/${pkgname%-git}"

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

check() {
	cd "$srcdir/${pkgname%-git}"

	make -k check
}

package() {
	optdepends=('libegl: for x11_egl, gbm or wayland support' 'libgbm: for gbm support')

	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir/" install
	install -m755 -d "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -m644 "$pkgdir/usr/share/doc/waffle1/LICENSE.txt" \
		      "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE.txt"
}
