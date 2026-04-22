# Maintainer: Paul Mourer <paul.mourer at gmail dot com>
pkgname=openchamber-desktop-git
pkgver=1.9.8.r0.gcc4d6c1
pkgrel=1
pkgdesc="Desktop app for OpenChamber AI coding interface (Tauri)"
arch=('x86_64')
url="https://github.com/openchamber/openchamber"
license=('MIT')
provides=('openchamber-desktop')
conflicts=('openchamber-desktop')
# Keep Bun-compiled sidecar intact: stripping breaks embedded payload and makes
# openchamber-server exit immediately (desktop logs show sidecar terminated code=0).
options=('!strip')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('git' 'rust' 'bun' 'base-devel' 'jq')
source=("git+https://github.com/openchamber/openchamber.git"
        "openchamber-desktop.desktop")
sha256sums=('SKIP'
            '4ccadb9cb92fb28d9e5a7ca7e9a2c75a19e4cae2164fd6e43d7a7829fe6c9c43')

pkgver() {
    cd "openchamber"

    if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed -E 's/^v//;s/(.+)-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
        return
    fi

    local rev hash
    rev="$(git rev-list --count HEAD)"
    hash="$(git rev-parse --short=7 HEAD)"
    printf 'r%s.g%s\n' "$rev" "$hash"
}

prepare() {
    cd "openchamber"
    # Disable updater artifact signing; not needed for AUR where updates are
    # handled by the AUR helper. Recommended by Tauri maintainers for
    # non-updatable distributions: https://github.com/tauri-apps/tauri/issues/13259
    local conf="packages/desktop/src-tauri/tauri.conf.json"
    jq '.bundle.createUpdaterArtifacts = false' "$conf" > tmp.json && mv tmp.json "$conf"
}

build() {
    cd "openchamber"

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
    cd "openchamber"

    local data_dirs=(packages/desktop/src-tauri/target/release/bundle/deb/OpenChamber_*_amd64/data)
    local data="${data_dirs[0]}"
    if [[ ! -d "$data" ]]; then
        echo "Could not locate bundled deb payload directory" >&2
        return 1
    fi

    install -Dm755 "${data}/usr/bin/openchamber-desktop" "${pkgdir}/usr/bin/openchamber-desktop"
    install -Dm755 "${data}/usr/bin/openchamber-server"  "${pkgdir}/usr/bin/openchamber-server"

    cp -r "${data}/usr/lib" "${pkgdir}/usr/"

    install -Dm644 "${data}/usr/share/icons/hicolor/1024x1024/apps/openchamber-desktop.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/openchamber-desktop.png"

    install -Dm644 "${srcdir}/openchamber-desktop.desktop" \
        "${pkgdir}/usr/share/applications/openchamber-desktop.desktop"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
