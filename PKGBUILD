# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname='minisatip-git'
pkgdesc='SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2, ATSC and ISDB-T cards (experimental)'
pkgver=2.0.75.r0.g3dc3623
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://minisatip.org'
license=('GPL-2.0-or-later')
provides=('minisatip')
conflicts=('minisatip')
makedepends=('cmake' 'git')
depends=('libdvbcsa')
optdepends=('oscam: channels descrambling')
backup=('etc/conf.d/minisatip')
install='minisatip.install'
source=('git+https://github.com/catalinii/minisatip.git'
        'minisatip.sysuser')
sha256sums=('SKIP'
            '7f4e7fde7ded632f88b30b7cd0481c78309f8191b40369ae323cbb7240fdc199')

prepare() {
	cd ${srcdir}/minisatip
	sed -e 's,etc/minisatip.conf,etc/conf.d/minisatip,' -i debian/service
}

pkgver() {
	cd ${srcdir}/minisatip
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/minisatip
	cmake -B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd ${srcdir}/minisatip
	DESTDIR="${pkgdir}" cmake --install build
	install -D -m 644 debian/minisatip.conf ${pkgdir}/etc/conf.d/minisatip
	install -D -m 644 debian/service ${pkgdir}/usr/lib/systemd/system/minisatip.service
	install -D -m 644 ${srcdir}/minisatip.sysuser ${pkgdir}/usr/lib/sysusers.d/minisatip.conf
	install -D -m 644 -t ${pkgdir}/usr/share/minisatip/html html/*
}
