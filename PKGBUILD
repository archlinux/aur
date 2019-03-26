# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname='cronie-selinux'
pkgver=1.5.4
pkgrel=1
pkgdesc='Daemon that runs specified programs at scheduled times and related tools with SELinux support'
url='https://github.com/cronie-crond/cronie/'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('pam-selinux' 'bash' 'run-parts' 'libselinux')
optdepends=('smtp-server: send job output via email'
            'smtp-forwarder: forward job output to email server')
source=("https://github.com/cronie-crond/cronie/releases/download/${pkgname/-selinux}-${pkgver}-final/${pkgname/-selinux}-${pkgver}.tar.gz"
        'service'
        'pam.d'
        'deny')
sha256sums=('af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882'
            'ac3ff3c8a5ce1b6367b06877b4b12ff74e7f18a3c510fb9f80d6ea6b6321e3b1'
            '00864268b491bab8c66400a4a4b4bf85f168a6e44e85676105e084940924090c'
            'ae6e533ecdfc1bd2dd80a9e25acb0260cbe9f00c4e4abee93d552b3660f263fc')

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

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
