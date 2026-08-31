# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=graft
pkgver=0.16.0
pkgrel=2
pkgdesc="Open-source context layer for large codebases — turbocharge Claude Code, Cursor, Codex, Gemini & every coding agent"
arch=('x86_64')
url="https://github.com/NanoNets/Graft"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'node-gyp' 'python')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@nanonets/graft/-/graft-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('84771e6417e41a46e76f2cb3886ddeb3814d9efa7ebc15bd7aba41f342b2b9c4')

_staged_root="staging/lib/node_modules/@nanonets/graft"

latestver() {
    curl -fsSL 'https://registry.npmjs.org/@nanonets/graft/latest' | jq -r '.version'
}

build() {
    npm install --cache "${srcdir}/npm-cache" \
        --prefix="${srcdir}/staging" \
        --global \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    local node_root="${srcdir}/${_staged_root}"

    # npm >=12 refuses to run dependency install scripts, so node-gyp-build never
    # compiles a grammar that ships no prebuild for this platform. It only warns,
    # so the missing binding surfaces at runtime as a CLI that cannot start.
    ( cd "${node_root}/node_modules/tree-sitter-kotlin" &&
      npm_config_nodedir=/usr node-gyp rebuild --release &&
      find build -mindepth 1 -maxdepth 1 ! -name Release -exec rm -rf {} + &&
      find build/Release -mindepth 1 ! -name '*.node' -exec rm -rf {} + )

    # graft imports every grammar at module scope, so one unloadable binding kills
    # the whole CLI. Prove each one loads instead of trusting npm's script policy.
    node -e '
      const { createRequire } = require("node:module");
      const root = process.argv[1];
      const req = createRequire(root + "/");
      const native = Object.keys(require(root + "/package.json").dependencies)
          .filter((d) => d.startsWith("tree-sitter") && d !== "tree-sitter-wasm");
      for (const dep of native) req(dep);
      console.log("native bindings loaded: " + native.join(" "));
    ' "${node_root}"
}

package() {
    local node_root="${pkgdir}/usr/lib/node_modules/@nanonets/graft"

    install -dm755 "${pkgdir}/usr/lib/node_modules/@nanonets"
    cp -a "${srcdir}/${_staged_root}" "${node_root}"

    # Prebuilt bindings for every platform upstream supports; keep only ours.
    local prebuilds
    while IFS= read -r -d '' prebuilds; do
        find "${prebuilds}" -mindepth 1 -maxdepth 1 ! -name 'linux-x64' -exec rm -rf {} +
    done < <(find "${node_root}" -type d -name prebuilds -print0)

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/node_modules/@nanonets/graft/dist/cli.js" "${pkgdir}/usr/bin/graft"

    # Clean npm metadata referencing $srcdir/$pkgdir
    find "${pkgdir}" -name package.json -print0 | xargs -0 sed -i "/_where/d"

    install -Dm644 "${node_root}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
