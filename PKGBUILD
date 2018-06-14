# Maintainer: Sherlock Holo <sherlockya at gmail com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hisato Tatekura <hisato_tatekura@excentrics.net>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>

pkgname=unbound-ecs
_pkgname=unbound
pkgver=1.7.2
pkgrel=1
pkgdesc='Validating, recursive, and caching DNS resolver, enable EDNS client subnet'
url='https://unbound.net/'
license=('custom:BSD')
arch=('x86_64')
makedepends=('expat')
optdepends=('expat: unbound-anchor')
depends=('openssl' 'ldns' 'libevent' 'fstrm' 'protobuf-c' 'dnssec-anchors')
conflicts=('unbound')
backup=('etc/unbound/unbound.conf')
validpgpkeys=('EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D')
source=("https://unbound.net/downloads/${_pkgname}-${pkgver}.tar.gz"
        'sysusers.d'
        'tmpfiles.d'
        'service'
        'hook'
        'conf')
sha256sums=('a85fc7bb34711992cf128b2012638ebb8dc1fe15818baa381f6489240845eaa0'
            '66e531fed2b5b25378c89209525087cb137206fd80b70c1f576d6333ec368402'
            'e527e51a97d1e3280f0737021fca616909375ebf0bd1050c18d1abff75b8bb2b'
            '6f4d89fbc52ed64dc3bb90d1b47a5acbff7915c17bbf76cce5f49396df0583da'
            '8d27e8420039fac40b9f7a24fc6962c62e9b65e8709cf64486dec0f97bbe83cf'
            '07d764f4f42adfba9685c5c7feef81116118f4a1772b118aa3ebbe059e8a513e')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-rpath \
		--enable-dnstap \
		--enable-pie \
		--enable-relro-now \
		--with-conf-file=/etc/unbound/unbound.conf \
		--with-pidfile=/run/unbound.pid \
		--with-rootkey-file=/etc/trusted-key.key \
		--with-libevent \
        --enable-subnet \

	make -j4
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 doc/example.conf.in "${pkgdir}/etc/unbound/unbound.conf.example"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../sysusers.d "${pkgdir}/usr/lib/sysusers.d/unbound.conf"
	install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/unbound.service"
	install -Dm644 ../conf "${pkgdir}/etc/unbound/unbound.conf"

	# Trust anchor file available from within unbound's chroot.
	install -Dm644 ../tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/unbound.conf"
	install -Dm644 ../hook "${pkgdir}/usr/share/libalpm/hooks/unbound-key.hook"
}
