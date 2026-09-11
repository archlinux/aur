# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepcode-cli
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal AI coding assistant optimized for the deepseek-v4 model (deep thinking, agent skills, MCP)"
# 0.4.0 keeps sharp external to the JS bundle; its native addon is platform-specific.
arch=('x86_64' 'aarch64')
url="https://github.com/lessweb/deepcode-cli"
license=('MIT')
depends=('nodejs>=22' 'glibc' 'gcc-libs')
makedepends=('npm')
provides=('deepcode')
conflicts=('deepcode-cli-bin')
# sharp ships prebuilt native dependencies, not useful split debug sources.
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f942df328dc49971bdfb54f77fdfea9f1d5bbc7fc0ae86012282222cabe30af6')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Still needed in 0.4.0: upstream reads version in the same try block as
    # git rev-parse. Release tarballs must not stamp UNKNOWN or this AUR commit.
    node <<'JS'
const fs = require('node:fs');
const f = 'scripts/generate-git-commit-info.js';
const src = fs.readFileSync(f, 'utf8');
const re = /try \{[\s\S]*?cliVersion = pkg\.version \?\? "UNKNOWN";\n\} catch \{[\s\S]*?\}/;
if (!re.test(src)) throw new Error('upstream version-stamp block changed');
fs.writeFileSync(f, src.replace(re, 'cliVersion = JSON.parse(readFileSync(join(root, "packages", "cli", "package.json"), "utf-8")).version ?? "UNKNOWN";'));
JS
}

build() {
    cd "${pkgname}-${pkgver}"
    # Resolve the host's esbuild optional binary; the upstream lockfile has
    # historically omitted non-macOS platform packages. Keep caches local.
    npm install --ignore-scripts --cache "${srcdir}/npm-cache" --no-audit --no-fund
    npm run bundle

    # Mirror the official release's only external dependency. Install it into a
    # separate production tree, pinned to the exact sharp resolved by this build.
    node - "${srcdir}/runtime" <<'JS'
const fs = require('node:fs');
const path = require('node:path');
const out = process.argv[2];
const cli = JSON.parse(fs.readFileSync('packages/cli/package.json', 'utf8'));
const sharp = JSON.parse(fs.readFileSync('node_modules/sharp/package.json', 'utf8'));
fs.mkdirSync(out, {recursive: true});
fs.writeFileSync(path.join(out, 'package.json'), JSON.stringify({name: cli.name, version: cli.version, type: 'module', private: true, dependencies: {sharp: sharp.version}}, null, 2) + '\n');
JS
    npm install --prefix "${srcdir}/runtime" --omit=dev --ignore-scripts \
        --cache "${srcdir}/npm-cache" --no-audit --no-fund
}

package() {
    cd "${pkgname}-${pkgver}"
    local _moddir="${pkgdir}/usr/lib/node_modules/@vegamo/${pkgname}"
    install -Dm755 packages/cli/dist/cli.js "${_moddir}/cli.js"
    cp -r packages/cli/dist/chunks packages/cli/dist/templates \
        packages/cli/dist/bundled "${_moddir}/"
    cp -a --no-preserve=ownership "${srcdir}/runtime/node_modules" "${_moddir}/"
    install -Dm644 "${srcdir}/runtime/package.json" "${_moddir}/package.json"
    install -d "${pkgdir}/usr/bin"
    ln -s "../lib/node_modules/@vegamo/${pkgname}/cli.js" "${pkgdir}/usr/bin/deepcode"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
