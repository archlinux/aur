# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=datazen
pkgver=0.2.1
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
'14598cb6bec0b9dde1b21b79142ac3f0720c5a9a0dcaabe672097780c0b5eeec'
    'b12b1123e1827d744b4a4136bd615a3e83110790e051342197fcd00e4e5f814a'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/system-prompts-path.patch"

    # The public source tree excludes the private Pro extension resources.
    node -e '
        const fs = require("node:fs");
        const path = "src-tauri/tauri.conf.json";
        const config = JSON.parse(fs.readFileSync(path, "utf8"));
        delete config.bundle.resources["resources/builtin-ep"];
        fs.writeFileSync(path, JSON.stringify(config, null, 2) + "\n");
    '

    # Keep dependency caches inside the build tree.
    export CARGO_HOME="${srcdir}/.cargo"
    export npm_config_cache="${srcdir}/.npm-cache"
    pnpm config --location project set store-dir "${srcdir}/.pnpm-store"

    pnpm install --frozen-lockfile
    # Driver injection changes the workspace manifests, so Cargo.lock must
    # remain writable for the selected drivers.
    cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/.npm-cache"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/${pkgname}-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${srcdir}/.cargo/git=/cargo-git"

    # Build the community edition with PostgreSQL, MySQL, SQLite and Redis.
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
