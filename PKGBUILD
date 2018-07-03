# Maintainer:	Tomas Krizek <tomas.krizek@mailbox.org>
# Contributor:	Ondřej Surý <ondrej@sury.org>

pkgname=knot-resolver
pkgver=2.4.0
pkgrel=1
pkgdesc='full caching DNS resolver implementation'
url='https://www.knot-resolver.cz/'
arch=('x86_64')
license=('GPL3')
backup=('etc/knot-resolver/kresd.conf')
options=(debug strip)
install=install
depends=('cmocka'
	 'gnutls'
         'knot>=2.6.7'
	 'libedit'
	 'libsystemd'
         'libuv'
	 'lmdb'
	 'lua51-sec'
	 'lua51-socket'
	 'luajit')
source=("https://secure.nic.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.xz"
	"kresd.conf"
	"root.keys")

_makevars="PREFIX=/usr SBINDIR=/usr/bin LIBDIR=/usr/lib INCLUDEDIR=/usr/include ETCDIR=/etc/knot-resolver V=1"

sha256sums=('8c88c73dd50dad6f371bfc170f49cd374022e59f8005ac1fa6cd99764f72b4d1'
	    '929658c7432252d5123ff11ee07759c595c8f5a3f4320a62d451a5f69cd2254a'
	    '06c74ef5ef53344c78c9af2b29dc458a2abe93f1bff429705955c033e7a0686f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make ${_makevars}
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check-unit ${_makevars}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make ${_makevars} DESTDIR="${pkgdir}" install
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd.socket" "${pkgdir}/usr/lib/systemd/system/kresd.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd-control@.socket" "${pkgdir}/usr/lib/systemd/system/kresd-control@.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd-tls.socket" "${pkgdir}/usr/lib/systemd/system/kresd-tls.socket"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd@.service" "${pkgdir}/usr/lib/systemd/system/kresd@.service"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd.target" "${pkgdir}/usr/lib/systemd/system/kresd.target"
	install -dm 0755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
	ln -s ../kresd.target "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/kresd.target"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/systemd/kresd.systemd.7" "${pkgdir}/usr/share/man/man7/kresd.systemd.7"
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/tmpfiles/knot-resolver.conf" "${pkgdir}/usr/lib/tmpfiles.d/knot-resolver.conf"
	install -dm 0775 "${pkgdir}/etc/knot-resolver"
	install -Dm 0644 "${srcdir}/kresd.conf" "${pkgdir}/etc/knot-resolver/kresd.conf"
	install -Dm 0664 "${srcdir}/root.keys" "${pkgdir}/etc/knot-resolver/root.keys"
}
