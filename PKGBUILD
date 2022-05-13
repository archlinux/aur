# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='minisatip-git'
pkgdesc='SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards (experimental)'
pkgver=1.2.1.r0.g5a740db
pkgrel=2
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://minisatip.org'
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('git')
depends=('libdvbcsa')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=('git+https://github.com/catalinii/minisatip.git'
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            'f049eff56a7ddfb7f59728084a7b8119a405a74e554979f7f07b6e2e890dfb75'
            'f6b2b61c99c94e693cee6cdd77360ab5a6299dde76dbe4b5fa36ad0dc098b383'
            '92969280f6c5fc376b69d18d2f72784ee640e5ee1219230faf89dc7da00666fc')

pkgver() {
	cd ${srcdir}/minisatip
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/minisatip
	./configure
	sed -e 's/FLAGS?/FLAGS/g' -i */Makefile
	make EXTRA_CFLAGS="${CFLAGS}"
}

#check() {
#	cd ${srcdir}/minisatip
#	sed -e 's/test_ddci.c //' -e '/DDCI_TEST/d' -i tests/Makefile
#	make -C ${srcdir}/minisatip/tests EXTRA_CFLAGS="${CFLAGS}"
#}

package() {
	cd ${srcdir}/minisatip
	install -Dm644 ${srcdir}/minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
	install -Dm644 ${srcdir}/minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
	install -Dm644 ${srcdir}/minisatip.conf ${pkgdir}/etc/conf.d/minisatip
	install -Dm755 minisatip ${pkgdir}/usr/bin/minisatip
	mkdir -p ${pkgdir}/var/lib/minisatip
	cp -ar html ${pkgdir}/var/lib/minisatip
	chown -fR 188:188 ${pkgdir}/var/lib/minisatip
}
