# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=datazen
pkgver=0.3.0
pkgrel=1
pkgdesc="Lightweight, open-source AI database client"
arch=('x86_64')
url="https://github.com/flyxl/datazen"
license=('GPL-3.0-or-later')
# The database encryption key lives in the Secret Service keyring; without one
# (and no legacy .key file) DataZen refuses to start unless DATAZEN_KEYRING=file.
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
    'org.freedesktop.secrets'
    'webkit2gtk-4.1'
)
# node-gyp: pnpm install compiles the better-sqlite3 dev dependency, which has
# no prebuilt binary for Arch's current Node release.
makedepends=(
    'cargo'
    'git'
    'node-gyp'
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
sha256sums=('ae4b78a3c35624dd6e7c70f15e3e348199802110176d3fef59fae57f4d96db7b'
            '8892ec653cbc8b96078981c66446a75b1ec116b3c878293b5b0d6e230360e52e')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/system-prompts-path.patch"

    # Keep Tailwind's source scan inside the upstream tree instead of inheriting
    # the AUR repository's ignore-all .gitignore and dropping utility styles.
    mkdir -p .git
    : > .git/HEAD

    # The public source tree excludes the private Pro extension resources.
    node -e '
        const fs = require("node:fs");
        const path = "crates/datazen-desktop/tauri.conf.json";
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
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/${pkgname}-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry --remap-path-prefix=${srcdir}/.cargo/git=/cargo-git --remap-path-prefix=$(rustc --print sysroot)=/rust-toolchain"

    # Build the community edition with PostgreSQL, MySQL, SQLite and Redis.
    node scripts/with-driver-inject.mjs --drivers=basic -- \
        pnpm exec tauri build --no-bundle
}

package() {
    cd "${pkgname}-${pkgver}"

    # 0.3.0 renamed the binary to datazen_desktop (as in the official .deb);
    # keep the old datazen command working.
    install -Dm755 "target/release/datazen_desktop" \
        "${pkgdir}/usr/bin/datazen_desktop"
    ln -s datazen_desktop "${pkgdir}/usr/bin/datazen"

    install -d "${pkgdir}/usr/lib/DataZen/prompts"
    cp -a crates/datazen/resources/prompts/. "${pkgdir}/usr/lib/DataZen/prompts/"

    local _icons="crates/datazen-desktop/icons"
    local _icondir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 "${_icons}/32x32.png" \
        "${_icondir}/32x32/apps/datazen.png"
    install -Dm644 "${_icons}/128x128.png" \
        "${_icondir}/128x128/apps/datazen.png"
    install -Dm644 "${_icons}/128x128@2x.png" \
        "${_icondir}/256x256@2/apps/datazen.png"
    install -Dm644 "${_icons}/icon.png" \
        "${_icondir}/512x512/apps/datazen.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/DataZen.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=DataZen
Comment=Lightweight, open-source AI database client
Exec=datazen_desktop
Icon=datazen
Terminal=false
Categories=Development;Database;
StartupWMClass=datazen_desktop
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
