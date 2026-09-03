# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=datazen
pkgver=0.1.1
pkgrel=1
pkgdesc="Lightweight, open-source AI database client"
arch=('x86_64')
url="https://github.com/flyxl/datazen"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libgcc'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'git'
    'nodejs'
    'pkgconf'
    'pnpm'
    'rust'
)
provides=('datazen')
conflicts=('datazen-bin')
options=('!lto' '!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'system-prompts-path.patch'
)
sha256sums=(
    '29dd6ae03a9f82288c57efa376d1793f6e8e84b9f9e1e504f43f53e9b8a4a6ac'
    '3df1db7493efa2f9df25ae413a7d44b9cd0655ddbb94b987e6e2d501c29d1ece'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/system-prompts-path.patch"

    # Keep dependency caches inside the build tree.
    export CARGO_HOME="${srcdir}/.cargo"
    export npm_config_cache="${srcdir}/.npm-cache"
    pnpm config --location project set store-dir "${srcdir}/.pnpm-store"

    pnpm install --frozen-lockfile
    # v0.1.1's Cargo.lock is not synchronized with its workspace manifests.
    # Upstream's release build refreshes it as well, so --locked cannot be used.
    cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/.npm-cache"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/${pkgname}-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${srcdir}/.cargo/git=/cargo-git"

    # Match the standard upstream release: PostgreSQL, MySQL, SQLite and Redis.
    node scripts/with-driver-inject.mjs --drivers=basic -- \
        pnpm exec tauri build --no-bundle
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/datazen" "${pkgdir}/usr/bin/datazen"

    install -d "${pkgdir}/usr/lib/DataZen/prompts"
    cp -a src-tauri/resources/prompts/. "${pkgdir}/usr/lib/DataZen/prompts/"

    local _icondir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 "src-tauri/icons/32x32.png" \
        "${_icondir}/32x32/apps/datazen.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "${_icondir}/128x128/apps/datazen.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "${_icondir}/256x256@2/apps/datazen.png"
    install -Dm644 "src-tauri/icons/icon.png" \
        "${_icondir}/512x512/apps/datazen.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/DataZen.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DataZen
Comment=Lightweight, open-source AI database client
Exec=datazen
Icon=datazen
Terminal=false
Categories=Development;Database;
StartupWMClass=datazen
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
