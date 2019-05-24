# Maintainer: Joe Holden <jwh@zorins.us>

pkgname=cockroach
pkgver=19.1.1
pkgrel=1
pkgdesc="A scalable, survivable, strongly-consistent SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com"
license=('CCL')
makedepends=('go-pie' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://binaries.cockroachdb.com/cockroach-v${pkgver}.src.tgz"
        "${pkgname}.service"
        "${pkgname}.default"
        "${pkgname}.sysusers"
        "01_no_githooks.patch")
install="${pkgname}.install"
backup=("etc/default/${pkgname}")

prepare() {
	patch -p1 -N -d ${srcdir}/${pkgname}-v${pkgver} -i ${srcdir}/01_no_githooks.patch
}

build() {
	cd ${srcdir}/${pkgname}-v${pkgver}
	make -j$(nproc) buildoss
}

package() {
	install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"

	install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	install -Dm750 ${srcdir}/cockroach-v${pkgver}/src/github.com/cockroachdb/cockroach/cockroachoss ${pkgdir}/usr/bin/${pkgname}
}
md5sums=('71a0e1f88aa2d5a528d7d7046c9eebda'
         '2eadebb6eb17e584ecdc469411cd53e8'
         '15e9d2cd9ef82ca26b56179859e2a6af'
         'c4d4dcb51ce92cb03bc46c04a8151c20'
         '2ec5af308106c99eeadfa6f69ffedaa8')

