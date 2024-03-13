# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`

_extension='clearurls'
pkgname="chromium-extension-$_extension"
pkgver=1.27.0
pkgrel=3
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy"
license=('LGPL3')
arch=('any')
url="https://gitlab.com/ClearURLs/ClearUrls"
depends=('chromium')
makedepends=('git' 'jq' 'openssl')
_commit="14a0832973e137f0cbbbb1e9110c1286bc88e319"
source=("git+https://gitlab.com/ClearURLs/ClearUrls.git#commit=$_commit"
        "$_extension.pem")
sha256sums=('SKIP'
            '81e2b3fc4c621493c9c3e7625064b0ec5cb8e0dc64d8715ffd10c46de0a419d8')

build() {
    # prepare source directory (while retaining reproducibility)
    mkdir -p "$pkgname-$pkgver"
    cd ClearUrls
    cp -r clearurls.js browser-polyfill.js manifest.json img/ external_js/ html/ core_js/ css/ fonts/ _locales/ ../"$pkgname-$pkgver"
    cd ..
    find "$pkgname-$pkgver" -exec touch -t 202403120000 {} +

    # derive variables from private key
    pubkey="$(openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER |base64 -w0)"
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"

    # create extension json
    _extver="$(jq -r '.version' "$pkgname-$pkgver/manifest.json")"
    echo "extenson id should be: $_id"
    cat << EOF > "$srcdir/$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$_extver"
}
EOF

    # enroll public key in manifest
    cd "$srcdir/$pkgname-$pkgver"
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    touch -t 202403120000 manifest.json
    cd ..

    # pack extension
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$pkgname-$pkgver" --pack-extension-key="$_extension.pem"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
