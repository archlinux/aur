# $Id:$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=logrotate-selinux
pkgver=3.9.1
pkgrel=1
pkgdesc="Rotates system logs automatically with SELinux support"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/logrotate/"
license=('GPL')
groups=('selinux')
depends=('popt' 'gzip' 'acl' 'libselinux')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/logrotate.conf')
source=("https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        logrotate.{timer,service})
md5sums=('4492b145b6d542e4a2f41e77fa199ab0'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '94dae4d3eded2fab9ae879533d3680db'
         '287c2ad9b074cb5478db7692f385827c'
         '85560be5272ed68a88bb77a0a2293369')

build() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	./autogen.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
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

	install -D -m644 ${srcdir}/logrotate.timer ${pkgdir}/usr/lib/systemd/system/logrotate.timer
	install -D -m644 ${srcdir}/logrotate.service ${pkgdir}/usr/lib/systemd/system/logrotate.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants
	ln -s ../logrotate.timer ${pkgdir}//usr/lib/systemd/system/multi-user.target.wants/logrotate.timer
}
