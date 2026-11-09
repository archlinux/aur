# Maintainer: Ben Leynen <leynenben@gmail.com>

pkgname=strata-app
_pkgname=strata
_binaryname=strata-desktop
pkgdesc="Strata Desktop - Local inference engine and GUI for frontier AI models"
pkgver=0.2.13
pkgrel=1
arch=('x86_64')
url="https://github.com/Niko1221/Strata"
license=('MIT')
# the bundled CPython, its wheels and the harness's prebuilt node addons are
# shipped as upstream stages them: stripping or dropping static libs would
# change files that upstream's bundle manifests record by digest.
# !lto: makepkg's -flto=auto turns the C objects of the ring crate into GCC
# LTO bytecode, which rust-lld can't link (undefined ring_core_* symbols);
# cargo's own lto = true from Cargo.toml still applies
options=('!strip' '!debug' 'staticlibs' '!lto')
depends=(
    'gcc-libs'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'webkit2gtk-4.1'
)
# no nodejs/npm/corepack: the pinned Node below provides all three
makedepends=(
    'cargo'
    'git'
    'python'
)
optdepends=(
    'nvidia-utils: GPU detection for the NVIDIA (CUDA) engine'
    'rocminfo: GPU detection for the AMD (HIP) engine'
)
conflicts=("${pkgname}-bin")

# Upstream pins, written by ./update-pins.sh from Strata's source at the
# release tag (run by `make sources`); the checksums are upstream's
# recorded digests.
#
# DeepSeek Harness commit staged into the app, from
# apps/host/server/agent/README.md and preset.mjs
_harness_commit=571902028a75c64c1d767f4ae5fd099485f0ddf0
# standalone CPython, from PBS_RELEASE / PYTHON_VERSION / PYTHON_PINS in
# packaging/package_terminal.py
_pbs_release=20261009
_python_version=3.12.15
_pbs_sha256=5864001bf969db329fadc2b654c4878c6027d170c6bd77e28f88666260bcaf63
# Node, from STRATA_NODE_VERSION / digest_for in
# apps/desktop/scripts/fetch-node.sh at the release tag. The app runs its host
# and the harness on it, and the harness's native addons (node-pty, koffi, ...)
# are compiled for the Node that builds them, so the same Node is used for the
# build and shipped as the runtime: the addon ABI always matches, a system
# nodejs upgrade can't break the app, and it's the version upstream tests
_node_version=24.12.0
_node_sha256=6159227e0af7d7c3c6bb2fa900452b04a6cb8841a702a79acc613209d70b04d0
# makepkg's checksums (a git archive of the ref) of the two git sources, which
# have no upstream digest; they make a moved tag fail the build
_src_sha256=87ba613c244b597916c2560ed147ff3ab18a2b94f22d8a940b2ed599e0720b88
_harness_sha256=0828e92122ddbae364d23b85b76ca24dd83de726734d43845a4c1b2c42f399c2

_pbs_file="cpython-${_python_version}_${_pbs_release}-x86_64-unknown-linux-gnu-install_only.tar.gz"
_node_dir="node-v${_node_version}-linux-x64"

source=(
    "${pkgname}-src::git+${url}.git#tag=v${pkgver}"
    "${pkgname}-harness::git+https://github.com/deepseek-ai/deepseek-harness.git#commit=${_harness_commit}"
    "${_pbs_file}::https://github.com/astral-sh/python-build-standalone/releases/download/${_pbs_release}/cpython-${_python_version}%2B${_pbs_release}-x86_64-unknown-linux-gnu-install_only.tar.gz"
    "https://nodejs.org/dist/v${_node_version}/${_node_dir}.tar.gz"
    "${_binaryname}.desktop"
    "disable-app-updater.patch"
)
# package_terminal.py verifies and unpacks the interpreter itself
noextract=("${_pbs_file}")
# not maintained with updpkgsums: the pinned ones come from update-pins.sh
sha256sums=("${_src_sha256}"
            "${_harness_sha256}"
            "${_pbs_sha256}"
            "${_node_sha256}"
            'bccf986eb5de114e7ae8faa9917116d932b87be578cd5e165888d393c27eee1b'
            '1041357d7d22ca52363b09e7061c18a58bb6e0516d6d65e5d3e956b0e243a5ca')

