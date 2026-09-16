# Maintainer: xianhongtao <xianhongtao2022@outlook.com>
pkgname=mcmodding-mcp
pkgver=0.5.0
pkgrel=1
pkgdesc='MCP server for Minecraft Fabric and NeoForge modding documentation'
arch=('x86_64')
url='https://github.com/OGMatrix/mcmodding-mcp'
license=('MIT')
depends=('nodejs>=22.15.0' 'glibc' 'libgcc' 'libstdc++.so' 'libvips' 'glib2' 'sh')
makedepends=('node-gyp' 'python' 'pkgconf')
# Preserve upstream native libraries; do not generate a mostly vendored debug package.
options=('!strip' '!debug')
_pnpmver=10.30.0
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/OGMatrix/mcmodding-mcp/tar.gz/refs/tags/v${pkgver}"
        "pnpm-${_pnpmver}.tgz::https://registry.npmjs.org/pnpm/-/pnpm-${_pnpmver}.tgz"
        'onnxruntime-1.14.0-LICENSE::https://raw.githubusercontent.com/microsoft/onnxruntime/v1.14.0/LICENSE'
        'onnxruntime-1.14.0-ThirdPartyNotices.txt::https://raw.githubusercontent.com/microsoft/onnxruntime/v1.14.0/ThirdPartyNotices.txt'
        'xdg-cache.patch')
sha256sums=('e748b72ddbd1cd81faaf34a93a27abf1ad95d482de79cfb74af599e49d6f82d1'
            'fde3cebbd4ed0d6d140b1983743bf575cdd4b15e4d5e5b257425152dce5b1b6a'
            '2f07c72751aed99790b8a4869cf2311df85a860b22ded05fa22803587a48922c'
            'cc63920441c5681cfb1663caf1de1858349b517fc1bed9ca669a85bc526cd13e'
            '2d56098d3b4b3d99cc1d4bdfceec7f6e7a476f47f6e72d8aaa322ffc6fa73352')

# The dependency graph is pinned by checksum: this is upstream v0.5.0's
# pnpm-lock.yaml as shipped inside the sha256-pinned source tarball. See prepare().
_lockfile_sha256='4b0356ea956fcd537a06c3cadd43544320ac78783af9e133e1bfc693fecceb98'

_pnpm() {
    # Use upstream's pinned pnpm without a global npm install or user npm prefix.
    npm_config_cache="${srcdir}/npm-cache" \
        XDG_STATE_HOME="${srcdir}/pnpm-state" \
        node "${srcdir}/package/bin/pnpm.cjs" "$@" \
        --store-dir "${srcdir}/pnpm-store" \
        --cache-dir "${srcdir}/pnpm-cache"
}

prepare() {
    cd "${pkgname}-${pkgver}"
    # Refuse to build anything other than the pinned dependency graph.
    echo "${_lockfile_sha256}  pnpm-lock.yaml" | sha256sum -c -
    patch -Np1 -i "${srcdir}/xdg-cache.patch"
    # The v0.5.0 tag still carries 0.4.5 in these two metadata fields.
    sed -i "s/\"version\": \"0.4.5\"/\"version\": \"${pkgver}\"/" package.json
    sed -i "s/version: '0.4.5'/version: '${pkgver}'/" src/index.ts
    # Dependency downloads are not individual source=() entries: upstream's lockfile is
    # thousands of lines covering hundreds of transitive packages, and the Node.js packaging
    # guidelines expect the build to fetch them. The graph is checksum-pinned instead: the
    # lockfile ships inside the sha256-pinned source tarball, its own checksum is asserted
    # above, and --frozen-lockfile forbids rewriting it, so every resolved version and
    # integrity hash comes from that file. pnpm verifies each download against
    # resolution.integrity, and its verify-store-integrity and strict-store-pkg-content-check
    # options both default to enabled. Lifecycle hooks stay disabled: they would run
    # upstream scripts and database downloads.
    _pnpm install --frozen-lockfile --verify-store-integrity --ignore-scripts
}

build() {
    cd "${pkgname}-${pkgver}"
    node node_modules/typescript/bin/tsc --sourceMap false --declarationMap false
    # Recreate the production tree offline so dev tools cannot leak into the package and
    # no unverified download can occur.
    rm -rf node_modules
    CI=true _pnpm install --prod --offline --frozen-lockfile --verify-store-integrity --ignore-scripts
    (
        cd node_modules/better-sqlite3
        node-gyp rebuild --release --nodedir=/usr
    )
    (
        # transformers 2.x requires this older sharp; use Arch's libvips.
        cd node_modules/.pnpm/sharp@0.32.6/node_modules/sharp
        SHARP_FORCE_GLOBAL_LIBVIPS=1 node-gyp rebuild --release --nodedir=/usr
    )
}

