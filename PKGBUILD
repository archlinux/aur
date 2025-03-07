# Maintainer: kevku <kevku@gmx.com>
pkgbase=web-eid-webextension
pkgname=("firefox-extension-web-eid" "chromium-extension-web-eid")
pkgver=2.3.0
pkgrel=1
pkgdesc="Web eID browser extension"
arch=('any')
url="https://web-eid.eu/"
license=('MIT')
makedepends=('git' 'nodejs-lts' 'npm' 'openssl' 'zip' 'xxd' 'jq')
source=("$pkgbase::git+https://github.com/web-eid/web-eid-webextension.git?signed#tag=v$pkgver"
        "web-eid-js::git+https://github.com/web-eid/web-eid.js.git")
sha256sums=("SKIP" "SKIP")
validpgpkeys=(
    '1282B0F8809D0DC632C85A3F86B611CE24492160'  # Mart Somermaa
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma
)

prepare() {
    cd "$srcdir/$pkgbase"
    git submodule init
    git config submodule.lib/web-eid.js.url $srcdir/web-eid-js
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgbase"
    npm install --cache "${srcdir}/npm-cache"
    SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct) TOKEN_SIGNING_BACKWARDS_COMPATIBILITY=true npm run clean build package
}

package_firefox-extension-web-eid() {
    pkgdesc="Web eID Firefox extension (unsigned)"
    depends=(web-eid-native)
    conflicts=(web-eid-firefox)
    cd "$srcdir/$pkgbase"
    install -Dm644 ./dist/firefox.zip "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}/{e68418bc-f2b0-4459-a9ea-3e72b6751b07}.xpi"
    install -Dm644 "$srcdir/$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cat << EOF > "eu.webeid.json"
{
"name": "eu.webeid",
"description": "Web-eid native application",
"path": "/usr/bin/web-eid",
"type": "stdio",
"allowed_extensions": [ "{e68418bc-f2b0-4459-a9ea-3e72b6751b07}" ]
}
EOF
    install -Dm644 "eu.webeid.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/eu.webeid.json"
}

package_chromium-extension-web-eid() {
    pkgdesc="Web eID Chromium extension (unsigned)"
    depends=(web-eid-native)
    conflicts=(web-eid-chrome)
    cd "$srcdir/$pkgbase/dist/"
    # https://stackoverflow.com/questions/18693962/pack-chrome-extension-on-server-with-only-command-line-interface
    openssl genrsa 2048 | openssl pkcs8 -topk8 -nocrypt -out "$pkgbase.pem"
    openssl rsa -in "$pkgbase.pem" -pubout -outform der | openssl dgst -sha256 -binary -out "$pkgbase.crxid"
    truncate -s 16 "$pkgbase.crxid"
    openssl rsa -pubout -outform DER < "$pkgbase.pem" > "$pkgbase.pub" 2>/dev/null
    crx_id=$(xxd -p -c0 "$pkgbase.crxid" | tr '0-9a-f' 'a-p')
    cd chrome
    jq --ascii-output --arg key $(cat "../$pkgbase.pub" | base64 -w0) '. + {key: $key}' manifest.json > manifest.json.new
    mv manifest.json.new manifest.json
    zip -qr -9 -X "../$pkgbase.zip" .
    cd ..
    (
        printf "CRX3 SignedData"
        echo "00 12 00 00 00 0A 10" | xxd -r -p
        cat "$pkgbase.crxid" "$pkgbase.zip"
    ) > "$pkgbase.presig"
    openssl dgst -sha256 -binary -sign "$pkgbase.pem" < "$pkgbase.presig" > "$pkgbase.sig"
    
    crmagic_hex="43 72 32 34" # Cr24
    version_hex="03 00 00 00" # 3
    header_length="45 02 00 00"
    header_chunk_1="12 AC 04 0A A6 02"
    header_chunk_2="12 80 02"
    header_chunk_3="82 F1 04 12 0A 10"
    (
        echo "$crmagic_hex $version_hex $header_length $header_chunk_1" | xxd -r -p
        cat "$pkgbase.pub"
        echo "$header_chunk_2" | xxd -r -p
        cat "$pkgbase.sig"
        echo "$header_chunk_3" | xxd -r -p
        cat "$pkgbase.crxid" "$pkgbase.zip"
    ) > "$crx_id.crx"
    cat << EOF > "$crx_id.json"
{
    "external_crx": "/usr/share/$pkgname/$crx_id.crx",
    "external_version": "${pkgver}"
}
EOF
    cat << EOF > "eu.webeid.json"
{
"name": "eu.webeid",
"description": "Web-eid native application",
"path": "/usr/bin/web-eid",
"type": "stdio",
"allowed_origins": [
  "chrome-extension://$crx_id/"
]
}
EOF
    install -Dm644 "eu.webeid.json" "$pkgdir/usr/share/web-eid/eu.webeid.json"
    mkdir -p $pkgdir/etc/chromium/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/chromium/native-messaging-hosts/eu.webeid.json"
    install -Dm644 "$crx_id.crx" "$pkgdir/usr/share/$pkgname/$crx_id.crx"
    install -Dm644 "$crx_id.json" "$pkgdir/usr/share/chromium/extensions/$crx_id.json"
    # vivaldi
    mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/eu.webeid.json"
}
