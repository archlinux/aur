# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng-nosystemd
pkgver=3.3.9
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='http://sourceforge.net/projects/procps-ng/'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ncurses')
source=("http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz"
        'sysctl.conf')
sha1sums=('088c77631745fc75ee41fc29c254a4069be4869a'
          '674282245d8ab2e09017b8f8cdce20a3ff81e631')
groups=('base')
conflicts=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
replaces=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
provides=('procps' "procps-ng=$pkgver" 'sysvinit-tools')
install=procps-ng.install

prepare() {
	cd "${srcdir}/procps-ng-${pkgver}"

	sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
	cd "${srcdir}/procps-ng-${pkgver}"

	./configure \
		--prefix=/usr \
		--exec-prefix=/ \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--enable-watch8bit
	make
}

package() {
	cd "${srcdir}/procps-ng-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "sysctl.conf" "$pkgdir/etc/sysctl.conf"

	# provided by util-linux
	rm "${pkgdir}/usr/bin/kill"
	rm "${pkgdir}/usr/share/man/man1/kill.1"
}
