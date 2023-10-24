# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname='cronie-selinux'
pkgver=1.7.0
pkgrel=4
pkgdesc='Daemon that runs specified programs at scheduled times and related tools with SELinux support'
url='https://github.com/cronie-crond/cronie/'
license=('custom:BSD')
arch=('i686' 'x86_64' 'aarch64')
depends=('pam-selinux' 'bash' 'run-parts' 'libselinux')
optdepends=('smtp-server: send job output via email'
            'smtp-forwarder: forward job output to email server')
conflicts=('cron' "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=('cron' "${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
source=("https://github.com/cronie-crond/cronie/releases/download/${pkgname/-selinux}-${pkgver}/${pkgname/-selinux}-${pkgver}.tar.gz"
        '80-cronie.hook'
        'cron-deny'
        'crontab'
        'default-anacron')
sha256sums=('6827f5a47760cc64afeef0a60d3cb5376f52569109fc9a73957dd5e9fdae7619'
            'f85e9a68bf3bf446f8a6167f068371c06afffe11ca71935d8ee5487b38b2c9db'
            'ae6e533ecdfc1bd2dd80a9e25acb0260cbe9f00c4e4abee93d552b3660f263fc'
            '64d517a8d011b5cfa6b2433d528498e80fa8d0748c91f1b73e6ded70e776dc35'
            'c5772fd0df22d807ed6b62edf4052db529aafb626b1bfe8961229fb864039a5c')
backup=('etc/anacrontab'
        'etc/cron.d/0hourly'
        'etc/cron.deny'
        'etc/crontab'
        'etc/default/anacron'
        'etc/pam.d/crond'
        'etc/sysconfig/crond')

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

	install -Dm0644 ../80-cronie.hook "${pkgdir}"/usr/share/libalpm/hooks/80-cronie.hook
	install -Dm0644 ../cron-deny "${pkgdir}"/etc/cron.deny
	install -Dm0644 ../crontab "${pkgdir}"/etc/crontab
	install -Dm0644 ../default-anacron "${pkgdir}"/etc/default/anacron

	install -Dm0644 contrib/anacrontab "${pkgdir}"/etc/anacrontab
	install -Dm0644 contrib/0hourly "${pkgdir}"/etc/cron.d/0hourly
	install -Dm0755 contrib/0anacron "${pkgdir}"/etc/cron.hourly/0anacron

	install -Dm0644 contrib/cronie.systemd "${pkgdir}"/usr/lib/systemd/system/cronie.service
	install -Dm0644 crond.sysconfig "${pkgdir}"/etc/sysconfig/crond

	install -Dm0644 pam/crond "${pkgdir}"/etc/pam.d/crond

	install -Dm0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
