# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-copy-url-on-hover
_extension=copy-url-on-hover
pkgver=0.7.0
pkgrel=1
pkgdesc="Copy URL On Hover - chromium extension"
arch=('any')
url="https://github.com/noahvogt/copy-url-on-hover"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("https://github.com/noahvogt/$_extension/archive/refs/tags/v$pkgver.tar.gz"
        "copy-url-on-hover.pem")
sha256sums=('dea4ad27481e8ea93bc401aaf59943c80d1f81ab6dbfbcd4f0e9168cbc505b81'
            'c06aca0d925d5f6f8ab55e7c3032fee7ffeb56c99fd3625e90bd167bef489dfc')

build() {
    pubkey="$(openssl rsa -in copy-url-on-hover.pem -pubout -outform DER |base64 -w0)"
    # create extension json
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: $_id"
    cat << EOF > "$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$pkgver"
}
EOF
    cd "$_extension-$pkgver"
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd ..
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key=copy-url-on-hover.pem
    mv "$_extension-$pkgver.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
