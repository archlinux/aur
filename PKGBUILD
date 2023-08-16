# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-keepassxc-browser
_extension=keepassxc-browser
pkgver=1.8.7
pkgrel=1
pkgdesc="KeePassXC Browser Integration - chromium extension"
arch=('any')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('custom:none')
makedepends=('chromium' 'openssl' 'jq')
source=("$_extension-$pkgver.zip::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip"
        "keepassxc-browser.pem")
noextract=("$_extension-$pkgver::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip")
sha256sums=('4d3560b49ced01b6a7cfb79fc4b8954dd6dc9d61f5bce01caad3c7f7cb199a2c'
            'b3fe31d0cc35b79f9b64f18e792de6b2be1fb8a94bc4d1ce8e82428faf3e35df')
provides=('chromium-extension-keepassxc-browser')
conflicts=('chromium-extension-keepassxc-browser')

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
