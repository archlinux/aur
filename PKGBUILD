# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng-nosystemd
pkgver=3.3.12
pkgrel=2
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ncurses')
backup=('etc/sysctl.conf')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz"
        'sysctl.conf'
        'impossibly-high-memory.patch')
sha256sums=('6ed65ab86318f37904e8f9014415a098bec5bc53653e5d9ab404f95ca5e1a7d4'
            'bbb659d6e670921312ca205f16e92f47a80d7530160b3277bfc00e5ea0ac3836'
            '1095223d697cf86b7086839666222b853bfa80bb83c7b09eaeceb0c506bea980')
groups=('base')
conflicts=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
replaces=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
provides=('procps' "procps-ng=$pkgver" 'sysvinit-tools')
install=procps-ng.install

prepare() {
	cd "${srcdir}/procps-ng-${pkgver}"

	patch -p1 -i ../impossibly-high-memory.patch
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
		--enable-watch8bit \
		--disable-kill
	# kill is provided by util-linux

	make
}

package() {
	cd "${srcdir}/procps-ng-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "sysctl.conf" "$pkgdir/etc/sysctl.conf"
}
