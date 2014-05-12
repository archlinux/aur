# $Id:$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# SELinux Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgname=logrotate-selinux
pkgver=3.8.7
pkgrel=1
pkgdesc="Rotates system logs automatically with SELinux support"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/logrotate/"
license=('GPL')
groups=('selinux')
depends=('popt' 'gzip' 'acl' 'libselinux')
optdepends=('cron: scheduled log rotation')
conflicts=("${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=("${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
backup=('etc/logrotate.conf')
source=("https://fedorahosted.org/releases/l/o/logrotate/logrotate-${pkgver}.tar.gz"
        'paths.patch'
        'logrotate.conf'
        logrotate.{timer,service})
md5sums=('99e08503ef24c3e2e3ff74cc5f3be213'
         'e76526bcd6fc33c9d921e1cb1eff1ffb'
         '94dae4d3eded2fab9ae879533d3680db'
         '287c2ad9b074cb5478db7692f385827c'
         '85560be5272ed68a88bb77a0a2293369')

build() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"

	patch -p0 -i "$srcdir/paths.patch"

	make WITH_ACL=yes WITH_SELINUX=yes RPM_OPT_FLAGS="$CFLAGS" EXTRA_LDFLAGS="$LDFLAGS"
}

check() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"
	make test
}

package() {
	cd "$srcdir/${pkgname/-selinux}-${pkgver}"
	make PREFIX="$pkgdir" MANDIR="/usr/share/man" install
	mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin

	install -dm755 "$pkgdir/etc/logrotate.d"
	install -Dm644 "$srcdir/logrotate.conf" "$pkgdir/etc/logrotate.conf"

	install -D -m644 ${srcdir}/logrotate.timer ${pkgdir}/usr/lib/systemd/system/logrotate.timer
	install -D -m644 ${srcdir}/logrotate.service ${pkgdir}/usr/lib/systemd/system/logrotate.service
	install -d -m755 ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants
	ln -s ../logrotate.timer ${pkgdir}//usr/lib/systemd/system/multi-user.target.wants/logrotate.timer
}
