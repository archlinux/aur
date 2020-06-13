# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula-client
pkgver=9.6.5
pkgrel=1
pkgdesc="Enterprise ready, network based backup program"
url="https://www.bacula.org"
arch=('any')
license=('AGPL3')
depends=('openssl')

conflicts=('bacula')
provides=("bacula-fd=${pkgver}")
backup=('etc/bacula/bconsole.conf'
	'etc/bacula/bacula-fd.conf')
validpgpkeys=('86260C02E82A8FC5CA5FB0638363575EFBD8D142') # Bacula 4096 Distribution Verification Key (www.bacula.org) <kern@bacula.org>
source=("https://downloads.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz"{,.sig}
	'bacula-fd.service')
sha256sums=('510f35b86138472abe6c559caded7bc773bf5eb1b9ee10905ee8f4f827c7c77a'
            'SKIP'
            '37cdab95a99142a7e8494f0a49e54a5bfb1dca28561d0ce70ea64bf98e0c50fd')

build() {
	cd bacula-${pkgver}/

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-client-only \
		--with-systemd=/usr/lib/systemd/system/ \
		--sysconfdir=/etc/bacula \
		--with-scriptdir=/etc/bacula/scripts
	make
}

package() {
	cd bacula-${pkgver}/

	make DESTDIR="${pkgdir}" install

	# we do not take the service file provided by bacula package
	# as it needs too much customization
	install -D -m0644 "${srcdir}/bacula-fd.service" "${pkgdir}/usr/lib/systemd/system/bacula-fd.service"
}