check() {
    cd "${pkgname}-${pkgver}"
    # Both installs used --frozen-lockfile, so the pinned graph must be untouched.
    echo "${_lockfile_sha256}  pnpm-lock.yaml" | sha256sum -c -
    XDG_CACHE_HOME="${srcdir}/test-cache" node --input-type=module <<'JS'
import assert from 'node:assert/strict';
import path from 'node:path';
import { createRequire } from 'node:module';
import { createZstdDecompress } from 'node:zlib';
import Database from 'better-sqlite3';
import sharp from 'sharp';
import { pipeline, env } from '@xenova/transformers';
import './dist/indexer/embeddings.js';
const require = createRequire(import.meta.url);
const oldSharp = require('./node_modules/.pnpm/sharp@0.32.6/node_modules/sharp');
const db = new Database(':memory:');
assert.equal(db.prepare('SELECT 42 AS n').get().n, 42);
db.close();
assert.equal(typeof pipeline, 'function');
assert.equal(typeof createZstdDecompress, 'function');
assert.equal(env.cacheDir, path.join(process.env.XDG_CACHE_HOME, 'mcmodding-mcp', 'transformers'));
for (const image of [sharp, oldSharp]) {
    const png = await image({create: {width: 1, height: 1, channels: 3,
        background: 'white'}}).png().toBuffer();
    assert.ok(png.length > 0);
}
JS
}

package() {
    cd "${pkgname}-${pkgver}"
    install -d "${pkgdir}/usr/lib/${pkgname}"
    # Break store deduplication hardlinks while retaining relative symlinks.
    cp -a --no-preserve=ownership,links dist node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"

    # onnxruntime-node bundles several operating systems and CPU architectures.
    local _onnx="${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/onnxruntime-node@1.14.0/node_modules/onnxruntime-node/bin/napi-v3"
    find "$_onnx" -mindepth 1 -maxdepth 1 ! -name linux -exec rm -rf -- {} +
    find "$_onnx/linux" -mindepth 1 -maxdepth 1 ! -name x64 -exec rm -rf -- {} +
    local _prebuild
    while IFS= read -r -d '' _prebuild; do
        find "$_prebuild" -mindepth 1 -maxdepth 1 ! -name linux-x64 -exec rm -rf -- {} +
    done < <(find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name prebuilds -print0)
    # Keep compiled modules and upstream licenses, discard build intermediates.
    local _mod
    for _mod in better-sqlite3@12.10.0/node_modules/better-sqlite3 sharp@0.32.6/node_modules/sharp; do
        rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/${_mod}/build/Release/obj.target"
        rm -f "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/${_mod}/build/Release/test_extension.node"
        find "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/${_mod}/build" \
            -type f ! -name '*.node' -delete
        find "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/${_mod}/build" \
            -type d -empty -delete
    done
    # node-addon-api is a header-only build dependency, but gyp resolves its placeholder
    # target through pnpm's store paths and writes leftovers outside build/: mangled
    # node-addon-api@* directories holding only gyp output, and an empty static archive
    # whose ar timestamps differ between builds. The real package is kept at
    # .pnpm/node-addon-api@*, which this exclusion preserves.
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name 'node-addon-api@*' \
        ! -path '*/node_modules/.pnpm/node-addon-api@*' -exec rm -rf -- {} +
    # pnpm's installer metadata contains absolute paths to the build store.
    rm -f "${pkgdir}/usr/lib/${pkgname}/node_modules/.modules.yaml" \
          "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm-workspace-state-v1.json"
    # These dependency build-tool shims embed NODE_PATH from the build directory.
    # The application invokes JS modules directly, not these private CLI shims.
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -name .bin \
        -prune -exec rm -rf -- {} +
    # This nested CLI is private, so its man pages do not belong in /usr/lib.
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/.pnpm/protobufjs@6.11.4/node_modules/protobufjs/cli/node_modules/marked/man"
    find "${pkgdir}/usr/lib/${pkgname}/node_modules" -type d -empty -delete

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mcmodding-mcp" <<'WRAPPER'
#!/bin/sh
exec /usr/bin/node /usr/lib/mcmodding-mcp/dist/index.js "$@"
WRAPPER
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/onnxruntime-1.14.0-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/onnxruntime-LICENSE"
    install -Dm644 "${srcdir}/onnxruntime-1.14.0-ThirdPartyNotices.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/onnxruntime-ThirdPartyNotices.txt"
    install -Dm644 node_modules/.pnpm/@img+sharp-libvips-linux-x64@1.2.4/node_modules/@img/sharp-libvips-linux-x64/README.md \
        "${pkgdir}/usr/share/licenses/${pkgname}/sharp-libvips-licensing.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
