# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`

# binary version of this package (-bin): github.com/noahvogt/chromium-extension-keepassxc-browser-bin-aur

pkgname=chromium-extension-keepassxc-browser
_extension=keepassxc-browser
pkgver=1.8.12
pkgrel=3
pkgdesc="KeePassXC Browser Integration - chromium extension"
arch=('any')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('GPL3')
depends=('chromium')
makedepends=('openssl' 'jq' 'unzip')
source=("$_extension-$pkgver.zip::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip"
        "keepassxc-browser.pem")
noextract=("$_extension-$pkgver::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip")
sha256sums=('31cb886c45f140ae63fad557b0cd330c2f3b1b875f83b05705a05ed8510eac03'
            'b3fe31d0cc35b79f9b64f18e792de6b2be1fb8a94bc4d1ce8e82428faf3e35df')

build() {
    pubkey="$(openssl rsa -in "$_extension.pem" -pubout -outform DER |base64 -w0)"
    # create extension json
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
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
    touch -t 202403120000 manifest.json
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key="$_extension.pem"
    mv "$_extension-$pkgver.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
