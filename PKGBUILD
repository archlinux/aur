# Maintainer: YOUR NAME <your@email.com>

_npmname=tobby

pkgname=tobby
pkgver=0.1.0
pkgrel=1
pkgdesc="The Terminal Obby — a modern IRC client for the terminal"
arch=('any')
url="https://github.com/OWNER/tobby"
license=('MIT')
# nodejs runs the bin/tobby.js shim; bun-bin runs the actual bundled app
depends=('nodejs' 'bun-bin')
makedepends=('npm' 'jq')
provides=('tobby')
conflicts=('tobby-bin')
# Fetch the tarball directly from the npm registry
source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
# Prevent makepkg from trying to extract the tarball — npm handles it
noextract=("${_npmname}-${pkgver}.tgz")
# Run `makepkg -g` to get the real hash and replace SKIP
sha256sums=('SKIP')
options=('!strip')

package() {
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        "${srcdir}/${_npmname}-${pkgver}.tgz"

    # Fix directory permissions (npm sometimes creates 700 dirs)
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Strip npm-embedded absolute build paths from package.json files
    find "${pkgdir}" -type f -name package.json -exec sed -i '/_where/d' {} +

    local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmname}/package.json"
    local tmppackage
    tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' \
        "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"

    install -Dm644 "${srcdir}/package/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
