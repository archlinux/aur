# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
pkgname='minisatip-git'
pkgdesc="SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards (experimental)"
pkgver=0.5.10.6da4529
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/catalinii/minisatip"
license=('GPL2')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('git')
depends=('libdvbcsa' 'linuxtv-dvb-apps')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=("git+https://github.com/catalinii/minisatip"
        'minisatip.service'
        'minisatip.sysuser'
        'minisatip.conf')
sha256sums=('SKIP'
            '44262f1b581d8a9966cfb62c3b84ad604467e6417ff42b3ab06962297ffb5b33'
            '9f0ea2c29ab6c69bd444a6e4021928bbafc332c71735e1af975c3a973c3e5c2e'
            '24a03332e662c80c00d8f7ce40a60b35bcd7c8d08052c8e4deeb7e0f6720a2aa')

pkgver() {
	cd ${srcdir}/minisatip
	printf "%s.%s" "$(tac minisatip.h | awk -F"[^.^0-9]*" '/VERSION_BUILD/ {printf $2}')" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/minisatip
	export CFLAGS="${CFLAGS} -ggdb -fPIC"
	export LDFLAGS="${LDFLAGS} -lpthread -lrt"
	make DVBCA=yes
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
