# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula-client
pkgver=9.6.3
pkgrel=1
pkgdesc='A network backup tool for Linux, Unix, Mac and Windows - client edition'
conflicts=('bacula')
depends=('openssl')
provides=("bacula-fd=${pkgver}")
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://www.bacula.org/'
license=('GPL2')
backup=('etc/bacula/bconsole.conf'
	'etc/bacula/bacula-fd.conf')
validpgpkeys=('86260C02E82A8FC5CA5FB0638363575EFBD8D142') # Bacula 4096 Distribution Verification Key (www.bacula.org) <kern@bacula.org>
source=("http://downloads.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz"{,.sig}
	'bacula-fd.service')
sha256sums=('ec1365a678e1b49505c1cdbc59a3cef5ca5f5a5a25fb1b0cced822eeb88c5b0a'
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

