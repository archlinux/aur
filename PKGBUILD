# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli
pkgver=0.2.0
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
sha256sums=('db1412bdbfab812ba6b77dc82c84ecec2f0de35dc68cb81c25915733bdcbb236')

prepare() {
    cd "${pkgname}-${pkgver}"

    # 0.2.0 added `generate` to the bundle chain. It stamps the CLI's version
    # string from a shell-out to `git rev-parse`, with the package.json read
    # sharing the same try block — so building from a release tarball (no git)
    # leaves CLI_VERSION="UNKNOWN", and building inside a checkout picks up
    # whatever repo happens to enclose $srcdir (here: this AUR repo's own
    # commit). Neither is right. Read the version unconditionally and leave the
    # commit as the "N/A" upstream already uses when git is unavailable.
    node -e '
      const fs = require("fs");
      const f = "scripts/generate-git-commit-info.js";
      const src = fs.readFileSync(f, "utf8");
      const re = /try \{[\s\S]*?cliVersion = pkg\.version \?\? "UNKNOWN";\n\} catch \{[\s\S]*?\}/;
      if (!re.test(src)) {
        console.error("ERROR: version-stamp block not found in " + f + "; upstream changed it");
        process.exit(1);
      }
      fs.writeFileSync(f, src.replace(re,
        "cliVersion = JSON.parse(readFileSync(join(root, \"packages\", \"cli\", \"package.json\"), \"utf-8\")).version ?? \"UNKNOWN\";"));
    '
}

build() {
    cd "${pkgname}-${pkgver}"

    # Keep all npm state inside $srcdir so the build never touches ~/.npm.
    # --ignore-scripts: no dependency needs a build step (esbuild ships its
    # platform binary as an optional dep, zero native modules), and it skips
    # the package's own `prepare: husky` hook, which would fail in this
    # non-git tarball checkout.
    #
    # `npm install`, not `npm ci`: upstream's 0.2.0 package-lock.json was
    # generated on macOS/arm64 and carries only @esbuild/darwin-arm64, so
    # `npm ci` aborts on Linux ("Missing: @esbuild/linux-x64 from lock file").
    # install resolves the platform binary this host actually needs.
    npm install --ignore-scripts --cache "${srcdir}/npm-cache" --no-audit --no-fund

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
    # bin = cli.js (packages/cli declares bin.deepcode = ./dist/cli.js).
    local _moddir="${pkgdir}/usr/lib/node_modules/@vegamo/${pkgname}"
    install -Dm755 packages/cli/dist/cli.js "${_moddir}/cli.js"
    cp -r packages/cli/dist/chunks packages/cli/dist/templates \
        packages/cli/dist/bundled "${_moddir}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "../lib/node_modules/@vegamo/${pkgname}/cli.js" \
        "${pkgdir}/usr/bin/deepcode"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
