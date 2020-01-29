# Maintainer: 314eter
# Contributor: csicar

pkgname=fx_cast
pkgver=0.0.5
pkgrel=2
pkgdesc="Implementation of the Chrome Sender API (Chromecast) within Firefox"
arch=('x86_64')
url="https://hensm.github.io/fx_cast/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('fx_cast-bin')
options=('!strip')
source=("https://github.com/hensm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5636939846247bee0c7c14689a2daed717ac700f72d85e71ae152a5e44543ea4')

build() {
	cd "${pkgname}-${pkgver}"

	npm install
	npm run build:app
	sed -i 's#"path":.*$#"path": "/usr/bin/fx_cast_bridge"#' dist/app/fx_cast_bridge.json
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 dist/app/fx_cast_bridge "${pkgdir}/usr/bin/fx_cast_bridge"
	install -Dm644 dist/app/fx_cast_bridge.json "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/fx_cast_bridge.json"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
