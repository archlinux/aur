# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-keepassxc-browser
_extension=keepassxc-browser
pkgver=1.8.2.2
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension"
arch=('any')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$_extension-$pkgver.zip::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip"
        "keepassxc-browser.pem")
noextract=("$_extension-$pkgver::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip")
sha256sums=('ae9a41a4490c4f0209665e354dba23569e00f0b2be818c421d3a29044ae410fd'
            'b3fe31d0cc35b79f9b64f18e792de6b2be1fb8a94bc4d1ce8e82428faf3e35df')

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
    mkdir -p "_extension-$pkgver"
    unzip -u -d "$_extension-$pkgver" "$_extension-$pkgver.zip"
    cd "$_extension-$pkgver"
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
