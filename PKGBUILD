# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli
pkgver=0.1.34
pkgrel=1
pkgdesc="Terminal AI coding assistant optimized for the deepseek-v4 model (deep thinking, agent skills, MCP)"
arch=('any')
url="https://github.com/lessweb/deepcode-cli"
license=('MIT')
# engines.node is >=22. Runtime deps (ink/react/openai/undici/zod/...) are
# kept external by esbuild (--packages=external) and resolved into the
# package tree at build time, so they aren't Arch depends.
depends=('nodejs>=22')
makedepends=('npm')
provides=('deepcode')
conflicts=('deepcode-cli-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fc08617e46443e5446bff22dd37e5841bec4a3fd3d23a95ff683cfc1516a521')

build() {
    cd "${pkgname}-${pkgver}"

    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    # --ignore-scripts: no dependency needs a build step (esbuild ships its
    # platform binary as an optional dep, zero native modules), and it skips
    # the package's own `prepare: husky` hook, which would fail in this
    # non-git tarball checkout.
    npm ci --ignore-scripts --cache "${srcdir}/npm-cache" --no-audit --no-fund

    # `bundle` is the real build. Since 0.1.33 upstream is an npm workspace
    # (workspaces=packages/*); the CLI lives in packages/cli and `bundle`
    # esbuilds it into a self-contained packages/cli/dist (cli.js + chunks/ +
    # templates/ + bundled/, every dep inlined — the published npm package has
    # dependencies:{} for the same reason). We skip the `build` wrapper because
    # it also runs typecheck/eslint/prettier gates that aren't a packager's
    # concern.
    npm run bundle
}

package() {
    cd "${pkgname}-${pkgver}"

    # dist/ is fully bundled (no runtime dependency tree to resolve), so install
    # it verbatim instead of round-tripping through npm pack / npm install --
    # mirrors the published tarball layout: dist contents at the module root,
    # bin = cli.js. `npm pack` at the workspace root no longer works (root
    # package.json has no name/version).
    local _moddir="${pkgdir}/usr/lib/node_modules/@vegamo/${pkgname}"
    install -Dm755 packages/cli/dist/cli.js "${_moddir}/cli.js"
    cp -r packages/cli/dist/chunks packages/cli/dist/templates \
        packages/cli/dist/bundled "${_moddir}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "../lib/node_modules/@vegamo/${pkgname}/cli.js" \
        "${pkgdir}/usr/bin/deepcode"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
