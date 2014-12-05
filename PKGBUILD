# $Id$
# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>

pkgname=cronie-selinux
pkgver=1.4.12
pkgrel=1
pkgdesc='Daemon that runs specified programs at scheduled times and related tools with SELinux support'
url='https://fedorahosted.org/cronie/'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('pam-selinux' 'bash' 'run-parts' 'libselinux')
optdepends=('pm-utils: defer anacron on battery power'
            'smtp-server: send job output via email'
            'smtp-forwarder: forward job output to email server')
source=("https://fedorahosted.org/releases/c/r/${pkgname/-selinux}/${pkgname/-selinux}-${pkgver}.tar.gz"
        'service'
        'pam.d'
        'deny')
sha1sums=('3bffa899d2c14ac0848cac40e9ecbcb7912e784a'
          'eb8ed1e22dbe9c02075fe4bbe925b6eeb9954649'
          '5eff7fb31f6bc0a924243ff046704726cf20c221'
          '0f279b8fb820340267d578dc85511c980715f91e')

backup=('etc/cron.deny'
        'etc/pam.d/crond'
        'etc/cron.d/0hourly'
        'etc/anacrontab')

conflicts=('cron' "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=('cron' "${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')

build() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-anacron \
		--with-inotify \
		--with-pam \
		--with-selinux

	make
}

package() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	chmod u+s "${pkgdir}"/usr/bin/crontab
	install -d "${pkgdir}"/var/spool/{ana,}cron
	install -d "${pkgdir}"/etc/cron.{d,hourly,daily,weekly,monthly}

	install -Dm644 ../deny "${pkgdir}"/etc/cron.deny
	install -Dm644 ../pam.d "${pkgdir}"/etc/pam.d/crond
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/cronie.service

	install -Dm644 contrib/anacrontab "${pkgdir}"/etc/anacrontab
	install -Dm644 contrib/0hourly "${pkgdir}"/etc/cron.d/0hourly
	install -Dm755 contrib/0anacron "${pkgdir}"/etc/cron.hourly/0anacron

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/cronie/COPYING
}
