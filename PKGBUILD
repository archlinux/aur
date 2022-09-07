# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-rggl
_extension=rggl
pkgver=6.0.8
_commit=ff37a4666304f381c8d6cffe4409a94dd07e09e8
pkgrel=1
pkgdesc="Remove German Gender Language - chromium extension"
arch=('any')
url="https://github.com/motsiw/rggl"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$_extension-$pkgver::git+https://github.com/motsiw/rggl.git"
        "rggl.pem")
sha256sums=('SKIP'
            'a1277e90fc36ecbc5700868f6194c66e8950dbbac192df16ad04c29075c1abfd')

build() {
    pubkey="$(openssl rsa -in "$_extension.pem" -pubout -outform DER |base64 -w0)"
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
    git checkout "$_commit"
    cd "src_edge_chrome_manifest_v3"
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    mv "$_extension-$pkgver/src_edge_chrome_manifest_v3" "$srcdir"
    chromium --user-data-dir="$tmpdir" --pack-extension="src_edge_chrome_manifest_v3" --pack-extension-key="$_extension.pem"
    mv "src_edge_chrome_manifest_v3.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
