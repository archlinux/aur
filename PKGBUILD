# Maintainer: <dev@akurei.me>

pkgname=openidea-git
pkgver=0.1.34.r3.gc0c56da
pkgrel=1
pkgdesc="Open-source IntelliJ IDEA-style IDE rebuilt in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/l0ng-ai/openidea"
license=('Apache-2.0')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'git'
    'nodejs'
    'pnpm'
    'pkgconf'
)
provides=('openidea')
conflicts=('openidea' 'openidea-bin')
# Cargo.toml already enables release LTO; a debug package of this binary is huge.
options=('!lto' '!debug')
source=(
    "openidea::git+https://github.com/l0ng-ai/openidea.git"
    "openidea.desktop"
)
sha256sums=(
    'SKIP'
    '63bb00df1323f81687c3cf2fb310f89e418d20baf1c659fcb4b7e1a070013764'
)

pkgver() {
    cd openidea
    git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd openidea

    # Distro package: ship the unpackaged binary, skip updater bundles.
    sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' src-tauri/tauri.conf.json

    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

    pnpm install --frozen-lockfile --store-dir "${srcdir}/pnpm-store"
}

build() {
    cd openidea

    export CARGO_HOME="${srcdir}/cargo-home"
    export CI=true

    # beforeBuildCommand runs `pnpm build` (tsc + vite), then cargo build.
    # Extra args after `--` are forwarded to cargo. Do not put `--` before
    # `build`: pnpm 12 forwards it and tauri then rejects `build` as an arg.
    pnpm run tauri build --no-bundle -- --locked --offline
}

package() {
    install -Dm755 "${srcdir}/openidea/target/release/openidea" "${pkgdir}/usr/bin/openidea"
    install -Dm644 "${srcdir}/openidea.desktop" "${pkgdir}/usr/share/applications/openidea.desktop"

    local icons="${srcdir}/openidea/src-tauri/icons"
    install -Dm644 "${icons}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/openidea.png"
    install -Dm644 "${icons}/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openidea.png"
    install -Dm644 "${icons}/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openidea.png"
    install -Dm644 "${icons}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/openidea.png"
    install -Dm644 "${icons}/source/openidea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openidea.svg"

    install -Dm644 "${srcdir}/openidea/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
