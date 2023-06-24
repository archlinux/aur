# Maintainer: Integral <integral@murena.io>
# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=daed
pkgver=0.1.0
pkgrel=2
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
arch=('x86_64')
url="https://github.com/daeuniverse/daed"
license=('AGPL' 'MIT')
makedepends=('pnpm' 'clang' 'go')
provides=('daed')
conflicts=('daed')
source=("${pkgname}-${pkgver}.zip::https://github.com/daeuniverse/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-src.zip")
sha256sums=('8e22425eb581e180fc134d191c4b50f40ab3954b990350b07aef57467a3caf3c')
options=(!debug)

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	cd "${srcdir}"
	sed -i '/git submodule update/d' wing/Makefile # temporary fix
	make VERSION="${pkgver}"
}

package() {
	depends=(
		v2ray-geoip
		v2ray-domain-list-community
	)

	cd "${srcdir}"

	install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm644 "install/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -d "${pkgdir}/etc/daed/"

	mkdir -p "${pkgdir}/usr/share/daed"
	ln -vs "/usr/share/v2ray/geoip.dat" "${pkgdir}/usr/share/daed/geoip.dat"
	ln -vs "/usr/share/v2ray/geosite.dat" "${pkgdir}/usr/share/daed/geosite.dat"
}
