# Maintainer: Dan Fuhry <dan@fuhry.us>
# :mode=shellscript:
pkgname=kcrap
pkgver=0.2.3
pkgrel=8
pkgdesc="Kerberos Challenge Response Authentication Protocol"
license=('MIT')
depends=('krb5')
makedepends=('autoconf')
url="http://www.spock.org/kcrap/"
source=("http://mirror.fuhry.com/kcrap/kcrap-${pkgver}.tar.bz2"
		"kcrap-0.2.3-add-kcrapclient.patch"
		"kcrap-0.2.3-gcc-no-soname.patch"
		"kcrap-0.2.3-mit-krb5-1.9.patch"
		"kcrap-0.2.3-cfg-file-location.patch"
		"kcrap-0.2.3-ntlm-extra.patch"
		"kcrap.service"
		)
sha1sums=('e1e179865a604fe69548c116ad098bf0a3630160'
	  '3693a518abf50fcc4113740d30ebbe4337a574f9'
          '39974b7db71c575a97e507a5ca6db8422405b658'
          'e35f78545124299b10b79e9d169f646832afe180'
          '6c48368b90eb7a2da3f299e65b7694b4a5d45673'
          '853077185e354182a51caa2b5fc722971ef822ae'
	  '837206aab4f6f872708cb122bf5df5bc6c797894')


arch=('i686' 'x86_64')
backup=('etc/kcrap_server.conf')

build()
{
	cd "${srcdir}/kcrap-${pkgver}"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-gcc-no-soname.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-mit-krb5-1.9.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-cfg-file-location.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-ntlm-extra.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-add-kcrapclient.patch"
	
	rm -fv configure
	autoconf
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc CFLAGS=-I/usr/include/et
	make
}

package() {
	cd "${srcdir}/kcrap-${pkgver}"
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/etc/"
	cp -v "server/kcrap_server.conf" "${pkgdir}/etc/"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	cp -v "${srcdir}/kcrap.service" "${pkgdir}/usr/lib/systemd/system/"
	
	mkdir -p ${pkgdir}/usr/bin
	mv ${pkgdir}/usr/sbin/* ${pkgdir}/usr/bin/
	rm -rf ${pkgdir}/usr/sbin
}
