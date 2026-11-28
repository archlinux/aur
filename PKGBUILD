# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=wirecat-tg-cli
_pkgname=@wirecat/tg-cli
pkgver=0.138.0
pkgrel=1
pkgdesc='Personal-account Telegram CLI and MCP server for agents'
arch=('x86_64' 'aarch64')
url='https://wirecat.dev/en/docs/tg'
license=('Apache-2.0')
# Native addons use the installed Node headers; rebuild after a Node ABI upgrade.
depends=('nodejs>=22.19.0' 'glibc' 'libgcc' 'libstdc++.so')
makedepends=('pnpm>=11' 'npm' 'node-gyp' 'python')
checkdepends=('git')
optdepends=('ffmpeg: audio and video conversion')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/WireCatLabs/tg-cli/archive/refs/tags/v${pkgver}.tar.gz"
        'wirecat-tg')
sha256sums=('1711b35dbc8b0b9cf88fe2bfbdec95d0a676bb8bafaaf28800e1a6d2c3b529a4'
            '2b43fca302985ce034b1be423cf1524297d272a29f2c401e9695577c7a0b94fb')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_pkgname}/latest" |
        python3 -c 'import json, sys; print(json.load(sys.stdin)["version"])'
}

# Use the packaged pnpm instead of downloading a second package-manager runtime.
_pnpm() {
    PNPM_CONFIG_MANAGE_PACKAGE_MANAGER_VERSIONS=false \
    PNPM_CONFIG_PACKAGE_MANAGER_STRICT=false pnpm "$@"
}

prepare() {
    cd "tg-cli-${pkgver}"
    _pnpm install --frozen-lockfile --ignore-scripts --config.engine-strict=true --store-dir "${srcdir}/pnpm-store"
}

build() {
    cd "tg-cli-${pkgver}"
    # Native install hooks are disabled; compile against the packaged Node headers.
    local addon
    for addon in node_modules/.pnpm/better-sqlite3@*/node_modules/better-sqlite3; do
        (cd "$addon" && npm_config_nodedir=/usr node-gyp rebuild --release --devdir "${srcdir}/node-gyp")
        node -e 'const Database = require(process.argv[1]); new Database(":memory:").close()' "${PWD}/${addon}"
        install -Dm755 "$addon/build/Release/better_sqlite3.node" \
            "${srcdir}/native-addons/${addon}/build/Release/better_sqlite3.node"
    done
    _pnpm run build
    npm pack --ignore-scripts --pack-destination "$srcdir"
}

check() {
    cd "tg-cli-${pkgver}"
    _pnpm test
}

package() {
    cd "tg-cli-${pkgver}"
    _pnpm prune --prod --ignore-scripts
    local addon
    for addon in node_modules/.pnpm/better-sqlite3@*/node_modules/better-sqlite3; do
        install -Dm755 "${srcdir}/native-addons/${addon}/build/Release/better_sqlite3.node" \
            "$addon/build/Release/better_sqlite3.node"
        node -e 'const Database = require(process.argv[1]); new Database(":memory:").close()' "${PWD}/${addon}"
    done
    local dest="${pkgdir}/usr/lib/${pkgname}"
    install -d "$dest"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tgz" -C "$dest" --strip-components=1
    cp -r --no-preserve=ownership node_modules "$dest/"
    # Generated module labels retain the bundler's absolute build directory.
    find "$dest/dist" -type f -name '*.js' -exec \
        sed -i "s|^// common-js-names:${srcdir}/|// common-js-names:|" {} +

    local platform
    case "$CARCH" in
        x86_64) platform=x64 ;;
        aarch64) platform=arm64 ;;
    esac
    local dir
    for dir in "$dest"/node_modules/.pnpm/@wirecat+cli-core-sqlite@*/node_modules/@wirecat/cli-core-sqlite/lib/*; do
        [[ ${dir##*/} == "linux-${platform}-gnu" ]] || rm -rf "$dir"
    done
    for dir in "$dest"/node_modules/.pnpm/@wirecat+cli-core-onnx@*/node_modules/@wirecat/cli-core-onnx/native/*; do
        [[ -d $dir && ${dir##*/} != "linux-${platform}" ]] && rm -rf "$dir"
    done
    rm -rf "$dest/node_modules/.bin"
    rm -f "$dest/node_modules/.modules.yaml" "$dest/node_modules/.pnpm-workspace-state-v1.json"
    for dir in "$dest"/node_modules/.pnpm/better-sqlite3@*/node_modules/better-sqlite3; do
        find "$dir/build" -type f ! -name '*.node' -delete
        find "$dir/build" -type d -empty -delete
        rm -rf "$dir/deps" "$dir/src"
    done
    find "$dest" -type f -exec chmod 644 {} +
    find "$dest" -type d -exec chmod 755 {} +
    find "$dest" -type f \( -name '*.node' -o -name '*.so*' \) -exec chmod 755 {} +
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/wirecat-tg" "${pkgdir}/usr/bin/tg"
    ln -s tg "${pkgdir}/usr/bin/wcat-tg"
    install -Dm644 THIRD_PARTY_NOTICES "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
