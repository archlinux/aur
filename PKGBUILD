# Maintainer: Wuxxin <wuxxin@gmail.com>
# Contributor: SteamedFish <steamedfish@hotmail.com>
pkgbase=librefang-git
pkgname=('librefang-cli-git' 'librefang-gui-git' 'librefang-whatsapp-gateway-git' 'python-librefang-sdk-git')
pkgver=2026.5.28beta.14.r38.g85dc15e07
pkgrel=1
pkgdesc='LibreFang is an open-source agent operating system written in Rust. '
arch=('x86_64' 'aarch64')
url='https://github.com/librefang/librefang'
license=('MIT' 'Apache-2.0')
makedepends=('rust' 'cargo' 'git' 'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'nodejs' 'npm' 'pnpm' 'node-gyp' 'python' 'nodejs-addon-api' 'libvips' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=(
    "${pkgbase}::git+https://github.com/librefang/librefang.git"
    "librefang.sysusers"
    "librefang.tmpfiles"
    "librefang.service"
    "librefang-desktop.desktop"
    "librefang-whatsapp-gateway.service"
    "feature-local-stt.patch"
    "feature-local-tts.patch"
    "feature-local-stt-tts-doc.md"
)
sha256sums=('SKIP'
            '72663b7a008dcf86e799df777f52c56ba700849510d3fd0c8f4a9e839702dd6e'
            'eb06400136cd6f6e0a57f5ee802c273c3ea05b63946c60bd9e135d079d777f10'
            'cf026330b3d4c3c708bd079b15401731e1afef4f3e780c4ad286ad0d961a6d5c'
            'a640db0197d001c5ae9348d57cda8092e2c8170fa27ced98d5546557fadb6d17'
            '1ddb18ffdd4c4131bf9a35debfb21a61aeda8ca1be90829e0e1b10d7bf19b975'
            '0e4ccc9ec9d34b0c765f1fac33a8e22949ef19fc05148fe18c1dad78718dcbc4'
            '8d8e5722dcdbe7821e9375018076cebfcc5d30a7b8e646623714190dd0d1383e'
            'fbb27c9831e77ecfacba0ca8a9ce85a9d2aeacac47495ae4f864c90a6e3b895a')

pkgver() {
    cd "${pkgbase}"
    git describe --long --tags --match 'v[0-9]*' | sed 's/^v//; s/-\(beta\|alpha\|rc\)/\1/g; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
    # Ensure HOME is writable for any git operations triggered by cargo or npm
    mkdir -p "${srcdir}/.home"
    export HOME="${srcdir}/.home"

    cd "${pkgbase}"

    # Apply local patches
    msg2 "Applying local STT and TTS support patches..."
    patch -Np1 -i "${srcdir}/feature-local-stt.patch"
    patch -Np1 -i "${srcdir}/feature-local-tts.patch"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    # Ensure HOME is writable for any git operations triggered by cargo or npm
    mkdir -p "${srcdir}/.home"
    export HOME="${srcdir}/.home"

    # Build React dashboard WebUI so it gets embedded in the API binary at compile-time
    cd "${srcdir}/${pkgbase}/crates/librefang-api/dashboard"
    pnpm install --frozen-lockfile
    pnpm run build

    # Build Rust binaries
    cd "${srcdir}/${pkgbase}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Remap source paths so binaries don't embed build-specific paths
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/build"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${CARGO_HOME:-${HOME}/.cargo}=/vendor"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${RUSTUP_HOME:-${HOME}/.rustup}=/rustup"
    # Remove -flto flags due to sqlite3 GCC compatibility issues with rust-lld
    CFLAGS="${CFLAGS//-flto=auto/}"
    CFLAGS="${CFLAGS//-flto/}"
    CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    CXXFLAGS="${CXXFLAGS//-flto/}"
    export CFLAGS CXXFLAGS
    export CARGO_PROFILE_RELEASE_LTO=false
    cargo build --frozen --release --bin librefang --bin librefang-desktop

    # Build Node.js whatsapp-gateway
    local _gwdir="${srcdir}/${pkgbase}/packages/whatsapp-gateway"
    cd "${_gwdir}"
    npm install --ignore-scripts --omit=dev
    # Copy system node-addon-api for compiling sharp/better-sqlite3 if needed
    cp -r /usr/lib/node_modules/node-addon-api "${_gwdir}/node_modules/node-addon-api"

    # Compile better-sqlite3 native addon
    cd "${_gwdir}/node_modules/better-sqlite3"
    npx node-gyp rebuild

    # Compile sharp native addon (transitive dependency of baileys)
    cd "${_gwdir}/node_modules/sharp"
    npm_config_build_from_source=true \
        SHARP_FORCE_GLOBAL_LIBVIPS=1 \
        NODE_PATH=/usr/lib/node_modules \
        node install/build.js

    # Build Python SDK
    cd "${srcdir}/${pkgbase}/sdk/python"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgbase}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release -p librefang-types --lib 2>/dev/null || true
}

