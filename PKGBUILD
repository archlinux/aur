pkgname=gsd-pi
pkgver=2.82.0
pkgrel=1
pkgdesc="A powerful meta-prompting, context engineering and spec-driven development system that enables agents to work autonomously"
arch=(x86_64)
url="https://github.com/gsd-build/gsd-2"
license=(MIT)
makedepends=("npm" "jq" "findutils")
depends=("nodejs" "npm")
provides=(gsd gsd-cli)
_npm_name="@gsd-build/engine-linux-x64-gnu"
source=("https://registry.npmjs.org/@gsd-build/engine-linux-x64-gnu/-/engine-linux-x64-gnu-2.82.0.tgz")
sha256sums=('c3e0f6b120352d628d11220fb6b4913e3c602b8e625adbdd0471921799e70264')

prepare() {
    mkdir -p "${srcdir}/npm-cache"
}

package() {
    cd "${srcdir}"
    npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" "@gsd-build/engine-linux-x64-gnu-${pkgver}.tgz"

    # Fix permissions that sometimes break module resolution
    find "${pkgdir}/usr/lib/node_modules" -type d -exec chmod 755 {} +

    # Fix package.json files
    find "${pkgdir}" -name "package.json" -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson
    for pkgjson in $(find "${pkgdir}" -type f -name "package.json"); do
        jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done

    find "${pkgdir}" -type f -name "package.json" | while read -r pkgjson; do
        local tmppackage="$(mktemp)"
        jq 'del(.man)' "$pkgjson" > "$tmppackage"
        mv "$tmppackage" "$pkgjson"
        chmod 644 "$pkgjson"
    done
}