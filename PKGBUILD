# Maintainer: taotieren <admin@taotieren.com>

pkgname=cangaroo
pkgver=0.2.2.r64.gca7f907
pkgrel=10
pkgdesc="Open source can bus analyzer software - with support for CANable / CANable2, CANFD, and other new features"
arch=($CARCH)
license=('GPL-2.0-only')
depends=(
	bash
	gcc-libs
	glibc
	libnl
	qt5-charts
	qt5-base
	qt5-serialport
)
makedepends=(git
	qt5-tools)
url="https://github.com/normaldotcom/cangaroo"

source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	(
		set -o pipefail
		git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
	cd "$srcdir/$pkgname"
	qmake-qt5
	make
	cd canifconfig
	qmake-qt5
	make
}

package() {
	cd "$srcdir/$pkgname"
	# 	make install DESTDIR=${pkgdir} prefix=/usr
	install -Dm755 "$srcdir/$pkgname/bin/cangaroo" -t "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/src/scripts/setup_vcan.sh" "$pkgdir/usr/bin/cangaroo-setup-vcan"
	install -Dm755 "$srcdir/$pkgname/canifconfig/canifconfig" -t "$pkgdir/usr/bin"
	install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname/src/assets/cangaroo.png" -t "$pkgdir/usr/share/pixmaps"
}
