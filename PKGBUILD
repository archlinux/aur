# Maintainer: 314eter
# Contributor: csicar

pkgname=fx_cast
pkgver=0.0.7
pkgrel=1
pkgdesc="Implementation of the Chrome Sender API (Chromecast) within Firefox"
arch=('x86_64')
url="https://hensm.github.io/fx_cast/"
license=('MIT')
makedepends=('npm')
conflicts=('fx_cast-bin')
options=('!strip')
source=("https://github.com/hensm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d9dbcf9594e343b2e5ccc901a1bf5659b1a98cdce4e0910833d1d27872eb5efe')

build() {
	cd "${pkgname}-${pkgver}"

	sed -i 's/`node.*`/"host"/' app/bin/build.js
	npm install --cache "${srcdir}/npm-cache"
	npm run build:app
	sed -i 's#"path":.*$#"path": "/usr/lib/fx_cast/fx_cast_bridge"#' dist/app/fx_cast_bridge.json
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 dist/app/fx_cast_bridge -t "${pkgdir}/usr/lib/fx_cast/"
	install -Dm755 dist/app/dns_sd_bindings.node -t "${pkgdir}/usr/lib/fx_cast/"
	install -Dm644 dist/app/fx_cast_bridge.json "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/fx_cast_bridge.json"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
