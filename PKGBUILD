# Maintainer: UnicornDarkness
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_realname=procps
pkgname=procps-ng-git
pkgver=4.0.1.r3.g474e22eb
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL2' 'LGPL2')
arch=('i686' 'x86_64')
depends=('glibc' 'ncurses' 'libncursesw.so' 'systemd-libs')
makedepends=('git' 'm4' 'autoconf' 'libtool' 'systemd')
conflicts=('procps' 'procps-ng' 'sysvinit-tools')
provides=('procps' 'procps-ng' 'sysvinit-tools' 'libproc-2.so')
replaces=('procps' 'procps-ng' 'sysvinit-tools')
options=('!emptydirs')
source=("git+https://gitlab.com/procps-ng/procps.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_realname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_realname"
	sed 's:<ncursesw/:<:g' -i src/watch.c
}

build() {
	cd "$_realname"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--exec-prefix=/ \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--enable-watch8bit \
		--with-systemd \
		--disable-modern-top \
		--disable-kill

	make
}

package() {
	cd "$_realname"
	make DESTDIR="$pkgdir" install
}
