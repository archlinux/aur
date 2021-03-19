# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng-nosystemd
pkgver=3.3.17
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('glibc' 'ncurses' 'libncursesw.so')
backup=('etc/sysctl.conf')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz"
        'sysctl.conf')
sha256sums=('4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4'
            'bbb659d6e670921312ca205f16e92f47a80d7530160b3277bfc00e5ea0ac3836')
groups=('base')
conflicts=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
replaces=('procps' 'procps-ng' 'sysvinit-tools' 'sysctl-default-conf')
provides=('procps' "procps-ng=$pkgver" 'sysvinit-tools' 'libprocps.so')
install=procps-ng.install

prepare() {
	cd "${srcdir}/procps-${pkgver}"

	sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
	cd "${srcdir}/procps-${pkgver}"

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
	cd "${srcdir}/procps-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "sysctl.conf" "$pkgdir/etc/sysctl.conf"
}
