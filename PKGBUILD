# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgbase=openfang
pkgname=('openfang-cli' 'openfang-gui' 'openfang-whatsapp-gateway')
pkgver=0.5.1
pkgrel=1
pkgdesc='Open-source Agent Operating System built in Rust'
arch=('x86_64' 'aarch64')
url='https://openfang.sh'
license=('MIT' 'Apache-2.0')
makedepends=('rust' 'cargo' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'nodejs' 'npm' 'node-gyp' 'libvips' 'python' 'nodejs-addon-api')
source=(
    "${pkgbase}-${pkgver}.tar.gz::https://github.com/RightNow-AI/openfang/archive/refs/tags/v${pkgver}.tar.gz"
    "openfang.sysusers"
    "openfang.tmpfiles"
    "openfang.service"
    "openfang-desktop.desktop"
    "openfang-whatsapp-gateway.service"
)
b2sums=('4aca4f4fbe2faf2f0161d4d38c7777ae39cc93e3471a5691f5c4217083564a4d8a8265f0a11b2a3715e024027a73f73bef1807e04c0edb76c5eb6713703465b8'
        '0672ef1dd58e435156c01674d2e7ad6182d1f4fd7d94b50cd572f194977238765cf9bcf85076aac08b384df85e0b519b748f3a43a39f9250540d5444b3877033'
        '3857bf85c9486bb42f0c5c5efbb61b0f7ab64d25e88decf1cdb39114f5c3b6ba3ef38a9f12f67f8e6445768c4e6406baf4245bb25ecd850020ca425e1b63e1ac'
        'ee111fbee9536979f7f42acc28f11bf74fdeaea41eea2510de8d2d0cd851bbcf69d53238a373918d79d552e1bedba22a7b78408b42048ab5411b75ec13fce78b'
        '096115eee143253e2db2f1066f4a936e718e4d111ff80a6f0e4f5e3a38c74d50e1832d54f963ae771fcc9ec8cf685d3137ab5a43583fadc786c48a273ddd4b00'
        '889a955bf542b068f11bbb770354a1207988079971a93c7d218dd4601ba15224df659f3bb9e48e189da66a710b28f2616289d25b796faef5b2bdb2baa066e93e')

prepare() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Remap source paths so binaries don't embed $srcdir, cargo registry, or rustup paths.
    # Three separate flags: PKGBUILD src dir, Cargo registry cache, rustup toolchain stdlib.
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/build"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${CARGO_HOME:-${HOME}/.cargo}=/vendor"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${RUSTUP_HOME:-${HOME}/.rustup}=/rustup"
    # Remove -flto flags: GCC LTO bitcode in bundled sqlite3.c is
    # incompatible with rust-lld. Strip -flto=auto first, then bare -flto.
    CFLAGS="${CFLAGS//-flto=auto/}"
    CFLAGS="${CFLAGS//-flto/}"
    CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    CXXFLAGS="${CXXFLAGS//-flto/}"
    export CFLAGS CXXFLAGS
    export CARGO_PROFILE_RELEASE_LTO=false
    cargo build --frozen --release --bin openfang --bin openfang-desktop

    # Build Node.js whatsapp-gateway
    # 1) Install all packages without running scripts (sharp's build would fail)
    # 2) Copy system node-addon-api so gyp can write .target.mk into local writable path
    # 3) Run sharp's build.js directly with NODE_PATH=/usr/lib/node_modules so that
    #    require('node-gyp') resolves from the system global path (node-gyp depends on
    #    hoisted globals like nopt/tar that aren't self-contained when copied)
    local _gwdir="${srcdir}/${pkgbase}-${pkgver}/packages/whatsapp-gateway"
    cd "${_gwdir}"
    npm install --ignore-scripts --omit=dev
    cp -r /usr/lib/node_modules/node-addon-api "${_gwdir}/node_modules/node-addon-api"
    cd "${_gwdir}/node_modules/sharp"
    npm_config_build_from_source=true \
    SHARP_FORCE_GLOBAL_LIBVIPS=1 \
    NODE_PATH=/usr/lib/node_modules \
    node install/build.js
}

check() {
    cd "${pkgbase}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p openfang-types --lib 2>/dev/null || true
}

