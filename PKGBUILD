# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli-bin
_pkgname=deepcode-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal AI coding assistant optimized for the deepseek-v4 model (deep thinking, agent skills, MCP)"
# The 0.4.0 npm release keeps sharp external, including native platform addons.
arch=('x86_64' 'aarch64')
url="https://github.com/lessweb/deepcode-cli"
license=('MIT')
# npm resolves sharp and its native libvips dependencies into the module tree.
depends=('nodejs>=22' 'glibc' 'gcc-libs')
makedepends=('npm')
provides=('deepcode' "${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_scope='@vegamo'
# Prebuilt official release artifact: the npm registry tarball (upstream
# ships dist/cli.js bundled from TypeScript). Feed it to npm verbatim, so
# leave it unextracted; the ::-rename embeds pkgver so makepkg never reuses
# a stale cached tarball across version bumps.
#
# The LICENSE keeps moving inside the npm tarball across releases: 0.1.33 had
# it at the module root, 0.1.34 under dist/, 0.2.0 dropped it entirely, 0.3.1
# put it back at the root. Pull the MIT text from the matching git tag instead
# so package() does not have to chase that (verified identical to the copy
# 0.3.1 bundles).
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_scope}/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/lessweb/deepcode-cli/v${pkgver}/LICENSE")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('efd49f49d4bb099ce17e2840fafa21008b9f9a9bfaf1420030e96f9828ecd23e'
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
