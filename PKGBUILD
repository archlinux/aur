# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli-bin
_pkgname=deepcode-cli
pkgver=0.1.31
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
sha256sums=('ca5b7d00d3576759f2dc899e80c50db01d75190908694b22c0411a0d244b99cd')

package() {
    # npm resolves the dependency tree into the module's own node_modules and
    # creates a relative usr/bin/deepcode -> ../lib/node_modules/... symlink.
    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        --no-audit --no-fund --omit=dev \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dm644 \
        "${pkgdir}/usr/lib/node_modules/${_scope}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
