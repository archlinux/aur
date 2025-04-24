# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>
# Private key generated with `openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -traditional`

pkgname=chromium-extension-arch-search
pkgver=0.0.1
pkgrel=1
pkgdesc="A Chromium-based browser extension that adds ArchLinux as a search engine with an Omnibox keyword."
arch=('any')
url="https://github.com/noraj/$pkgname"
license=('MIT')
makedepends=('chromium' 'openssl' 'jq' '7zip')
source=("$url/releases/download/$pkgver/archlinux_search_$pkgver.zip"
        "$pkgname.priv.pem")
sha256sums=('2c695e04746199ea120dbb8f43365bd74a33b8f037a9169015661237b4d2c6ed'
            '1ecd317637d90c60351cb72f0ef0b4ad1f81a6f35dc7fb1e579a83c55b26ccca')
noextract=("archlinux_search_$pkgver.zip")

prepare() {
  7z x -oarch-search-unpack "archlinux_search_$pkgver.zip"
}

build() {
    pubkey="$(openssl rsa -in $pkgname.priv.pem -pubout -outform DER | base64 -w0)"
    # Create extension json
    export _id="$(echo $pubkey | base64 -d | sha256sum | head -c32 | tr '0-9a-f' 'a-p')"
    echo "extenson id should be: ${_id}"
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/$pkgname/$pkgname-$pkgver.crx",
    "external_version": "$pkgver"
}
EOF
    cd arch-search-unpack
    jq --ascii-output --arg key "$pubkey" '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    cd ..
    tmpdir="$(mktemp -d chromium-pack-XXXXXX)"
    chromium --user-data-dir="$tmpdir" --pack-extension=arch-search-unpack --pack-extension-key=$pkgname.priv.pem
    mv "arch-search-unpack.crx" "$pkgname-$pkgver.crx"
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/chromium/extensions/" "$_id.json"
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/" "$pkgname-$pkgver.crx"
}

