# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=logrotate-selinux
pkgver=3.13.0
pkgrel=1
pkgdesc="Rotates system logs automatically with SELinux support"
arch=('x86_64')
url="https://github.com/logrotate/logrotate"
license=('GPL')
groups=('selinux')
depends=('popt' 'gzip' 'acl' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/logrotate.conf')
source=("https://github.com/logrotate/logrotate/releases/download/${pkgver}/${pkgname/-selinux}-${pkgver}.tar.xz"{,.asc}
        'logrotate.conf')
md5sums=('78ef24d6fddcc4df8e412dd75c551b4c'
         'SKIP'
         '94dae4d3eded2fab9ae879533d3680db')
validpgpkeys=('992A96E075056E79CD8214F9873DB37572A37B36')

build() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--with-compress-command=/usr/bin/gzip \
		--with-uncompress-command=/usr/bin/gunzip \
		--with-default-mail-command=/usr/bin/mail \
		--with-acl \
		--with-selinux
	make
}

check() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"
	make test
}

package() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"

	make DESTDIR="$pkgdir" install

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"

	install -D -m644 examples/logrotate.timer ${pkgdir}/usr/lib/systemd/system/logrotate.timer
	install -D -m644 examples/logrotate.service ${pkgdir}/usr/lib/systemd/system/logrotate.service
	install -d -m755 $pkgdir/usr/lib/systemd/system/timers.target.wants
	ln -s ../logrotate.timer $pkgdir/usr/lib/systemd/system/timers.target.wants/logrotate.timer
}
