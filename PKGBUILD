# Maintainer: kiri@vern.cc
# Contributor: sukanka<su975853527 AT gmail dot com>
pkgname=clash-verge
pkgver=1.4.6
pkgrel=1
pkgdesc="A Clash GUI based on tauri, revived"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL3')
depends=('webkit2gtk' 'clash-geoip' 'libayatana-appindicator' 'clash-meta')
makedepends=('pnpm' 'cargo-tauri' 'jq' 'moreutils' 'rust')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.desktop"
	'001-disable-updater.patch'
)

sha512sums=('3ba745fcb8ae8e7aec1026074753a9b38f67ed24e3910e0ca23132a8fed92213a529cf3b40ba87d0a803a9f78880adbe1025ae2f493008400f27be8e8800f7e5'
            '2066dacf2e5e0135e6403cbfb825efcdf08bbcdc781407e6bb1fbb85143817b2b1abef641d20390ff7e5b3e91a509933e9eb17a64f9de7671445ac6d5363a44a'
            'd1e8992cc0de168930002adccf7953416dfac199ea11886043de58b0df366e4337d5ec548fa3bf8be30575596a5e71dd31960db72f9e067ff131feb756bc96c1')
options=(!lto)
prepare() {
	mv ${pkgname}-rev-${pkgver} ${pkgname}-${pkgver}
	cd $srcdir/${pkgname}-${pkgver}
	patch --strip=1 <../001-disable-updater.patch

	install -d src-tauri/sidecar
	install -d src-tauri/resources
	# empty files as placeholders
	touch src-tauri/sidecar/clash{,-meta-alpha,-meta}-${CARCH}-unknown-linux-gnu
	touch src-tauri/resources/Country.mmdb
	touch src-tauri/resources/geo{ip,site}.dat

	jq 'del(.scripts.prepare)' package.json | sponge package.json

	cd src-tauri
	# only build the excutable
	jq '.tauri.bundle.active = false' tauri.conf.json | sponge tauri.conf.json
	# disable updater
	jq '.tauri.updater.active = false' tauri.conf.json | sponge tauri.conf.json

}

build() {
	cd $srcdir/${pkgname}-${pkgver}
	# export HOME=$srcdir
	pnpm install
	pnpm run check
	cargo-tauri build
}
package() {
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm755 src-tauri/target/release/${pkgname} -t ${pkgdir}/usr/bin

	install -d ${pkgdir}/usr/lib/${pkgname}/resources
	ln -sf /etc/clash/Country.mmdb -t ${pkgdir}/usr/lib/${pkgname}/resources

	install -Dm644 src/assets/image/logo.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg

	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications

}
