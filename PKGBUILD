# Maintainer: Damian "G'lek" Mulligan <glek@glektarssza.com>
# Contributor: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Private key generated with `openssl genrsa 2048| openssl pkcs8 -topk8 -nocrypt -traditional`
# Binary version of this package (-bin): https://aur.archlinux.org/packages/chromium-extension-keepassxc-browser-bin

pkgname=chromium-extension-keepassxc-browser
_extension=keepassxc-browser
pkgver=1.9.11
pkgrel=1
pkgdesc="KeePassXC Browser Integration - Chromium"
arch=('any')
url="https://github.com/keepassxreboot/keepassxc-browser"
license=('GPL3')
depends=('chromium')
makedepends=('openssl' 'jq' 'unzip')
source=("$_extension-$pkgver.zip::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip"
        "keepassxc-browser.pem")
noextract=("$_extension-$pkgver::$url/releases/download/$pkgver/keepassxc-browser_${pkgver}_chromium.zip")
sha256sums=('e0cad61a63a2cab1fad4443e0916a51f888c63b90c4dde262a5368fc11745a87'
            'b3fe31d0cc35b79f9b64f18e792de6b2be1fb8a94bc4d1ce8e82428faf3e35df')

build() {
    # prepare source directory (while retaining reproducibility)
    mkdir -p "_extension-$pkgver"
    unzip -q -u -d "$_extension-$pkgver" "$_extension-$pkgver.zip"
    cd "$_extension-$pkgver"

    # derive variables from private key
    pubkey="$(openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER | base64 -w0)"
    export _id="$(echo "$pubkey" | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"

    # create extension json
    _extver="$(jq -r '.version' manifest.json)"
    cat << EOF > "$srcdir/$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$_extension-$pkgver.crx",
    "external_version": "$_extver"
}
EOF

    # enroll public key in manifest
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    touch -t 202403120000 manifest.json
    cd "$srcdir"

    # pack extension
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$_extension-$pkgver" --pack-extension-key="$_extension.pem"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$_extension-$pkgver.crx"
}
