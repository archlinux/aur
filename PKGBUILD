# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Nemo <archlinux@captnemo.in>

pkgname='shubhcron'
pkgver=1.0.0
pkgrel=1
pkgdesc='Cron runner for your auspicious jobs'
url='https://razorpay.com/shubhcron/'
license=('custom:BSD')
arch=('x86_64')
depends=('pam' 'bash' 'run-parts')
makedepends=('go' 'patch')
optdepends=('smtp-server: send job output via email'
			'smtp-forwarder: forward job output to email server')
source=('https://github.com/cronie-crond/cronie/releases/download/cronie-1.5.1/cronie-1.5.1.tar.gz'
		'service'
		'pam.d'
		'deny'
		'https://github.com/razorpay/shubhcron/archive/1.0.0.tar.gz')

sha256sums=('6c73666102a6b5d35e2eaf1bd06925f2d4b0cef8d3323c37286dda3089a85338'
			'62237132ccaf657f23b9c090b8cb10d7d003707a50d83b62f6cbc4c808766e44'
			'00864268b491bab8c66400a4a4b4bf85f168a6e44e85676105e084940924090c'
			'ae6e533ecdfc1bd2dd80a9e25acb0260cbe9f00c4e4abee93d552b3660f263fc'
			'2a48205a531e89f0bebf0a4551b306f4cd8281791809db444dcb2e9e43918664')

backup=('etc/cron.deny'
		'etc/pam.d/crond'
		'etc/cron.d/0hourly'
		'etc/anacrontab')

conflicts=('cron')
provides=('cron')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH=`pwd`
	go get github.com/kelvins/sunrisesunset
}

build() {
	cp "${srcdir}/shubhcron-1.0.0/cronie.patch" "cronie-1.5.1/"
	cd "${srcdir}/cronie-1.5.1"
	patch -p1 < cronie.patch
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-anacron \
		--with-inotify \
		--with-pam \

	make

	cd "${srcdir}/shubhcron-1.0.0"
	GOPATH=`pwd`
	go build shubh.go
}

package() {
	cd "${srcdir}/cronie-1.5.1"

	make DESTDIR="${pkgdir}" install

	chmod u+s "${pkgdir}"/usr/bin/crontab
	install -d "${pkgdir}"/var/spool/{ana,}cron
	install -d "${pkgdir}"/etc/cron.{d,hourly,daily,weekly,monthly}

	install -Dm644 ../deny "${pkgdir}"/etc/cron.deny
	install -Dm644 ../pam.d "${pkgdir}"/etc/pam.d/crond
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/shubhcron.service

	install -Dm644 contrib/anacrontab "${pkgdir}"/etc/anacrontab
	install -Dm644 contrib/0hourly "${pkgdir}"/etc/cron.d/0hourly
	install -Dm755 contrib/0anacron "${pkgdir}"/etc/cron.hourly/0anacron

	install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/shubhcron/COPYING

	mv "${pkgdir}/usr/bin/crond" "${pkgdir}/usr/bin/shubhcrond"

	cd "${srcdir}/shubhcron-1.0.0"

	install -Dm755 shubh "${pkgdir}/usr/bin/shubh"
}
