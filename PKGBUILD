# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-clearurls'
_extension='clearurls'
pkgver=1.27.0
pkgrel=2
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy"
license=('LGPL3')
arch=('any')
url="https://gitlab.com/ClearURLs/ClearUrls"
depends=('chromium')
makedepends=('git' 'zip' 'unzip' 'jq' 'openssl')
_commit="14a0832973e137f0cbbbb1e9110c1286bc88e319"
source=("git+https://gitlab.com/ClearURLs/ClearUrls.git#commit=$_commit"
        "clearurls.pem")
sha256sums=('SKIP'
            '81e2b3fc4c621493c9c3e7625064b0ec5cb8e0dc64d8715ffd10c46de0a419d8')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

build() {
    cd ClearUrls
    zip ../ClearURLs.zip -r -FS clearurls.js browser-polyfill.js manifest.json img/* external_js/* html/* core_js/* css/* fonts/* _locales/*
    cd ..

    unzip -d "$pkgname-$pkgver" "ClearURLs.zip"
    cd "$pkgname-$pkgver"

    pubkey="$(openssl rsa -in "$srcdir/$_extension.pem" -pubout -outform DER |base64 -w0)"
    # create extension json
    export _id="$(echo $pubkey |base64 -d |sha256sum |head -c32 |tr '0-9a-f' 'a-p')"
    echo "extenson id should be: $_id"
    cat << EOF > "$_id".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$pkgver"
}
EOF
    cd "$srcdir/$pkgname-$pkgver"
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd "$srcdir"
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension="$pkgname-$pkgver" --pack-extension-key="$_extension.pem"
    #mv "src_edge_chrome_manifest_v3.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$srcdir/$pkgname-$pkgver/$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}
