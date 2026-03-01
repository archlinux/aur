# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=kimaki
pkgver=0.4.72
pkgrel=1
pkgdesc="Discord bot - Iron Man's Jarvis for coding agents with OpenCode integration"
arch=('x86_64')
url="https://github.com/remorses/kimaki"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
options=()
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('219ca3cc5c3d775b5d4cae8553a6faddbdef8c541dfcaa551e86bc61803d35e9')

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
}
