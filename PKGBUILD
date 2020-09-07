# Maintainer: 314eter
# Contributor: csicar

pkgname=fx_cast
pkgver=0.1.0
pkgrel=1
pkgdesc="Implementation of the Chrome Sender API (Chromecast) within Firefox"
arch=('x86_64')
url="https://hensm.github.io/fx_cast/"
license=('MIT')
makedepends=('npm')
depends=('avahi')
conflicts=('fx_cast-bin')
options=('!strip')
source=("https://github.com/hensm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('529425e78208e6acfe54284c1ca145ff1781daf627334939630b31cc53234be7')

build() {
	cd "${pkgname}-${pkgver}"

	sed -i 's/`node.*`/"host"/' app/bin/build.js
	npm install --cache "${srcdir}/npm-cache"
	npm run build:app
	sed -i 's#"path":.*$#"path": "/usr/lib/fx_cast/fx_cast_bridge.sh"#' dist/app/fx_cast_bridge.json
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 dist/app/{fx_cast_bridge.sh,package.json} -t "${pkgdir}/usr/lib/fx_cast/"
	cp -r dist/app/src "${pkgdir}/usr/lib/fx_cast/"
	cp -r app/node_modules "${pkgdir}/usr/lib/fx_cast/"

	install -Dm644 dist/app/fx_cast_bridge.json "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/fx_cast_bridge.json"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
