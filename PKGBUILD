# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

_extension=better-mystudies
pkgname="chromium-extension-$_extension"
pkgver=0.0.2
pkgrel=1
pkgdesc="A chromium extension to improve ETHZ websites Resources"
arch=('any')
url="https://github.com/timothelaborie/better_mystudies"
license=('custom:none')
depends=('chromium')
makedepends=('openssl' 'jq')
source=("$_extension-$pkgver.zip::$url/archive/refs/heads/main.zip"
        "$_extension.pem")
# noextract=("$_extension-$pkgver.zip::$url/archive/refs/heads/main.zip")
sha256sums=('846969e1a1c93e0c6e20586488ebd86e339515c0efd123a8516887dbf2f0c656'
            'da8247fe2cea25c6a3022ad906e31a8b889cbd5ca9cdb076731973d202eab1ba')

build() {
    #
    # mkdir -p "$_extension-$pkgver"
    # unzip -u -d "$_extension-$pkgver" "$_extension-$pkgver.zip"

    # create extension json
    _extver="$(jq -r '.version' "${url##*/}-main/manifest.json")"
    pubkey="$(openssl rsa -in "$_extension.pem" -pubout -outform DER |base64 -w0)"
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: $_id"
    cat << EOF > "$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$_extver"
}
EOF
    # update manifest key
    cd "${url##*/}-main"
    pwd
    ls
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json

    # pack extension
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="${url##*/}-main" --pack-extension-key="$_extension.pem"
    mv "${url##*/}-main.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
