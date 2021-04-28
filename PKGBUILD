# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Eric Bélanger <eric at archlinux dot org>
pkgname=hardinfo-git
pkgver=0.6.alpha.1359.g2ad914d
pkgrel=1
pkgdesc="A system information and benchmark tool."
arch=('x86_64')
url="https://github.com/lpereira/hardinfo"
license=('GPL2')
depends=('gtk3' 'libsoup')
makedepends=('cmake' 'git')
optdepends=('lm_sensors: for sensor readings')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lpereira/hardinfo.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^release-//;s/^0.5-/0.6-alpha-/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
	cmake -B build -S . \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DHARDINFO_GTK3='ON' \
		-Wno-dev
	make -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make -C build DESTDIR="$pkgdir" install
}
