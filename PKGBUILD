# Maintainer: Andrew Siplas <andrew@asip.xyz>
# Contributor: Andrew Siplas <andrew@asip.xyz>

pkgname=rtpproxy
pkgver=2.0.0
pkgrel=2
pkgdesc="High-performance software proxy for RTP streams / announcements"
url="http://www.rtpproxy.org/"
license=('BSD')
arch=('x86_64' 'i686')
depends=('libsndfile' 'libsystemd')
optdepends=('systemd: systemd support')
source=(https://github.com/sippy/rtpproxy/archive/v2.0.0.tar.gz
	$pkgname.service
	$pkgname.sysconfig
	$pkgname.sysuser.conf
	$pkgname.tmpfiles.conf
	unix_socket.patch)
backup=('etc/default/rtpproxy')
install=$pkgname.install

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/unix_socket.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-systemd
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m 0644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0644 "../${pkgname}.sysconfig" \
		"${pkgdir}/etc/default/${pkgname}"
	install -D -m 0644 "../${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -D -m 0644 "rpm/${pkgname}.socket" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"

	install -Dm755 $srcdir/$pkgname.sysuser.conf \
		$pkgdir/usr/lib/sysusers.d/$pkgname.conf

	install -D -m 0644 "../${pkgname}.tmpfiles.conf" \
		$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
}

md5sums=('8d36fcc1dd93994ac5376d145f19ac73'
         'eb1a8cfa80bb0ab75a90d6ff245c1d19'
         '34acec87cf20930cc8c22a38088bd15e'
         '47595ec359cb897e7e3a8ea029cf3527'
         '03ac8168937f52c3b5e58928550f2e53'
         'c8dcae45531a377951e9f1d8bafe6361')
