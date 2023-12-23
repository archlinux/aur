# Maintainer: Qontinuum <qontinuum@artixlinux.org>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

_extension='privacybadger'
pkgname="chromium-extension-$_extension"
pkgver=2023.12.1
pkgrel=1
pkgdesc="Block third party tracking in your browser"
license=('GPL3')
arch=('any')
url="https://privacybadger.org/"
depends=('chromium')
source=("$pkgname-$pkgver::https://github.com/EFForg/privacybadger/archive/refs/tags/release-$pkgver.tar.gz"
        "$_extension.pem")
sha256sums=('795a25b7451c7ac2e9ccc69c14895e9f8fdd14bc9c036239438a40f5a6f9bd61'
            '0f6e6fa1bb901480be99d24d26104f4ff67b41b9d748595f01f1779b7fc2a642')

build() {
    cd "$srcdir"
    mv "privacybadger-release-$pkgver/src" "$_extension-$pkgver"
    _extver="$(jq -r '.version' "$_extension-$pkgver/manifest.json")"

    pubkey="$(openssl rsa -in "$_extension.pem" -pubout -outform DER |base64 -w0)"
    # create extension json
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: $_id"
    cat << EOF > "$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$_extension-$pkgver.crx",
    "external_version": "$_extver"
}
EOF
    cd "$_extension-$pkgver"
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json

    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key="$_extension.pem"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_extension-$pkgver.crx"
}
