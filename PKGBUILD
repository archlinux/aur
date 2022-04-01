# Maintainer: Justin Holz <jholz88@arcaneventures.llc>
pkgname=chromium-extension-adnauseam-av
pkgver=3.12.2
pkgrel=0
pkgdesc="Chromium AdNauseam extension"
arch=('any')
url="https://github.com/dhowe/AdNauseam"
license=('GPL3')
provides=('chromium-extension-adnauseam')
conflicts=('chromium-extension-adnauseam')
makedepends=(
	'chromium'
	'jq'
	'openssl'
	'sed'
)
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/adnauseam-${pkgver}.chromium.zip"
	"template.json"
)
sha256sums=(
	'7cfcce026c6da1840c76ef01397bd2fbaca15695d8a9a0529fdc328f1332bf22'
	'd3f71f6947174155f9ed31948227009f9a8a7e8c415cf1e56200a4399ad51c67'
)

build() {
	# Generate private key
	openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional > private_key.pem

	# Generate public key
	public_key=$(openssl rsa -in private_key.pem -pubout -outform DER | base64 -w 0)

	# Create extension json
	export extension_id="$(echo $public_key | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"
	cp template.json $extension_id.json
	sed -i "s/PKGNAME/$pkgname/g" $extension_id.json
	sed -i "s/PKGVER/$pkgver/g" $extension_id.json

	# Generate manifest
	cd adnauseam.chromium
	jq --ascii-output --arg key "$public_key" '. + {key: $key}' manifest.json > manifest.json.new
	mv manifest.json.new manifest.json

	# Pack extension
	cd ..
	chromium --user-data-dir="$(mktemp -d chromium-pack-XXXXXX)" --pack-extension=adnauseam.chromium --pack-extension-key=private_key.pem
	mv adnauseam.chromium.crx "${pkgname}-${pkgver}.crx"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" $extension_id.json
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
