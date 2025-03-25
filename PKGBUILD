# Maintainer: a821 at (nospam) mail de
# Contributor: UnicornDarkness
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_realname=procps
pkgname=procps-ng-git
pkgver=4.0.5.r18.g3d2158fc
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
arch=('x86_64')
depends=('glibc' 'ncurses' 'libncursesw.so' 'systemd-libs')
makedepends=('gettext' 'git' 'po4a' 'systemd')
conflicts=('procps' 'procps-ng' 'sysvinit-tools')
provides=('procps' 'procps-ng' 'sysvinit-tools' 'libproc-2.so')
options=('!emptydirs')
source=("git+https://gitlab.com/procps-ng/procps.git")
sha512sums=('SKIP')

pkgver() {
	cd "$_realname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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

	# https://gitlab.com/procps-ng/procps/-/issues/379
	rm -fv "$pkgdir"/usr/share/man/{de,ro,uk}/man1/kill.1
}
