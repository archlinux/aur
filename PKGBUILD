# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>

pkgname='chromium-extension-clearurls'
_extension='clearurls'
_commit='3692806026'
pkgver=1.26.0
pkgrel=2
pkgdesc="a chromium extension to automatically remove tracking elements from URLs to help protect your privacy"
license=('LGPL3')
arch=('any')
url="https://github.com/ClearURLs/Addon"
depends=('chromium')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://gitlab.com/ClearURLs/ClearUrls/-/jobs/$_commit/artifacts/download?file_type=archive"
        "clearurls.pem")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('96fc148f9f5e71f2e375cf0bd1d751b1777f97fa481d102cc0619fe61452e05f'
            '81e2b3fc4c621493c9c3e7625064b0ec5cb8e0dc64d8715ffd10c46de0a419d8')
provides=('chromium-extension-clearurls')
conflicts=('chromium-extension-clearurls')

package() {
    install -Dm644 "$pkgname-$pkgver.crx" "$pkgdir/usr/share/$pkgname/$pkgname.crx"
    install -Dm644 lckanjgmijmafbedllaakclkaicjfmnk.json "$pkgdir/usr/share/chromium/extensions/lckanjgmijmafbedllaakclkaicjfmnk.json"
}


build() {
    unzip -d "$pkgname-$pkgver" "$pkgname-$pkgver.zip"
    cd "$pkgname-$pkgver"
    unzip ClearURLs.zip
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
