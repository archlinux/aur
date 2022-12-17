# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-ublock-origin
pkgver=1.45.2
pkgrel=1
pkgdesc="chromium uBlock Origin extension"
arch=('any')
url="https://github.com/gorhill/uBlock"
license=('GPL3')
makedepends=('chromium' 'openssl' 'jq')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/uBlock0_${pkgver}.chromium.zip"
        "uBlock0.chromium.pem")
sha256sums=('78af27a7b8744724cc3b6f776d109c5b8fa80cf6b702f045775b85383d9aeef5'
            '804e431b5601a5d0bd9d7e1d27ea8396c6cc87f2523d6d857f1abf368df3a06f')

build() {
    pubkey="$(openssl rsa -in uBlock0.chromium.pem -pubout -outform DER |base64 -w0)"
    # Create extension json
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: ${_id}"
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/${pkgname}/${pkgname}-${pkgver}.crx",
    "external_version": "${pkgver}"
}
EOF
    cd uBlock0.chromium
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd ..
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension=uBlock0.chromium --pack-extension-key=uBlock0.chromium.pem
    mv uBlock0.chromium.crx "${pkgname}-${pkgver}.crx"
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" "${_id}.json"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"
}
