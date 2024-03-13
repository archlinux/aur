# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`

# binary version of this package (-bin): github.com/noahvogt/chromium-extension-rggl-bin-aur

_extension=rggl
pkgname=chromium-extension-"$_extension"
pkgver=6.1.5
_commit=319553d247b80a7907b108c362e08d4b1759ee8d
pkgrel=5
pkgdesc="Remove German Gender Language - chromium extension"
arch=('any')
url="https://github.com/motsiw/$_extension"
license=('custom:none')
depends=('chromium')
makedepends=('git' 'openssl' 'jq')
source=("git+https://github.com/motsiw/$_extension.git"
        "$_extension.pem")
sha256sums=('SKIP'
            'a1277e90fc36ecbc5700868f6194c66e8950dbbac192df16ad04c29075c1abfd')

build() {
    # prepare source directory (while retaining reproducibility)
    cd "$_extension"
    git checkout "$_commit"
    cd ..
    mv "$_extension"/src_edge_chrome_manifest_v3 "$pkgname-$pkgver"
    find "$pkgname-$pkgver" -exec touch -t 202403120000 {} +

    # derive variables from private key
    pubkey="$(openssl rsa -in "$_extension.pem" -pubout -outform DER | base64 -w0)"
    export _id="$(echo $pubkey | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"

    # create extension json
    _extver="$(jq -r '.version' "$pkgname-$pkgver/manifest.json")"
    cat << EOF > "$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$_extver"
}
EOF

    # enroll public key in manifest
    cd "$pkgname-$pkgver"
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
