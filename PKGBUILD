# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.22.2
pkgrel=2
pkgdesc="Headless browser automation CLI for AI agents"
arch=('any')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('bbdf08a19bdf817055d119b41e0b6e79096c632d3638fc79972f7668f71bb391')

package() {
    /usr/bin/npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Fix symlinks that point into pkgdir
    find "${pkgdir}/usr/bin" -type l | while read -r link; do
        local target
        target="$(readlink "$link")"
        if [[ "$target" == "${pkgdir}"* ]]; then
            ln -sfr "${pkgdir}/${target#"${pkgdir}"}" "$link"
        fi
    done

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
