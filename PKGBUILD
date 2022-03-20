# Maintainer: Jerry Xiao <aur@mail.jerryxiao.cc>
# Private key generated with `openssl pkcs8 -topk8 -nocrypt -traditional`
# Note that _id has to be changed according to private key

_id=mknbbgpgkjeelgfmcimkmcmponbgnhnp
pkgname=chromium-extension-ublock-origin
pkgver=1.41.8
pkgrel=1
pkgdesc="chromium uBlock Origin extension"
arch=('any')
url="https://github.com/gorhill/uBlock"
license=('GPL3')
makedepends=('chromium' 'openssl')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/uBlock0_${pkgver}.chromium.zip"
        "uBlock0.chromium.pem")
sha256sums=('167d13ea235553b55891c35b1f5e1ebdd23343c2a292fe9acbc875330870a75e'
            '804e431b5601a5d0bd9d7e1d27ea8396c6cc87f2523d6d857f1abf368df3a06f')

prepare() {
    # Create extension json
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/${pkgname}/${pkgname}-${pkgver}.crx",
    "external_version": "${pkgver}"
}
EOF
}

build() {
    cd uBlock0.chromium
    pubkey="$(openssl rsa -in ../uBlock0.chromium.pem -pubout -outform DER |base64 -w0)"
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
