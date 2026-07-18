# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli-bin
_pkgname=deepcode-cli
pkgver=0.1.34
pkgrel=1
pkgdesc="Terminal AI coding assistant optimized for the deepseek-v4 model (deep thinking, agent skills, MCP)"
arch=('any')
url="https://github.com/lessweb/deepcode-cli"
license=('MIT')
# engines.node is >=22; the published bundle keeps its runtime deps external
# (ink/react/openai/undici/zod/...), so they are resolved into the package
# tree at build time rather than depended on as Arch packages.
depends=('nodejs>=22')
makedepends=('npm')
provides=('deepcode' "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_scope='@vegamo'
# Prebuilt official release artifact: the npm registry tarball (upstream
# ships dist/cli.js bundled from TypeScript). Feed it to npm verbatim, so
# leave it unextracted; the ::-rename embeds pkgver so makepkg never reuses
# a stale cached tarball across version bumps.
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_scope}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('2d22f7727ae4b421794360b0b3747e182f5e0bda5370e5d7d52241ecdfe06454')

package() {
    # npm resolves the dependency tree into the module's own node_modules and
    # creates a relative usr/bin/deepcode -> ../lib/node_modules/... symlink.
    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        --no-audit --no-fund --omit=dev \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # LICENSE moved across publish layouts: 0.1.33 shipped it at the module
    # root, 0.1.34 keeps the dist/ prefix (dist/LICENSE). Take whichever exists.
    local _mod="${pkgdir}/usr/lib/node_modules/${_scope}/${_pkgname}"
    local _license="${_mod}/LICENSE"
    [[ -f "${_license}" ]] || _license="${_mod}/dist/LICENSE"
    install -Dm644 "${_license}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