package_librefang-cli-git() {
    pkgdesc='librefang CLI — terminal interface and daemon for the LibreFang Agent OS'
    depends=('glibc' 'openssl' 'libgcc' 'python-librefang-sdk-git')
    optdepends=(
        'chromium: Browser Hand support'
        'yt-dlp: Clip Hand support'
        'ffmpeg: Clip Hand support'
    )
    provides=('librefang' 'openfang')
    conflicts=('librefang' 'openfang' 'openfang-cli' 'librefang-cli')
    backup=('etc/librefang/env')

    cd "${pkgbase}"
    install -Dm755 "target/release/librefang" "${pkgdir}/usr/bin/librefang"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/feature-local-stt-tts-doc.md" "${pkgdir}/usr/share/doc/${pkgname}/feature-local-stt-tts-doc.md"

    # systemd service
    install -Dm644 "${srcdir}/librefang.service" "${pkgdir}/usr/lib/systemd/system/librefang.service"

    # sysusers and tmpfiles
    install -Dm644 "${srcdir}/librefang.sysusers" "${pkgdir}/usr/lib/sysusers.d/librefang.conf"
    install -Dm644 "${srcdir}/librefang.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/librefang.conf"

    # default environment file (empty, user-editable)
    install -Dm644 /dev/null "${pkgdir}/etc/librefang/env"
}

package_librefang-gui-git() {
    pkgdesc='librefang GUI — desktop application for the LibreFang Agent OS'
    depends=('glibc' 'openssl' 'libgcc' 'webkit2gtk-4.1' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'libsoup3' 'hicolor-icon-theme')
    optdepends=(
        'librefang-cli-git: CLI companion tool'
        'chromium: Browser Hand support'
        'yt-dlp: Clip Hand support'
        'ffmpeg: Clip Hand support'
    )
    provides=('librefang-desktop' 'openfang-gui' 'librefang-gui')
    conflicts=('librefang-desktop' 'openfang-gui' 'librefang-gui')

    cd "${pkgbase}"
    install -Dm755 "target/release/librefang-desktop" "${pkgdir}/usr/bin/librefang-desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # .desktop file
    install -Dm644 "${srcdir}/librefang-desktop.desktop" \
        "${pkgdir}/usr/share/applications/librefang-desktop.desktop"

    # icons
    install -Dm644 "crates/librefang-desktop/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/librefang-desktop.png"
    install -Dm644 "crates/librefang-desktop/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/librefang-desktop.png"
    install -Dm644 "crates/librefang-desktop/icons/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/librefang-desktop.png"
}

package_librefang-whatsapp-gateway-git() {
    pkgdesc='librefang WhatsApp gateway — QR login and bidirectional messaging via Baileys'
    depends=('nodejs' 'libvips' 'glibc' 'glib2' 'bash' 'libstdc++' 'libgcc')
    optdepends=('librefang-cli-git: connect gateway to the local librefang agent')
    provides=('librefang-whatsapp-gateway' 'openfang-whatsapp-gateway')
    conflicts=('librefang-whatsapp-gateway' 'openfang-whatsapp-gateway' 'librefang-whatsapp-gateway-git')

    local _gatewaydir="${pkgdir}/usr/lib/librefang-whatsapp-gateway"

    cd "${srcdir}/${pkgbase}/packages/whatsapp-gateway"

    # Install package sources and vendored node_modules
    install -dm755 "${_gatewaydir}"
    cp -r index.js package.json node_modules lib "${_gatewaydir}/"

    # Remove intermediate build folders/artifacts from better-sqlite3 and sharp to keep packages small
    local _sqlitebuild="${_gatewaydir}/node_modules/better-sqlite3/build"
    local _sqlitebin
    _sqlitebin=$(find "${_sqlitebuild}/Release" -maxdepth 1 -name 'better_sqlite3.node' 2>/dev/null | head -1)
    if [[ -n "${_sqlitebin}" ]]; then
        cp "${_sqlitebin}" "${srcdir}/_better_sqlite3_tmp.node"
        rm -rf "${_sqlitebuild}"
        install -dm755 "${_sqlitebuild}/Release"
        mv "${srcdir}/_better_sqlite3_tmp.node" "${_sqlitebuild}/Release/better_sqlite3.node"
    fi

    local _sharpbuild="${_gatewaydir}/node_modules/sharp/src/build"
    local _sharpbin
    _sharpbin=$(find "${_sharpbuild}/Release" -maxdepth 1 -name '*.node' 2>/dev/null | head -1)
    if [[ -n "${_sharpbin}" ]]; then
        cp "${_sharpbin}" "${srcdir}/_sharp_node_tmp.node"
        rm -rf "${_sharpbuild}"
        install -dm755 "${_sharpbuild}/Release"
        mv "${srcdir}/_sharp_node_tmp.node" "${_sharpbuild}/Release/$(basename "${_sharpbin}")"
    fi

    # Remove @img prebuilt packages since sharp is built against system libvips
    rm -rf "${_gatewaydir}/node_modules/@img"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat >"${pkgdir}/usr/bin/librefang-whatsapp-gateway" <<'EOF'
#!/bin/sh
exec node /usr/lib/librefang-whatsapp-gateway/index.js "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/librefang-whatsapp-gateway"

    # systemd service
    install -Dm644 "${srcdir}/librefang-whatsapp-gateway.service" \
        "${pkgdir}/usr/lib/systemd/system/librefang-whatsapp-gateway.service"

    install -Dm644 "${srcdir}/${pkgbase}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-librefang-sdk-git() {
    pkgdesc='Official Python client and SDK for the LibreFang Agent OS'
    depends=('python')
    provides=('python-librefang-sdk')
    conflicts=('python-librefang-sdk')

    cd "${srcdir}/${pkgbase}/sdk/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
