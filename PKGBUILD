# Maintainer: Chi_Tang <me@chitang.dev>
# Maintainer: Integral <integral@member.fsf.org>

pkgname=nekoray
pkgver=3.26
pkgrel=3
pkgdesc='Qt based cross-platform GUI proxy configuration manager (backend: v2ray / sing-box)'
arch=('x86_64')
url='https://matsuridayo.github.io'
license=('GPL-3.0-or-later')
makedepends=('cmake' 'git' 'ninja' 'go')
depends=(
	'qt6-base' 'qt6-svg' 'qt6-tools'
	'protobuf' 'yaml-cpp' 'zxing-cpp'
)

optdepends=(
	'v2ray-domain-list-community: geosite data for NekoRay'
	'v2ray-geoip: geoip data for NekoRay'
	# AUR
	'sing-geoip: geoip data for NekoBox'
	'sing-geosite: geosite data for NekoBox'
)

source=(
	"git+https://github.com/MatsuriDayo/${pkgname}.git#tag=${pkgver}"
	"${pkgname}.desktop"
)

sha512sums=('SKIP'
            'c8ad5a0cf5d813e1e35b827f92d526c022d529d34dd4019066b550c8f0dbdb89b0fb62e6bfc650e8c18acac826591e858eff3b2e5e6c6f5014f0f4b50f1fa88b')

build() {
	cd "${pkgname}/"
	git submodule init
	git submodule update
	bash libs/get_source.sh

	mkdir build
	cd build
	cmake -GNinja -DQT_VERSION_MAJOR=6 -DNKR_PACKAGE=ON ..
	ninja

	cd ..
	GOOS=linux GOARCH=amd64 ./libs/build_go.sh
}

package() {
	install -dm755 "${pkgdir}/usr/bin/"

	# assets
	install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
	install -Dm644 ${pkgname}/res/public/{nekoray,nekobox}.png -t "${pkgdir}/usr/share/pixmaps/"

	# core
	install -Dm755 ${pkgname}/deployment/linux64/{nekoray,nekobox}_core -t "${pkgdir}/usr/lib/${pkgname}/"

	# app
	install -Dm755 "${pkgname}/build/${pkgname}" -t "${pkgdir}/usr/lib/${pkgname}/"

	ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
