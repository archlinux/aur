# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

_extension=return-youtube-dislike
pkgname="chromium-extension-$_extension"
pkgver=4.1.6
pkgrel=1
pkgdesc="Return YouTube Dislike - chromium extension"
arch=('any')
url="https://github.com/Anarios/$_extension"
license=('GPL-3.0-only')
depends=('chromium')
makedepends=('openssl' 'jq' 'unzip')
source=("$url/releases/download/v$pkgver/$_extension-chrome-$pkgver.zip"
        "$_extension.pem")
noextract=("$_extension-chrome-$pkgver.zip")
sha256sums=('81df9894f8af385638e17d01493d2ec64cb612c3e34cde385c103648de95ed07'
            'b25ae9e44d68756e8124b60be28dccc308570f5576440989aa8fa0d639d2c8f2')

# chromium derives the extension id from the public key of the signing key
_pubkey() {
    openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER 2>/dev/null | base64 -w0
}

_id() {
    _pubkey | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p'
}

prepare() {
    rm -rf "$_extension-$pkgver"
    mkdir "$_extension-$pkgver"
    unzip -q -d "$_extension-$pkgver" "$_extension-chrome-$pkgver.zip"

    # pin the extension id to our key
    cd "$_extension-$pkgver"
    jq --ascii-output --arg key "$(_pubkey)" '. + {key: $key}' manifest.json >manifest.json.new
    mv manifest.json.new manifest.json
}

build() {
    local profile
    profile="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$profile" --pack-extension="$_extension-$pkgver" \
        --pack-extension-key="$_extension.pem"
    rm -rf "$profile"
}

package() {
    local id extver
    id="$(_id)"
    extver="$(jq -r '.version' "$_extension-$pkgver/manifest.json")"

    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_extension-$pkgver.crx"
    install -dm755 "$pkgdir/usr/share/chromium/extensions"
    cat >"$pkgdir/usr/share/chromium/extensions/$id.json" <<EOF
{
    "external_crx": "/usr/lib/$pkgname/$_extension-$pkgver.crx",
    "external_version": "$extver"
}
EOF
}
