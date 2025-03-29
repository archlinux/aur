# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: crab2313 <crab2313@gmail.com>

pkgname=rkdeveloptool-git
_pkgname=${pkgname%-git}
pkgver=1.32.r83.304f073
pkgrel=1
epoch=1
pkgdesc='The firmware upgrade tool for Rockchip SoC, consider to be a opensource version of upgrade_tool'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/rockchip-linux/rkdeveloptool'
license=('GPL-2.0-only')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
depends=('glibc' 'gcc-libs' 'libusb')
source=('git+https://github.com/rockchip-linux/rkdeveloptool.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	version=$(grep -oP 'AC_INIT\(\[Rockchip rkdeveloptool\], \K[\d.]+' configure.ac)
	printf "%s.r%s.%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	# sed -i 's/-Werror/-Werror -Wno-format-truncation/' Makefile.am
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR=$pkgdir install
	install -Dm644 99-rk-rockusb.rules -t "$pkgdir/usr/lib/udev/rules.d/"
}

# vim: set sw=2 ts=2 noet:
