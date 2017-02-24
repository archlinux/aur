# Maintainer: Nick Saika <nsaika@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Hisato Tatekura <hisato_tatekura@excentrics.net>
# Contributor: Massimiliano Torromeo <massimiliano DOT torromeo AT google mail service>

pkgname=unbound-dnstap
pkgver=1.6.1
pkgrel=1
pkgdesc='Validating, recursive, and caching DNS resolver (with dnstap support)'
url='https://unbound.net/'
license=('custom:BSD')
arch=('i686' 'x86_64')
makedepends=('expat' "fstrm" "protobuf-c")
optdepends=('expat: unbound-anchor')
depends=('openssl' 'ldns' 'libevent' 'dnssec-anchors' "fstrm" "protobuf-c")
backup=('etc/unbound/unbound.conf')
validpgpkeys=('EDFAA3F2CA4E6EB05681AF8E9F6F1C2D7E045F8D')
groups=("modified")
conflicts=("unbound")
replaces=("unbound")
provides=("unbound")
source=("https://unbound.net/downloads/unbound-${pkgver}.tar.gz"{,.asc}
        'service'
        'hook'
        'conf')
sha1sums=('41369fcfd37844b02b7293b37ec78e69f0db34c7' 'SKIP'
          'b543ae6f8b87423bec095fca6b335a9ee43739a8'
          '098d680a06e730330e3ccbdd58234d07ad1837dc'
	  "45cb90673d4afabf8afb821df81521a35db18add")

install=install

build() {
	cd "${srcdir}/unbound-${pkgver}"

	# Build against embedded flex instead of system one, see:
	# https://www.nlnetlabs.nl/bugs-script/show_bug.cgi?id=1223
	export LEX=:

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-rpath \
		--enable-pie \
		--enable-relro-now \
		--with-conf-file=/etc/unbound/unbound.conf \
		--with-pidfile=/run/unbound.pid \
		--with-rootkey-file=/etc/trusted-key.key \
		--with-libevent \
		--with-dnstap \

	make
}

package() {
	cd "${srcdir}/unbound-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 doc/example.conf.in "${pkgdir}/etc/unbound/unbound.conf.example"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/unbound.service"
	install -Dm644 ../hook "${pkgdir}/usr/share/libalpm/hooks/unbound-key.hook"
	install -Dm644 ../conf "${pkgdir}/etc/unbound/unbound.conf"
}
