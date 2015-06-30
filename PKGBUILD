# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: sh0 <mee@sh0.org>

pkgname=ladvd
pkgver=1.1.0
pkgrel=1
pkgdesc='LLDP daemon for Unix'
arch=('i686' 'x86_64')
url='http://ladvd.googlecode.com/'
license=('BSD')
install='ladvd.install'
depends=('pciutils' 'libcap-ng' 'libpcap' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sspans/ladvd/archive/v1.1.0.tar.gz")
sha256sums=('6db4b3270d90469e7081695f62ed13b88ac15bd41b8467c81eec5d035742ae57')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	sed -i 's/-Werror//' configure.ac

	autoreconf -fi
	./configure --prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--with-user=ladvd \
		--with-pid-dir=/run \
		--with-chroot-dir=/var/run/ladvd
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install

	install -D -m0644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"

	install -D -m0644 "systemd/ladvd.conf" "${pkgdir}/usr/lib/tmpfiles.d/ladvd.conf"

	install -d -m0755 "${pkgdir}/run/ladvd"
}

