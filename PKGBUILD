# Maintainer: Ismet Togay <ismet.togay@gmail.com>

pkgname=command-code
pkgver=0.30.3
pkgrel=2
pkgdesc='AI coding agent that continuously learns your coding taste'
arch=('x86_64')
url='https://commandcode.ai'
license=('LicenseRef-command-code')
depends=('nodejs')
makedepends=('npm' 'jq')
options=(!strip)
noextract=("${pkgname}-${pkgver}.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        "$pkgname.license")
sha256sums=('0e34c8408a5f6ee5c50e8e03ddda60714028bd3e17cebf26bad9c6593b22c7a1'
            'SKIP')

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    chown -R root:root "${pkgdir}"

    # Remove npm-created symlinks; replace with wrapper scripts that disable auto-updates
    rm -f "${pkgdir}/usr/bin/cmd" \
          "${pkgdir}/usr/bin/cmdc" \
          "${pkgdir}/usr/bin/command-code" \
          "${pkgdir}/usr/bin/commandcode"

    for bin in cmd cmdc command-code commandcode; do
        install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${bin}" << 'WRAPPER'
#!/bin/sh
if [ "$1" = "update" ]; then
    echo "Updates are managed by your AUR package installer (paru, yay, etc.). Run: paru -Syu"
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

    install -Dm644 "${srcdir}/command-code.license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
