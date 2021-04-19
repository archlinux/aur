# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# SELinux Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# SELinux Contributor: Timothée Ravier <tim@siosm.fr>
# SELinux Contributor: Nicky726 <Nicky726@gmail.com>
#
# This PKGBUILD is maintained on https://github.com/archlinuxhardened/selinux.
# If you want to help keep it up to date, please open a Pull Request there.

pkgname='cronie-selinux'
pkgver=1.5.7
pkgrel=2
pkgdesc='Daemon that runs specified programs at scheduled times and related tools with SELinux support'
url='https://github.com/cronie-crond/cronie/'
license=('custom:BSD')
arch=('i686' 'x86_64')
depends=('pam-selinux' 'bash' 'run-parts' 'libselinux')
optdepends=('smtp-server: send job output via email'
            'smtp-forwarder: forward job output to email server')
conflicts=('cron' "${pkgname/-selinux}" "selinux-${pkgname/-selinux}")
provides=('cron' "${pkgname/-selinux}=${pkgver}-${pkgrel}"
          "selinux-${pkgname/-selinux}=${pkgver}-${pkgrel}")
groups=('selinux')
source=("https://github.com/cronie-crond/cronie/releases/download/${pkgname/-selinux}-${pkgver}/${pkgname/-selinux}-${pkgver}.tar.gz"
        '0001-crontab-use-bold-colors.patch'
        '80-cronie.hook'
        'service'
        'pam.d'
        'deny')
sha256sums=('538bcfaf2e986e5ae1edf6d1472a77ea8271d6a9005aee2497a9ed6e13320eb3'
            '2c9a2f386f23779907c468023538b195cd3e3c61fa16e19f036ee13a031f1c3a'
            'f85e9a68bf3bf446f8a6167f068371c06afffe11ca71935d8ee5487b38b2c9db'
            'ac3ff3c8a5ce1b6367b06877b4b12ff74e7f18a3c510fb9f80d6ea6b6321e3b1'
            '00864268b491bab8c66400a4a4b4bf85f168a6e44e85676105e084940924090c'
            'ae6e533ecdfc1bd2dd80a9e25acb0260cbe9f00c4e4abee93d552b3660f263fc')
backup=('etc/cron.deny'
        'etc/pam.d/crond'
        'etc/cron.d/0hourly'
        'etc/anacrontab')

build() {
	cd "${srcdir}/${pkgname/-selinux}-${pkgver}"

	patch -Np1 < ../0001-crontab-use-bold-colors.patch

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

	install -Dm0644 ../deny "${pkgdir}"/etc/cron.deny
	install -Dm0644 ../pam.d "${pkgdir}"/etc/pam.d/crond
	install -Dm0644 ../service "${pkgdir}"/usr/lib/systemd/system/cronie.service
	install -Dm0644 ../80-cronie.hook "${pkgdir}"/usr/share/libalpm/hooks/80-cronie.hook

	install -Dm0644 contrib/anacrontab "${pkgdir}"/etc/anacrontab
	install -Dm0644 contrib/0hourly "${pkgdir}"/etc/cron.d/0hourly
	install -Dm0755 contrib/0anacron "${pkgdir}"/etc/cron.hourly/0anacron

	install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
