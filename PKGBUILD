# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`

# binary version of this package (-bin): github.com/noahvogt/chromium-extension-rggl-bin-aur

_extension=rggl
pkgname="chromium-extension-$_extension"
pkgver=6.1.5
pkgrel=6
pkgdesc="Remove German Gender Language - chromium extension"
arch=('any')
url="https://github.com/motsiw/$_extension"
license=('GPL-3.0-only')
depends=('chromium')
makedepends=('git' 'openssl' 'jq')
# no tag for 6.1.5 upstream
_commit=319553d247b80a7907b108c362e08d4b1759ee8d
source=("git+$url.git#commit=$_commit"
        "$_extension.pem")
sha256sums=('9ca05cf22509fd4c64d045431f23b2f5dab0cffcf61c811e04b11580a525fb17'
            'a1277e90fc36ecbc5700868f6194c66e8950dbbac192df16ad04c29075c1abfd')

# chromium derives the extension id from the public key of the signing key
_pubkey() {
    openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER 2>/dev/null | base64 -w0
}

_id() {
    _pubkey | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p'
}

prepare() {
    rm -rf "$pkgname-$pkgver"
    cp -r "$_extension/src_edge_chrome_manifest_v3" "$pkgname-$pkgver"

    # pin the extension id to our key
    cd "$pkgname-$pkgver"
    jq --ascii-output --arg key "$(_pubkey)" '. + {key: $key}' manifest.json >manifest.json.new
    mv manifest.json.new manifest.json

    # fixed mtimes for a reproducible crx
    find . -exec touch -t 202403120000 {} +
}

build() {
    local profile
    profile="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$profile" --pack-extension="$pkgname-$pkgver" \
        --pack-extension-key="$_extension.pem"
    rm -rf "$profile"
}

package() {
    local id extver
    id="$(_id)"
    extver="$(jq -r '.version' "$pkgname-$pkgver/manifest.json")"

    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
    install -dm755 "$pkgdir/usr/share/chromium/extensions"
    cat >"$pkgdir/usr/share/chromium/extensions/$id.json" <<EOF
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$extver"
}
EOF
}
