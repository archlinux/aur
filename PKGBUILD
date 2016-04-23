# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
#
# logrotate with cron daily job restored from logrotate-3.8.7-1

pkgname=logrotate-nosystemd
_pkgname=logrotate
pkgver=3.9.2
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
source=("https://github.com/logrotate/logrotate/archive/${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        'logrotate.cron.daily')
md5sums=('584bca013dcceeb23b06b27d6d0342fb'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '94dae4d3eded2fab9ae879533d3680db'
         'dd5fd26724274fd9c827eadad60ff4c5')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"

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
	cd "$srcdir/${_pkgname}-${pkgver}"

	make test
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"

	make DESTDIR="$pkgdir" install

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"
	install -Dm744 "$srcdir/logrotate.cron.daily" "$pkgdir/etc/cron.daily/logrotate"
}
