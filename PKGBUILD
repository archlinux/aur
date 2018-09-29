# Maintainer: Duncan X Simpson <virtualdxs@gmail.com>
pkgname=monit-git
pkgver=release.5.25.2.r9.c16158d
pkgrel=1
pkgdesc="Utility for managing and monitoring Unix systems"
arch=('x86_64')
url="http://mmonit.com/monit/"
license=('AGPL')
groups=()
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('monit::git+https://bitbucket.org/tildeslash/monit')
noextract=()
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -pv "$pkgdir/usr/lib/systemd/system/" "$pkgdir/etc/"
	cp "$srcdir/${pkgname%-git}/monitrc" "$pkgdir/etc/"
	cp "$srcdir/${pkgname%-git}/system/startup/monit.service" "$pkgdir/usr/lib/systemd/system/"
	make DESTDIR="$pkgdir/" install
}