_env() {
    export PATH="${srcdir}/${_node_dir}/bin:${PATH}"
    export CARGO_HOME="${srcdir}/cargo-home"
    export npm_config_cache="${srcdir}/npm-cache"
    export COREPACK_HOME="${srcdir}/corepack-home"
    export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
    export npm_config_store_dir="${srcdir}/pnpm-store"
}

prepare() {
    _env

    cd "${srcdir}/${pkgname}-src"
    # the in-app updater would try to replace /usr/bin/strata-desktop with the
    # release AppImage; point users to pacman instead
    patch -Np1 -i "${srcdir}/disable-app-updater.patch"

    npm ci --prefix apps/host
    npm ci --prefix apps/desktop
    cargo fetch --locked --manifest-path apps/desktop/src-tauri/Cargo.toml

    cd "${srcdir}/${pkgname}-harness"
    corepack pnpm install --frozen-lockfile
}

build() {
    _env
    local _src="${srcdir}/${pkgname}-src"

    # DeepSeek Harness: built, then staged by upstream's script (pnpm deploy
    # --prod, pruned, booted once as a check) into resources/harness
    cd "${srcdir}/${pkgname}-harness"
    corepack pnpm run build:artifacts
    node "${_src}/apps/desktop/scripts/stage-harness.mjs" --src "${srcdir}/${pkgname}-harness"

    # Control: upstream's Terminal bundle (pinned CPython plus hash-locked
    # wheels), staged into resources/control
    cd "${_src}"
    rm -rf "${srcdir}/control-out"
    python packaging/package_terminal.py --out "${srcdir}/control-out" --cache "${srcdir}"
    python apps/desktop/scripts/stage-control.py --archive "${srcdir}"/control-out/strata-terminal-*.tar.gz

    # UI, then the Tauri shell; bundling is skipped, package() lays out the
    # resources the way upstream's deb/AppImage does
    npm --prefix apps/host run build
    cd apps/desktop
    npm exec -- tauri build --no-bundle -- --locked
}

package() {
    local _src="${srcdir}/${pkgname}-src"
    local _tauri="${_src}/apps/desktop/src-tauri"
    # the shell looks for its resources at ../lib/Strata relative to itself
    local _res="${pkgdir}/usr/lib/Strata"

    install -D -m0755 "${_tauri}/target/release/${_binaryname}" "${pkgdir}/usr/bin/${_binaryname}"

    install -d "${_res}/host"
    cp -a "${_src}/apps/host/dist" "${_src}/apps/host/server" "${_res}/host/"
    install -m0644 "${_src}/apps/host/package.json" "${_res}/host/package.json"
    cp -a "${_tauri}/resources/control" "${_tauri}/resources/harness" "${_res}/"
    rm -f "${_res}/control/.gitignore" "${_res}/harness/.gitignore"

    # the pinned Node the harness was built with (see _node_version)
    install -D -m0755 "${srcdir}/${_node_dir}/bin/node" "${_res}/node/node"

    install -D -m0644 "${srcdir}/${_binaryname}.desktop" "${pkgdir}/usr/share/applications/${_binaryname}.desktop"
    install -D -m0644 "${_tauri}/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_binaryname}.png"
    install -D -m0644 "${_tauri}/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_binaryname}.png"
    install -D -m0644 "${_tauri}/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_binaryname}.png"
    install -D -m0644 "${_tauri}/icons/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_binaryname}.png"
    install -D -m0644 "${_tauri}/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_binaryname}.png"

    install -D -m0644 "${_src}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m0644 "${srcdir}/${pkgname}-harness/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.deepseek-harness"
    install -D -m0644 "${srcdir}/${_node_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.nodejs"
}
