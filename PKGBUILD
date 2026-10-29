# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.41.0
pkgrel=1
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('682d11796d6dd39f010584f6e5e6a885f3d7bab3e6172ff26363477bcfc9515c')

package() {
    /usr/bin/npm install -g --ignore-scripts --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chmod 755 "${pkgdir}/usr/lib/node_modules/${pkgname}"/bin/agent-browser-*

    # Remove references to pkgdir/srcdir from package.json
    local tmppackage="$(mktemp)"
    local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
