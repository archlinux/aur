# Maintainer: 314eter
# Contributor: csicar

pkgname=fx_cast
pkgver=0.1.2
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
sha256sums=('eb166318c3c4a62cb74e2e1457911d6abcf2bd1f1462bcc3ad1c0bdeb29291ab')

prepare() {
	cd "${pkgname}-${pkgver}/app"

	sed -i '/devDependencies/a "typescript": "^3.9.7",' package.json
	sed -i -e 's/`node.*`/"host"/' -e '/: path\.join/a manifest.path = "/usr/lib/fx_cast/fx_cast_bridge"' bin/build.js
}

build() {
	cd "${pkgname}-${pkgver}/app"

	npm install --cache "${srcdir}/npm-cache"
	npm run build -- --usePkg
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 dist/app/fx_cast_bridge -t "${pkgdir}/usr/lib/fx_cast/"
	install -Dm644 dist/app/dns_sd_bindings.node -t "${pkgdir}/usr/lib/fx_cast/"

	install -Dm644 dist/app/fx_cast_bridge.json -t "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
