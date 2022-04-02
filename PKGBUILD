# Maintainer: Justin Holz <jholz88@arcaneventures.llc>
pkgname=chromium-extension-ipfs-companion-av
pkgver=2.19.1
pkgrel=0
pkgdesc="Chromium IPFS Companion extension"
arch=('any')
url="https://github.com/ipfs/ipfs-companion"
license=('cc0-1.0')
provides=('chromium-extension-ipfs-companion')
conflicts=('chromium-extension-ipfs-companion')
makedepends=(
	'chromium'
	'jq'
	'openssl'
	'sed'
)
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/ipfs_companion-${pkgver}_chromium.zip"
	"template.json"
)
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=(
	'38556d8e091bfa107aca44e9aef11052ea8c461ddd5c57340627c3675ee611a4'
	'd3f71f6947174155f9ed31948227009f9a8a7e8c415cf1e56200a4399ad51c67'
)

prepare() {
	mkdir ipfs-companion.chromium
	bsdtar -xf ${pkgname}-${pkgver}.zip -C ipfs-companion.chromium
}

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
	cd ipfs-companion.chromium
	jq --ascii-output --arg key "$public_key" '. + {key: $key}' manifest.json > manifest.json.new
	mv manifest.json.new manifest.json

	# Pack extension
	cd ..
	chromium --user-data-dir="$(mktemp -d chromium-pack-XXXXXX)" --pack-extension=ipfs-companion.chromium --pack-extension-key=private_key.pem
	mv ipfs-companion.chromium.crx "${pkgname}-${pkgver}.crx"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" $extension_id.json
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
