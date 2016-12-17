# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
#
# logrotate with cron daily job restored from logrotate-3.8.7-1

pkgname=logrotate-nosystemd
_pkgname=logrotate
pkgver=3.11.0
pkgrel=1
pkgdesc="Rotates system logs automatically"
arch=('i686' 'x86_64')
url="https://github.com/logrotate/logrotate"
license=('GPL')
groups=('base')
depends=('popt' 'gzip' 'acl')
optdepends=('cron: scheduled log rotation')
provides=('logrotate')
conflicts=('logrotate')
replaces=('logrotate')
backup=('etc/logrotate.conf')
source=("https://github.com/logrotate/logrotate/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        'paths.patch'
        'logrotate.conf'
        'logrotate.cron.daily')
md5sums=('3a9280e4caeb837427a2d54518fbcdac'
         'SKIP'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '94dae4d3eded2fab9ae879533d3680db'
         'dd5fd26724274fd9c827eadad60ff4c5')
validpgpkeys=('992A96E075056E79CD8214F9873DB37572A37B36')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--with-acl
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	install -dm755 "${pkgdir}/etc/logrotate.d"
	install -Dm644 "${srcdir}/logrotate.conf" "${pkgdir}/etc/logrotate.conf"
	install -Dm744 "${srcdir}/logrotate.cron.daily" "${pkgdir}/etc/cron.daily/logrotate"
}
