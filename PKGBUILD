# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

_extension='privacybadger'
pkgname="chromium-extension-$_extension"
pkgver=2024.2.6
pkgrel=3
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
makedepends=('jq' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/EFForg/privacybadger/archive/refs/tags/release-$pkgver.tar.gz"
        "$_extension.pem")
sha256sums=('e38c88f74236ef2549933603403428c43b45dabbf384964064d124135d5a0cfc'
            '0f6e6fa1bb901480be99d24d26104f4ff67b41b9d748595f01f1779b7fc2a642')

build() {
    # prepare source directory (while retaining reproducibility)
    mv "privacybadger-release-$pkgver/src" "$pkgname-$pkgver"
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
    chromium --user-data-dir="$tmpdir" --pack-extension="$pkgname-$pkgver" --pack-extension-key="$srcdir/$_extension.pem"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
