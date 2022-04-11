# Maintainer: Justin Holz <jholz88@arcaneventures.llc>
pkgname=chromium-extension-privacy-redirect-av
pkgver=1.1.49
pkgrel=1
pkgdesc="Chromium Privacy Redirect extension"
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
license=('gpl-3.0')
provides=('chromium-extension-privacy-redirect')
conflicts=('chromium-extension-privacy-redirect')
makedepends=(
	'chromium'
	'freetube'
	'jq'
	'npm'
	'openssl'
	'sed'
	'web-ext'
)
source=(
	"${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
	"template.json"
)
sha256sums=(
	'e43ac70a9313a06ad0d45229208f90311e625ae307abc0cee4b661e001e48ab0'
	'd3f71f6947174155f9ed31948227009f9a8a7e8c415cf1e56200a4399ad51c67'
)

build() {
	# Generate private key
	openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional > private_key.pem

	# Generate public key
	public_key=$(openssl rsa -in private_key.pem -pubout -outform DER | base64 -w 0)

	# Create extension json
	export extension_id="$(echo ${public_key} | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"
	cp template.json ${extension_id}.json
	sed -i "s/PKGNAME/${pkgname}/g" ${extension_id}.json
	sed -i "s/PKGVER/${pkgver}/g" ${extension_id}.json

	# Build extension
	mkdir privacy-redirect.chromium || true
	cd privacy-redirect-${pkgver}
	npm run build
	bsdtar -xf web-ext-artifacts/privacy_redirect-${pkgver}.zip -C ../privacy-redirect.chromium

	# Generate manifest
	cd ../privacy-redirect.chromium
	jq --ascii-output --arg key "${public_key}" '. + {key: $key}' manifest.json > manifest.json.new
	mv manifest.json.new manifest.json

	# Modify defaults
	sed -i '642s/],/, "useFreeTube"],/' ./pages/background/background.js
	sed -i '659 i \ \ \ \ \ \ if (result.useFreeTube === undefined) {\n        browser.storage.sync.set({\n          useFreeTube: true,\n        });\n      }' ./pages/background/background.js

	# Pack extension
	cd ..
	chromium --user-data-dir="$(mktemp -d chromium-pack-XXXXXX)" --pack-extension=privacy-redirect.chromium --pack-extension-key=private_key.pem
	mv privacy-redirect.chromium.crx "${pkgname}-${pkgver}.crx"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" ${extension_id}.json
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
