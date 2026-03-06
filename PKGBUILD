# Maintainer: YOUR NAME <your@email.com>

_npmname=@mattfillipe/tobby

pkgname=tobby
pkgver=0.2.12
pkgrel=1
pkgdesc="The Terminal Obby — a modern IRC client for the terminal"
arch=('any')
url="https://github.com/ObsidianIRC/tobby"
license=('MIT')
# nodejs runs the bin/tobby.js shim; bun runs the actual bundled app
depends=('nodejs' 'bun')
makedepends=('npm' 'jq')
provides=('tobby')
conflicts=('tobby-bin')
# Fetch the tarball directly from the npm registry
# Scoped packages use %40 for @ in the URL path
source=("mattfillipe-tobby-${pkgver}.tgz::https://registry.npmjs.org/@mattfillipe/tobby/-/tobby-${pkgver}.tgz")
noextract=("mattfillipe-tobby-${pkgver}.tgz")
sha256sums=('eabfa55066566e77e71246f0628200fcb406a1b4834ad8cb1599f783a99add2d')
options=('!strip')

package() {
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        "${srcdir}/mattfillipe-tobby-${pkgver}.tgz"

    # Fix directory permissions (npm sometimes creates 700 dirs)
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Strip npm-embedded absolute build paths from package.json files
    find "${pkgdir}" -type f -name package.json -exec sed -i '/_where/d' {} +

    local pkgjson="${pkgdir}/usr/lib/node_modules/@mattfillipe/tobby/package.json"
    local tmppackage
    tmppackage="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' \
        "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"

    install -Dm644 "${srcdir}/package/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
