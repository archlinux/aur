# Maintainer: maronvl <maron.vl@gmx.de>

pkgname=lcd4linux-git
_pkgname=lcd4linux
pkgver=r1167.cb69a93
pkgrel=3
pkgdesc="Grabs information from the kernel and other systems and displays it on an LCD"
arch=('i686' 'x86_64')
url="https://wiki.lcd4linux.tk/doku.php"
license=('GPLv2')
makedepends=('git' 'pkg-config' 'automake' 'autoconf')
provides=('lcd4linux')
conflicts=('lcd4linux-svn')
source=('lcd4linux::git+https://github.com/jmccrohan/lcd4linux')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname"
	make -k check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
    install -Dm0644 "$srcdir/../lcd4linux.service" "$pkgdir/usr/lib/systemd/system/lcd4linux.service"
	install -Dm0600 "$srcdir/lcd4linux/lcd4linux.conf.sample" "$pkgdir/etc/lcd4linux.conf"
}
