# Maintainer:	Ondřej Surý <ondrej@sury.org>

srcname=knot-resolver
pkgname=${srcname}
pkgver=1.2.3
pkgrel=1
pkgdesc='caching full resolver implementation'
url='https://www.knot-resolver.cz/'
arch=('i686' 'x86_64')
license=('GPL3')
install=install
depends=('libuv' 'gnutls>=3.0' 'knot>=2.4.1' 'lmdb' 'luajit' 'cmocka' 'jansson' 'lua51-sec' 'lua51-socket' 'hiredis' 'libmemcached' 'python-sphinx' 'python-breathe' 'doxygen')
source=("https://secure.nic.cz/files/knot-resolver/${srcname}-${pkgver}.tar.xz"
	"kresd.conf"
	"kresd.default"
	"root.key")

makevars="PREFIX=/usr SBINDIR=/usr/bin MODULEDIR=/usr/lib/knot-resolver ETCDIR=/etc/knot-resolver V=1"

sha256sums=('81a773f182112b4e11935223f900cfbcca8624f2c382b1e39a68d7c3db81c921'
	    'f078bc02f41d0eab5b1a0d27db088dbfbd121bd677ebe3fd0a86e2175562bbb0'
	    '48f5d6e29447ad865b19003f9961f8fec17dce174e5aef0c1cac36464c7d98cf'
	    '422105459af6851fbf55d876fab5069a7b772a1e2f561453165378ca07e6af1c')

build() {
	cd "${srcdir}/${srcname}-${pkgver}"
	make ${makevars}
}

check() {
	cd "${srcdir}/${srcname}-${pkgver}"
	make ${makevars}
}

package() {
	cd "${srcdir}/${srcname}-${pkgver}"

	make ${makevars} DESTDIR="${pkgdir}" install
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/kresd.socket" "${pkgdir}/usr/lib/systemd/system/kresd.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/kresd-control.socket" "${pkgdir}/usr/lib/systemd/system/kresd-control.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/kresd-tls.socket" "${pkgdir}/usr/lib/systemd/system/kresd-tls.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/kresd.service" "${pkgdir}/usr/lib/systemd/system/kresd.service"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/systemd/tmpfiles/kresd.conf" "${pkgdir}/usr/lib/tmpfiles.d/kresd.conf"
	install -dm 0755 "${pkgdir}/etc/knot-resolver"
	install -Dm 0644 "${srcdir}/kresd.conf" "${pkgdir}/etc/knot-resolver/kresd.conf"
	install -Dm 0644 "${srcdir}/kresd.default" "${pkgdir}/etc/default/kresd"
	install -dm 0755 "${pkgdir}/var/lib/knot-resolver"
	install -Dm 0644 "${srcdir}/root.key" "${pkgdir}/var/lib/knot-resolver/root.key"
}
