# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng-nosystemd
pkgver=3.3.16
pkgrel=2
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ncurses')
backup=('etc/sysctl.conf')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz"
        'fs66093.patch'
        'sysctl.conf')
sha256sums=('925eacd65dedcf9c98eb94e8978bbfb63f5de37294cc1047d81462ed477a20af'
            '48eb1f6e1b84d9dfec27556771c05f6a02880aefbe774a3db71bee0c35228992'
            'bbb659d6e670921312ca205f16e92f47a80d7530160b3277bfc00e5ea0ac3836')
groups=('base')
conflicts=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
replaces=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
provides=('procps' "procps-ng=$pkgver" 'sysvinit-tools')
install=procps-ng.install

prepare() {
	cd "${srcdir}/procps-ng-${pkgver}"

	sed 's:<ncursesw/:<:g' -i watch.c

	# pgrep: check sanity of SC_ARG_MAX
	# https://bugs.archlinux.org/task/66093
	patch -p1 -i ../fs66093.patch
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
		--disable-modern-top \
		--disable-kill
	# kill is provided by util-linux

	make
}

package() {
	cd "${srcdir}/procps-ng-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "sysctl.conf" "$pkgdir/etc/sysctl.conf"
}
