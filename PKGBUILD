# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='minisatip'
pkgdesc="SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards"
pkgver=0.5.69
pkgrel=2
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://minisatip.org"
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip-git')
makedepends=('git')
depends=('libdvbcsa' 'linuxtv-dvb-apps')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=("git+https://github.com/catalinii/minisatip#commit=bd493b1addd4a2d73ead880b5ea66a239e80224d"
        'https://github.com/pipelka/minisatip/commit/814e794896078117368825421705af1c46a2bb90.diff'
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            'd57af3559fe4ed74b21d5fe61cecd425aec1cc429aa127737113b6bffae9fecb'
            'ea3b7b52c33946c156f174c043015e6922af0c28ef43f9a4b4615e3abb36d4ad'
            '9f0ea2c29ab6c69bd444a6e4021928bbafc332c71735e1af975c3a973c3e5c2e'
            '24a03332e662c80c00d8f7ce40a60b35bcd7c8d08052c8e4deeb7e0f6720a2aa')

pkgver() {
	cd ${srcdir}/minisatip
	tac minisatip.h | awk -F"[^.^0-9]*" '/VERSION_BUILD/ {printf $2}'
}

prepare() {
	cd ${srcdir}/minisatip
	# add EAC3 support
	patch -p1 -i ${srcdir}/814e794896078117368825421705af1c46a2bb90.diff
}

build() {
	cd ${srcdir}/minisatip
	./configure
	sed -i 's/FLAGS?/FLAGS/g' Makefile
	make EXTRA_CFLAGS="${CFLAGS}" EXTRA_LDFLAGS="${LDFLAGS}"
}

package() {
	cd ${srcdir}/minisatip
	install -Dm644 ../minisatip.service ${pkgdir}/usr/lib/systemd/system/minisatip.service
	install -Dm644 ../minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
	install -Dm644 ../minisatip.conf ${pkgdir}/etc/conf.d/minisatip
	install -Dm755 minisatip ${pkgdir}/usr/bin/minisatip
	mkdir -p ${pkgdir}/var/lib/minisatip
	cp -ar html ${pkgdir}/var/lib/minisatip
	chown -fR 183:183 ${pkgdir}/var/lib/minisatip
}
