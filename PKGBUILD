# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula-client
pkgver=7.0.5
pkgrel=2
pkgdesc='A network backup tool for Linux, Unix, Mac and Windows - client edition'
conflicts=('bacula')
depends=('openssl')
provides=("bacula-fd=${pkgver}")
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://www.bacula.org/'
license=('GPL2')
backup=('etc/bacula/bconsole.conf'
	'etc/bacula/bacula-fd.conf')
validpgpkeys=('2CA9F510CA5CCAF61AB529F59E98BF3210A792AD')
source=("http://downloads.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz"{,.sig}
	'bacula-fd.service')
sha256sums=('1457849eb33011b43371801b62ffa13d29bebe51be8d5a36da563b87bb094a49'
            'SKIP'
            '37cdab95a99142a7e8494f0a49e54a5bfb1dca28561d0ce70ea64bf98e0c50fd')

build() {
	cd bacula-${pkgver}/

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-client-only \
		--with-systemd=/usr/lib/systemd/system/ \
		--with-openssl \
		--sysconfdir=/etc/bacula \
		--with-scriptdir=/etc/bacula/scripts

	make


}

package() {
	cd bacula-${pkgver}/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/bacula-fd.service" "${pkgdir}/usr/lib/systemd/system/bacula-fd.service"
}

