# Maintainer: Paul Mourer <paul.mourer at gmail dot com>
pkgname=openchamber-desktop
pkgver=1.9.8
pkgrel=1
pkgdesc="Desktop app for OpenChamber AI coding interface (Tauri)"
arch=('x86_64')
url="https://github.com/openchamber/openchamber"
license=('MIT')
# Keep Bun-compiled sidecar intact: stripping breaks embedded payload and makes
# openchamber-server exit immediately (desktop logs show sidecar terminated code=0).
options=('!strip')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('rust' 'bun' 'base-devel' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openchamber/openchamber/archive/refs/tags/v${pkgver}.tar.gz"
         "openchamber-desktop.desktop")
sha256sums=('8620f2fd73b0d1abb0d4723b96670a6c6382f177e339439aab508f288ee5f6c6'
            '4ccadb9cb92fb28d9e5a7ca7e9a2c75a19e4cae2164fd6e43d7a7829fe6c9c43')
prepare() {
    cd "openchamber-${pkgver}"
    # Disable updater artifact signing; not needed for AUR where updates are
    # handled by the AUR helper. Recommended by Tauri maintainers for
    # non-updatable distributions: https://github.com/tauri-apps/tauri/issues/13259
    local conf="packages/desktop/src-tauri/tauri.conf.json"
    jq '.bundle.createUpdaterArtifacts = false' "$conf" > tmp.json && mv tmp.json "$conf"
}

build() {
    cd "openchamber-${pkgver}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export BUN_INSTALL_CACHE_DIR="${srcdir}/bun-cache"
    # ring crate assembly symbols become invisible when -flto emits LLVM bitcode
    # objects; strip it so ring compiles to regular object files. See
    # https://github.com/briansmith/ring/issues/2746
    export CFLAGS="${CFLAGS/ -flto=auto/}"
    export CFLAGS="${CFLAGS/ -flto/}"
    export CXXFLAGS="${CXXFLAGS/ -flto=auto/}"
    export CXXFLAGS="${CXXFLAGS/ -flto/}"

    bun install --frozen-lockfile
    APPIMAGE_EXTRACT_AND_RUN=1 bun run --cwd packages/desktop tauri build --bundles deb
}

package() {
    cd "openchamber-${pkgver}"

    local data="packages/desktop/src-tauri/target/release/bundle/deb/OpenChamber_${pkgver}_amd64/data"

    install -Dm755 "${data}/usr/bin/openchamber-desktop" "${pkgdir}/usr/bin/openchamber-desktop"
    install -Dm755 "${data}/usr/bin/openchamber-server"  "${pkgdir}/usr/bin/openchamber-server"

    cp -r "${data}/usr/lib" "${pkgdir}/usr/"

    install -Dm644 "${data}/usr/share/icons/hicolor/1024x1024/apps/openchamber-desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/openchamber-desktop.png"

    install -Dm644 "${srcdir}/openchamber-desktop.desktop" \
        "${pkgdir}/usr/share/applications/openchamber-desktop.desktop"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
