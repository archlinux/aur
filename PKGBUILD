# Maintainer: 314eter
# Contributor: csicar

pkgname=fx_cast
pkgver=0.0.6
pkgrel=1
pkgdesc="Implementation of the Chrome Sender API (Chromecast) within Firefox"
arch=('x86_64')
url="https://hensm.github.io/fx_cast/"
license=('MIT')
makedepends=('npm')
conflicts=('fx_cast-bin')
options=('!strip')
source=("https://github.com/hensm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b7044abfd46f9ccbe2a0a79632d5e0e10154a0cd23e4712f97efe58013dd7cdc')

build() {
	cd "${pkgname}-${pkgver}"

	npm install --cache "${srcdir}/npm-cache"
	npm run build:app
	sed -i 's#"path":.*$#"path": "/usr/bin/fx_cast_bridge"#' dist/app/fx_cast_bridge.json
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 dist/app/fx_cast_bridge "${pkgdir}/usr/bin/fx_cast_bridge"
	install -Dm644 dist/app/fx_cast_bridge.json "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/fx_cast_bridge.json"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
