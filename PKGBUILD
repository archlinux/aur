# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: vigo <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

pkgbase=tcp_wrappers
pkgname=(tcp_wrappers tcp_wrappers-libs)
pkgver=7.6
pkgrel=20
pkgdesc='Monitors and Controls incoming TCP connections'
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv6l' 'armv7h' 'armv7l')
url='ftp://ftp.porcupine.org/pub/security/index.html'
license=('custom')
source=("ftp://ftp.porcupine.org/pub/security/${pkgbase}_${pkgver}.tar.gz"
	"https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/archlinux-stuff/tcp-wrappers-${pkgver}%2B.patch.gz"
	'hosts.allow'
	'hosts.deny')
sha256sums=('9543d7adedf78a6de0b221ccbbd1952e08b5138717f4ade814039bb489a4315d'
	'875239e808030936c1dd576aba4dee6044496e8316bc32b2169468a2e9f471a1'
	'c1b19035a14ba552e8795ec3d7171e688592c9317f2eb14373320315435565e3'
	'969414f0a161e95fbe4cfe32df7c657a2793734d09416c00fa1116c5c0a9924f')

prepare() {
	cd "${srcdir}/${pkgbase}_${pkgver}"
	patch -p1 -i "../tcp-wrappers-${pkgver}%2B.patch"
	sed -i 's|usr/sbin|usr/bin|g' 'Makefile'
}

build() {
	cd "${srcdir}/${pkgbase}_${pkgver}"
	make REAL_DAEMON_DIR='/usr/bin' STYLE='-DPROCESS_OPTIONS' linux
}

package_tcp_wrappers() {
	groups=('base')
	depends=('bash' 'tcp_wrappers-libs')
	optdepends_x86_64=('lib32-tcp_wrappers-libs: 32 bit support')
	backup=('etc/hosts.allow'
		'etc/hosts.deny')
	cd "${srcdir}/${pkgbase}_${pkgver}"
	make REAL_DAEMON_DIR='/usr/bin' DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/lib"
	install -Dm644 '../hosts.allow' "${pkgdir}/etc/hosts.allow"
	install -Dm644 '../hosts.deny' "${pkgdir}/etc/hosts.deny"
	install -Dm644 'DISCLAIMER' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_tcp_wrappers-libs() {
	pkgdesc='Monitors and Controls incoming TCP connections - Libraries'
	depends=('glibc')
	cd "${srcdir}/${pkgbase}_${pkgver}"
	make REAL_DAEMON_DIR='/usr/bin' DESTDIR="${pkgdir}" install-lib
	install -Dm644 'DISCLAIMER' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