package_openfang-cli() {
    pkgdesc='openfang CLI — terminal interface for the openfang Agent OS'
    depends=('glibc' 'openssl' 'libgcc')
    optdepends=(
        'chromium: Browser Hand support'
        'yt-dlp: Clip Hand support'
        'ffmpeg: Clip Hand support'
    )
    provides=('openfang')
    backup=('etc/openfang/env')

    cd "${pkgbase}-${pkgver}"
    install -Dm755 "target/release/openfang" "${pkgdir}/usr/bin/openfang"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # systemd service
    install -Dm644 "${srcdir}/openfang.service" "${pkgdir}/usr/lib/systemd/system/openfang.service"

    # sysusers and tmpfiles
    install -Dm644 "${srcdir}/openfang.sysusers" "${pkgdir}/usr/lib/sysusers.d/openfang.conf"
    install -Dm644 "${srcdir}/openfang.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/openfang.conf"

    # default environment file (empty, user-editable)
    install -Dm644 /dev/null "${pkgdir}/etc/openfang/env"
}

package_openfang-gui() {
    pkgdesc='openfang GUI — desktop application for the openfang Agent OS'
    depends=('glibc' 'openssl' 'libgcc' 'webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme')
    optdepends=(
        'openfang-cli: CLI companion tool'
        'chromium: Browser Hand support'
        'yt-dlp: Clip Hand support'
        'ffmpeg: Clip Hand support'
    )
    provides=('openfang-desktop')

    cd "${pkgbase}-${pkgver}"
    install -Dm755 "target/release/openfang-desktop" "${pkgdir}/usr/bin/openfang-desktop"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # .desktop file
    install -Dm644 "${srcdir}/openfang-desktop.desktop" \
        "${pkgdir}/usr/share/applications/openfang-desktop.desktop"

    # icons — use 128x128 from Tauri icons and place in hicolor theme
    install -Dm644 "crates/openfang-desktop/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openfang-desktop.png"
    install -Dm644 "crates/openfang-desktop/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openfang-desktop.png"
    install -Dm644 "crates/openfang-desktop/icons/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openfang-desktop.png"
}

package_openfang-whatsapp-gateway() {
    pkgdesc='openfang WhatsApp gateway — QR login and bidirectional messaging via Baileys'
    depends=('nodejs' 'libvips' 'glibc' 'glib2' 'bash' 'libstdc++' 'libgcc')
    optdepends=('openfang-cli: connect gateway to the local openfang agent')

    local _gatewaydir="${pkgdir}/usr/lib/openfang-whatsapp-gateway"

    cd "${srcdir}/${pkgbase}-${pkgver}/packages/whatsapp-gateway"

    # Install package sources and vendored node_modules
    install -dm755 "${_gatewaydir}"
    cp -r index.js package.json node_modules "${_gatewaydir}/"

    # Remove ALL build artifacts from sharp — keep only the compiled .node binary
    # Save .node, nuke build dir, restore it at the required path
    local _sharpbuild="${_gatewaydir}/node_modules/sharp/src/build"
    local _nodebin
    _nodebin=$(find "${_sharpbuild}/Release" -maxdepth 1 -name '*.node' 2>/dev/null | head -1)
    if [[ -n "${_nodebin}" ]]; then
        cp "${_nodebin}" "${srcdir}/_sharp_node_tmp.node"
        rm -rf "${_sharpbuild}"
        install -dm755 "${_sharpbuild}/Release"
        mv "${srcdir}/_sharp_node_tmp.node" "${_sharpbuild}/Release/$(basename "${_nodebin}")"
    fi

    # Remove @img prebuilt packages — we built sharp against system libvips
    rm -rf "${_gatewaydir}/node_modules/@img"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openfang-whatsapp-gateway" <<'EOF'
#!/bin/sh
exec node /usr/lib/openfang-whatsapp-gateway/index.js "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openfang-whatsapp-gateway"

    # systemd service
    install -Dm644 "${srcdir}/openfang-whatsapp-gateway.service" \
        "${pkgdir}/usr/lib/systemd/system/openfang-whatsapp-gateway.service"

    install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
