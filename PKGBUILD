# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula5-client
pkgver=5.2.13
pkgrel=1
pkgdesc='A network backup tool for Linux, Unix, Mac and Windows - client edition'
conflicts=('bacula' 'bacula-client')
depends=('openssl')
provides=("bacula-fd=${pkgver}")
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://www.bacula.org/'
license=('GPL2')
backup=('etc/bacula/bconsole.conf'
	'etc/bacula/bacula-fd.conf')
# verification fails for DSA signatures, so disabled for now...
#validpgpkeys=('2CA9F510CA5CCAF61AB529F59E98BF3210A792AD') # Bacula Distribution Verification Key (www.bacula.org)
source=("http://downloads.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz" #{,.sig}
	'bacula-fd.service')
sha256sums=('a4bed458bf001889bd06bf31671b5d9908055a1d1e8113fd750ae4d326607ad8'
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

	# we do not take the service file provided by bacula package
	# as it needs too much customization
	install -D -m0644 "${srcdir}/bacula-fd.service" "${pkgdir}/usr/lib/systemd/system/bacula-fd.service"
}

