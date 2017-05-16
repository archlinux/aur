# Maintainer: Andrew Siplas <andrew@asip.xyz>
# Contributor: Andrew Siplas <andrew@asip.xyz>

pkgname=rtpproxy
pkgver=2.0.0
pkgrel=1
pkgdesc="High-performance software proxy for RTP streams / announcements"
url="http://www.rtpproxy.org/"
license=('BSD')
arch=('x86_64' 'i686')
depends=('libsndfile' 'libsystemd')
optdepends=('systemd: systemd support')
source=(https://github.com/sippy/rtpproxy/archive/v2.0.0.tar.gz
	unix_socket.patch)
sha256sums=('b52bf2a302a8f08c269217e5d507f3c3ba38f4b627bb7029c8dac8ec268b23c6'
	'4fa74dbab3b2e813a679384aaa85b1c965861e085d0f9616851e28e64f0aada9')
backup=('etc/default/rtpproxy')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/unix_socket.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--enable-systemd
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m 0644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0644 "rpm/${pkgname}.sysconfig" \
		"${pkgdir}/etc/default/${pkgname}"
	install -D -m 0644 "rpm/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -D -m 0644 "rpm/${pkgname}.socket" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
}

pre_install() {
	useradd -r -U "${pkgname}" -m "/var/run/${pkgname}"
}

post_remove() {
	userdel -r "${pkgname}"
	groupdel "${pkgname}"
}
