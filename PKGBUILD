# Maintainer: Integral <integral@murena.io>
# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=daed
pkgver=0.4.0rc1
pkgrel=1
pkgdesc="A modern dashboard for dae, bundled with dae-wing (backend API server) and dae (core)."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/daed"
license=('AGPL' 'MIT')
makedepends=('pnpm' 'clang' 'go')
provides=('daed')
conflicts=('daed')
source=("${pkgname}-${pkgver}.zip::https://github.com/daeuniverse/${pkgname}/releases/download/v${pkgver}/${pkgname}-full-src.zip")
sha512sums=('dd38b5b3404f26cd4a58489b3172666eef5f2582c831203e1b30b9d8e5fbee98215aa2dcb2abc2da02f1c51c1a9c8d0ab4ec04fa7b3b1b734362e54fd9b316c6')
options=(!debug)

build() {
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	cd "${srcdir}"
	sed -i 's/git rev-parse --short HEAD/echo/' vite.config.ts
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
