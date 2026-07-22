# Maintainer: InubashiriLix <xl996981 at gmail dot com>

pkgname=splayer-next-git
pkgver=1.0.0.r621.g4f9a95d
pkgrel=1
pkgdesc='Electron music player with rich lyric and audio format support (development version)'
arch=('x86_64')
url='https://github.com/SPlayer-Dev/SPlayer-Next'
license=('AGPL-3.0-only')

provides=("splayer-next=${pkgver}")
conflicts=('splayer-next' 'splayer-next-bin')

depends=(
    'alsa-lib'
    'electron41>=41.6.1'
    'ffmpeg'
    'glibc'
    'hicolor-icon-theme'
)
optdepends=('xdg-utils: opening external links')
makedepends=(
    'clang'
    'git'
    'node-gyp'
    'nodejs>=22.19.0'
    'pnpm>=10'
    'python'
    'rust'
)

# The Rust workspace already enables LLVM LTO.  makepkg's GCC LTO flags produce
# static C/C++ archives that rustc leaves unresolved in the final N-API module.
# Native modules must be stripped, but separate debug packages are prohibitively large.
options=('!debug' '!lto')

_source='SPlayer-Next-git'
_electron_headers_version='41.6.1'

source=(
    "${_source}::git+${url}.git#branch=dev"
    "electron-v${_electron_headers_version}-headers.tar.gz::https://electronjs.org/headers/v${_electron_headers_version}/node-v${_electron_headers_version}-headers.tar.gz"
    'ffmpeg_audio_sys-0.1.2.crate::https://static.crates.io/crates/ffmpeg_audio_sys/ffmpeg_audio_sys-0.1.2.crate'
    'splayer-next.sh'
    'top.imsyy.splayer_next.desktop'
    'system-electron.patch'
    'ffmpeg-system.patch'
)
sha256sums=(
    'SKIP'
    '562ea6ffdae060941d4660e2101e5e086c3bacd26a0c211eb18b3d280b0f62a7'
    'e20a89429144d2a75ce83bfb8883d19d1f5fe339b2cddd0d5f291cd030487b4f'
    '713118402f5168736eb9647138ba8bb14a9deea67ad2c236a21b6cd371b3304a'
    'affb35df91f7cb0c2d32a855d097047bd9109402a3cdb203e063cbfe88db5e3e'
    '0728d01dfc7e9272330740295b62296f069768edb9727c24c447ee2314f11ef8'
    '5599df118fc4658b1865e20cfd8ee2358950428597e6117dc0e410d2d5cc6032'
)

pkgver() {
    cd "$_source"

    local upstream_version
    upstream_version=$(node -p "require('./package.json').version")

    printf '%s.r%s.g%s' \
        "$upstream_version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

_setup_build_env() {
    export PNPM_HOME="$srcdir/pnpm-home"
    export npm_config_cache="$srcdir/npm-cache"
    export XDG_CACHE_HOME="$srcdir/xdg-cache"
    export ELECTRON_CACHE="$srcdir/electron-cache"
    export ELECTRON_BUILDER_CACHE="$srcdir/electron-builder-cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export FFMPEG_MODE=system
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR="$srcdir/cargo-target"
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"

    mkdir -p \
        "$PNPM_HOME" \
        "$npm_config_cache" \
        "$XDG_CACHE_HOME" \
        "$ELECTRON_CACHE" \
        "$ELECTRON_BUILDER_CACHE" \
        "$CARGO_HOME" \
        "$CARGO_TARGET_DIR"
}

prepare() {
    _setup_build_env

    cd "$_source"

    patch -Np1 -i "$srcdir/system-electron.patch"
    patch -d "$srcdir/ffmpeg_audio_sys-0.1.2" -Np1 -i "$srcdir/ffmpeg-system.patch"
    pnpm install \
        --frozen-lockfile \
        --ignore-scripts \
        --store-dir "$srcdir/pnpm-store"
}

build() {
    _setup_build_env

    cd "$_source"

    local electron_version
    electron_version=$(</usr/lib/electron41/version)
    electron_version=${electron_version#v}

    # The checked Electron headers set the correct native-module ABI without a download hook.
    pushd node_modules/better-sqlite3
    node-gyp rebuild \
        --release \
        --nodedir="$srcdir/node_headers"
    popd

    pnpm build:native

    # Linux permits unresolved symbols in shared libraries.  Fail the build here
    # instead of shipping a module that only breaks when Electron loads it.
    if nm -D --undefined-only native/audio-engine/audio-engine.node |
        grep -Eq 'signalsmith_stretch_|aws_lc_[0-9_]+_'; then
        printf '%s\n' 'audio-engine.node contains unresolved bundled-library symbols' >&2
        return 1
    fi

    SKIP_NATIVE_BUILD=true pnpm build
    pnpm exec electron-builder \
        --linux \
        --x64 \
        --dir \
        --publish never \
        --config electron-builder.config.ts \
        -c.electronDist=/usr/lib/electron41 \
        -c.electronVersion="$electron_version"

    test -f dist/linux-unpacked/resources/app.asar
    test -d dist/linux-unpacked/resources/app.asar.unpacked
    test -f dist/linux-unpacked/resources/native/audio-engine.node
    test -f dist/linux-unpacked/resources/native/media-ctrl.node
}

check() {
    cd "$_source"

    # Load every native module with the exact Electron major used at runtime.
    env ELECTRON_RUN_AS_NODE=1 /usr/lib/electron41/electron -e \
        "require(process.argv[1])" \
        "$PWD/native/audio-engine/audio-engine.node"
    env ELECTRON_RUN_AS_NODE=1 /usr/lib/electron41/electron -e \
        "require(process.argv[1])" \
        "$PWD/native/media-ctrl/media-ctrl.node"
    env ELECTRON_RUN_AS_NODE=1 /usr/lib/electron41/electron -e \
        "const Database=require(process.argv[1]); const db=new Database(':memory:'); if (db.prepare('select 41+1 as value').get().value !== 42) process.exit(1); db.close()" \
        "$PWD/node_modules/better-sqlite3"
}

package() {
    cd "$_source"

    install -Dm644 \
        dist/linux-unpacked/resources/app.asar \
        "$pkgdir/usr/lib/splayer-next/app.asar"
    cp -a --no-preserve=ownership \
        dist/linux-unpacked/resources/app.asar.unpacked \
        "$pkgdir/usr/lib/splayer-next/"
    cp -a --no-preserve=ownership \
        dist/linux-unpacked/resources/native \
        "$pkgdir/usr/lib/splayer-next/"

    # electron-builder unpacks entire native packages; only Linux runtime files are useful.
    rm -rf \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/font-list/libs/darwin" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/font-list/libs/win32" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/deps" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/src" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/build/deps" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/build/Release/obj" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/build/Release/obj.target" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/build/Release/sqlite3.a" \
        "$pkgdir/usr/lib/splayer-next/app.asar.unpacked/node_modules/better-sqlite3/build/Release/test_extension.node"

    install -Dm755 \
        "$srcdir/splayer-next.sh" \
        "$pkgdir/usr/bin/splayer-next"
    install -Dm644 \
        "$srcdir/top.imsyy.splayer_next.desktop" \
        "$pkgdir/usr/share/applications/top.imsyy.splayer_next.desktop"
    install -Dm644 \
        public/icons/favicon-512x512.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/splayer-next.png"
    install -Dm644 \
        LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
