# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=kimaki
pkgver=0.4.78
pkgrel=2
pkgdesc="Discord bot - Iron Man's Jarvis for coding agents with OpenCode integration"
arch=('x86_64')
url="https://github.com/remorses/kimaki"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
options=()
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('07bd2cb20390921e814eeb97504308cc6801c1a2a853373e46cf3a756c31e46c')

package() {
    export npm_config_build_from_source=true
    export LDFLAGS="${LDFLAGS} -Wl,-z,relro -Wl,-z,now"
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "${pkgdir}" -type d -name 'build-tmp*' -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}" -type d -name 'prebuild*' -exec rm -rf {} + 2>/dev/null || true

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    find "${pkgdir}" -type f \( -name '*.so' -o -name '*.so.*' -o -name '*.node' \) -exec strip --strip-unneeded {} + 2>/dev/null || true

    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -type f -name 'config.gypi' -delete 2>/dev/null || true
    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -type f -name 'Makefile' -delete 2>/dev/null || true
    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -type f -name '*.o' -delete 2>/dev/null || true

    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ -f "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" ]; then
        install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" ]; then
        install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
