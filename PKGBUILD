# Maintainer: maronvl <maron.vl@gmx.de>

pkgname=lcd4linux-git
_pkgname=lcd4linux
pkgver=r1167.cb69a93
pkgrel=6
pkgdesc="Grabs information from the kernel and other systems and displays it on an LCD"
arch=('i686' 'x86_64')
url="https://wiki.lcd4linux.tk/doku.php"
license=('GPL-2.0-only')
depends=(
		'ncurses' #libncursesw.so
		'glibc' #libm.so
		'dbus' #libdbus-1.so
		'libftdi-compat' #libftdi.so
		'libjpeg-turbo' #libjpeg.so
		'libusb' #libusb-1.0.so
		'libusb-compat' #libusb-0.1.so
		'libvncserver' #libvncserver.so
		'libx11' #libX11.so
		'mariadb-libs' #libmariadb.so
		'sqlite' #libsqlite3.so
		'gd' #libgd.so
)
makedepends=('git' 'pkg-config' 'automake' 'autoconf')
provides=('lcd4linux')
conflicts=('lcd4linux-svn' 'lcd4linux')
backup=('etc/lcd4linux.conf')
source=('lcd4linux::git+https://github.com/jmccrohan/lcd4linux'
		'lcd4linux.service')
md5sums=('SKIP'
		'809b7eefb65fd5545e9716dd1b7cf925')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	export ACLOCAL_PATH="/usr/share/aclocal:/usr/share/gettext/m4${ACLOCAL_PATH:+:}$ACLOCAL_PATH"
	export CFLAGS="-std=gnu90"
}

build() {
	cd "${_pkgname}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "${_pkgname}"
	make -k check
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}/" install
	install -Dm0644 "${srcdir}/lcd4linux.service" "${pkgdir}/usr/lib/systemd/system/lcd4linux.service"
	install -Dm0600 "lcd4linux.conf.sample" "${pkgdir}/etc/lcd4linux.conf"
}
