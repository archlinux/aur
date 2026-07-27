# Maintainer: Ismet Togay <ismet.togay@gmail.com>

pkgname=command-code
pkgver=1.4.4
pkgrel=1
pkgdesc='AI coding agent that continuously learns your coding taste'
arch=('x86_64')
url='https://commandcode.ai'
license=('LicenseRef-command-code')
depends=('nodejs')
makedepends=('npm' 'jq')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE")
sha256sums=('ae8f03a25a802f118cccad940f27b4317897ec2667cf19c88af1c40421063bf5'
            'd0dd3a7697c4b7844529345c317d74edcaa10b9fd495249151cbe653d7421c6c')

package() {
    npm install -g \
        --no-audit \
        --no-fund \
        --prefer-offline \
        --allow-scripts sharp \
        --allow-scripts protobufjs \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Remove npm-created symlinks; replace with wrapper scripts that disable auto-updates
    rm -f "${pkgdir}/usr/bin/cmd" \
          "${pkgdir}/usr/bin/cmdc" \
          "${pkgdir}/usr/bin/command-code" \
          "${pkgdir}/usr/bin/commandcode"

    for bin in cmd cmdc command-code commandcode; do
        install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${bin}" << 'WRAPPER'
#!/bin/sh
if [ "$1" = "update" ]; then
    echo "command-code updates are managed by your AUR helper. Use: paru -Syu (or yay -Syu)"
    exit 0
fi
COMMANDCODE_SKIP_UPDATES=1 exec /usr/lib/node_modules/command-code/dist/index.mjs "$@"
WRAPPER
    done

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/\_where/d'

    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    if [[ -f "$pkgjson" ]]; then
        local tmppackage
        tmppackage="$(mktemp)"
        jq '.|=with_entries(select(.key|test("^_")|not))' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    fi

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
