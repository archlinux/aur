# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='minisatip'
pkgdesc='SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards'
pkgver=0.5.69
pkgrel=3
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://minisatip.org'
license=('GPL2')
conflicts=('minisatip-git')
makedepends=('git')
depends=('libdvbcsa' 'linuxtv-dvb-apps')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=('git+https://github.com/catalinii/minisatip.git#commit=bd493b1addd4a2d73ead880b5ea66a239e80224d'
        'https://github.com/pipelka/minisatip/commit/814e794896078117368825421705af1c46a2bb90.patch'
        'kernel-4.14-compat.patch'
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            'ac9a96ccf478e452a780b703ab8220b38dd44dc019266da3a3443f823634fe33'
            'b0596e4cbf432496e32c5fe15401eabd5758ab22081ef9cbbaead5d1cdf19167'
            'f049eff56a7ddfb7f59728084a7b8119a405a74e554979f7f07b6e2e890dfb75'
            'f6b2b61c99c94e693cee6cdd77360ab5a6299dde76dbe4b5fa36ad0dc098b383'
            '92969280f6c5fc376b69d18d2f72784ee640e5ee1219230faf89dc7da00666fc')

prepare() {
	cd ${srcdir}/minisatip
	# fix compilation after DMX_SET_SOURCE removal
	patch -p1 -i ${srcdir}/kernel-4.14-compat.patch
	# add EAC3 support
	patch -p1 -i ${srcdir}/814e794896078117368825421705af1c46a2bb90.patch
}

pkgver() {
	cd ${srcdir}/minisatip
	tac minisatip.h | awk -F"[^.^0-9]*" '/VERSION_BUILD/ {printf $2}'
}

build() {
	cd ${srcdir}/minisatip
	./configure
	sed -i 's/FLAGS?/FLAGS/g' Makefile
	make EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}"
}

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
