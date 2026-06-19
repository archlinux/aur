# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli
pkgver=0.1.31
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
sha256sums=('d146212a5a4fac15bc19252adfb5c7303fd7b81e93be7ea07875062bcd550a04')

build() {
    cd "${pkgname}-${pkgver}"

    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    # --ignore-scripts: no dependency needs a build step (esbuild ships its
    # platform binary as an optional dep, zero native modules), and it skips
    # the package's own `prepare: husky` hook, which would fail in this
    # non-git tarball checkout.
    npm ci --ignore-scripts --cache "${srcdir}/npm-cache" --no-audit --no-fund

    # `bundle` is the real build (esbuild src/cli.tsx -> dist/cli.js + copy
    # bundled skill assets); we skip the `build` wrapper because it also runs
    # typecheck/eslint/prettier gates that aren't a packager's concern.
    npm run bundle

    # Re-pack the freshly built tree into the canonical release tarball
    # (honours package.json "files"); --ignore-scripts avoids re-running the
    # prepack build we just did.
    npm pack --ignore-scripts --cache "${srcdir}/npm-cache"
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install our self-built tarball; npm resolves the production dependency
    # tree (served from the shared cache, no re-download) into the module's
    # node_modules and creates a relative usr/bin/deepcode symlink.
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        --no-audit --no-fund --omit=dev \
        "vegamo-deepcode-cli-${pkgver}.tgz"

    install -Dm644 \
        "${pkgdir}/usr/lib/node_modules/@vegamo/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
