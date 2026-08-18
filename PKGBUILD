# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli-bin
_pkgname=deepcode-cli
pkgver=0.2.1
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
#
# 0.2.0 stopped shipping a LICENSE inside the npm tarball altogether (0.1.33
# had it at the module root, 0.1.34 under dist/), so pull the MIT text the
# package.json still declares from the matching git tag instead.
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_scope}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/lessweb/deepcode-cli/v${pkgver}/LICENSE")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('fa0a78882b8f7ad47a030546e621680f8629c374917e49186df72adc5bff28cf'
            '7b1d5fa29a200220ca44b3355db5f1c7b91714fbbd76f42e7268104fa9efd380')

package() {
    # npm resolves the dependency tree into the module's own node_modules and
    # creates a relative usr/bin/deepcode -> ../lib/node_modules/... symlink.
    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        --no-audit --no-fund --omit=dev \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
