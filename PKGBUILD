# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

# binary version of this package (-bin): github.com/noahvogt/chromium-extension-history-disabler-bin-aur

pkgname='chromium-extension-history-disabler'
_extension=history-disabler
pkgver=2.1.0
_commit=ccd2ff70017a69e3eca328bcf9d4bc9d06747e24
pkgrel=3
pkgdesc='disables history by deleting history when responsible tabs are closed - chromium extension'
license=('APL2')
arch=('any')
url='https://github.com/aghorler/History-Disabler-for-Chromium'
source=("$_extension-$pkgver::git+$url"
        "history-disabler.pem")
sha256sums=("SKIP"
            "0768840a3942e2422961c37f3516c68b7b41b45f83d04bb2ce8c302ccf29235b")
depends=('chromium')
makedepends=('jq' 'git' 'openssl')

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
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key="$_extension.pem"
    mv "$_extension-$pkgver.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
