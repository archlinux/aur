# Maintainer:	Tomas Krizek <tomas.krizek@mailbox.org>
# Contributor:	Ondřej Surý <ondrej@sury.org>

pkgname=knot-resolver
pkgver=3.1.0
pkgrel=1
pkgdesc='full caching DNS resolver implementation'
url='https://www.knot-resolver.cz/'
arch=('x86_64' 'armv7h')
license=('GPL3')
backup=('etc/knot-resolver/kresd.conf')
options=(debug strip)
install=install
depends=('cmocka'
         'gnutls'
         'knot>=2.7.2'
         'libedit'
         'libsystemd'
         'libuv'
         'lmdb'
         'lua51-sec'
         'lua51-socket'
         'luajit')
source=("https://secure.nic.cz/files/${pkgname}/${pkgname}-${pkgver}.tar.xz")

_makevars="PREFIX=/usr SBINDIR=/usr/bin LIBDIR=/usr/lib INCLUDEDIR=/usr/include ETCDIR=/etc/knot-resolver V=1"

sha256sums=('8f3deba4695784a666cde317bc6af80ecf42ce1047b01f4b9c582fdc021c7492')

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
	install -Dm 0644 "${srcdir}/${pkgname}-${pkgver}/distro/common/kresd.conf" "${pkgdir}/etc/knot-resolver/kresd.conf"
	install -Dm 0664 "${srcdir}/${pkgname}-${pkgver}/distro/common/root.keys" "${pkgdir}/etc/knot-resolver/root.keys"
}
