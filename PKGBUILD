# Maintainer: Tobias Grosch <grosch.tobias@googlemail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>

pkgname=bacula5-client
pkgver=5.2.13
pkgrel=4
pkgdesc='A network backup tool for Linux, Unix, Mac and Windows - client edition'
conflicts=('bacula' 'bacula-client' 'bacula-fd')
depends=('openssl')
provides=("bacula5-client=${pkgver}")
arch=('i686' 'x86_64' 'arm' 'armv6h')
url='http://www.bacula.org/'
license=('GPL2')
backup=('etc/bacula/bconsole.conf'
	'etc/bacula/bacula-fd.conf')
# verification fails for DSA signatures, so disabled for now...
#validpgpkeys=('2CA9F510CA5CCAF61AB529F59E98BF3210A792AD') # Bacula Distribution Verification Key (www.bacula.org)
source=("https://kent.dl.sourceforge.net/project/bacula/bacula/${pkgver}/bacula-${pkgver}.tar.gz" #{,.sig}
	      "bacula-fd.service")
sha256sums=('a4bed458bf001889bd06bf31671b5d9908055a1d1e8113fd750ae4d326607ad8'
            '45d71c8118e08c0939c87cf2c8e20bb31d1b344fa24ba3f0ac41ae50bc12b7e4')

build() {
	cd bacula-${pkgver}/
  CPPFLAGS=-I/usr/include/openssl-1.0/
  LIBS=-L/usr/lib/openssl-1.0/
  
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-client-only \
    --with-systemd=/usr/lib/systemd/system/ \
    --with-openssl=/usr/lib/openssl-1.0/ \
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

