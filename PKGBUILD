# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Eric Bélanger <eric at archlinux dot org>
pkgname=hardinfo-git
pkgver=0.6.alpha.1361.g2e09eee
pkgrel=2
pkgdesc="A system information and benchmark tool."
arch=('x86_64')
url="https://github.com/lpereira/hardinfo"
license=('GPL2')
depends=('gtk3' 'libsoup')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('debug' '!strip')
source=('git+https://github.com/lpereira/hardinfo.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^release-//;s/^0.5-/0.6-alpha-/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -B build -S . \
		-DCMAKE_BUILD_TYPE='Debug' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DHARDINFO_GTK3='ON' \
		-DHARDINFO_DEBUG='$(usex debug 1 0)' \
		-Wno-dev
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make -C build DESTDIR="$pkgdir" install
}
