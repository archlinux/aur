# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-ublock-origin-lite
pkgver=0.1.22.9305
pkgrel=1
pkgdesc="chromium mv3 uBlock Origin extension (uBO Lite, uBOL, an experimental permission-less MV3 API-based content blocker)"
arch=('any')
url="https://github.com/gorhill/uBlock"
license=('GPL3')
makedepends=('chromium' 'openssl' 'jq' 'unzip')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/uBOLite_${pkgver}/uBOLite_${pkgver}.mv3.zip"
        "uBlock0.chromium.pem")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('f61a0c409f6619e2386940a7e497038e06cc82ddf8143eaacedeb0bf45f99ce0'
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
    mkdir -p uBlock0.chromium
    cd uBlock0.chromium
    unzip -q ../"${pkgname}-${pkgver}.zip"
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
