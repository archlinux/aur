# Maintainer: kiri@vern.cc
# Contributor: sukanka<su975853527 AT gmail dot com>

pkgname=clash-verge
pkgver=1.5.1
pkgrel=2
pkgdesc="A Clash Meta GUI based on Tauri, Continuation of Clash Verge"
arch=('x86_64' 'aarch64')
url="https://github.com/clash-verge-rev/clash-verge-rev"
license=('GPL-3.0-or-later')
depends=('cairo'
         'clash-geoip'
         'clash-meta'  
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libayatana-appindicator'
         'libsoup'
         'openssl'
         'webkit2gtk')
makedepends=('cargo-tauri'
             'jq'
             'moreutils'
             'pnpm'
             'rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	    "${pkgname}.desktop"
)
sha512sums=('a1c59b197fc0b6a91f37d47b1f71933334addc68eb06eda3277cde3bcc2593169eda08e5033edfd4901607d5011cd0373465866e8dbb09fc08e96fe6649dfbcc'
            '2066dacf2e5e0135e6403cbfb825efcdf08bbcdc781407e6bb1fbb85143817b2b1abef641d20390ff7e5b3e91a509933e9eb17a64f9de7671445ac6d5363a44a')
options=(!lto)

prepare() {
	mv ${pkgname}-rev-${pkgver} ${pkgname}-${pkgver}
	cd $srcdir/${pkgname}-${pkgver}
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
