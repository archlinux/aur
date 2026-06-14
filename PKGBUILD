# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=pi-studio
pkgver=0.1.28
pkgrel=1
_pi_ver=0.78.0
pkgdesc="Local Codex-style desktop GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/shixin-guo/pi-studio"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gcc-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=(
    'bun'
    'rust'
    'cargo'
    'pkgconf'
)
provides=('pi-studio')
conflicts=('pi-studio-bin')
options=('!lto' '!debug')

_pi_relurl="https://github.com/earendil-works/pi-mono/releases/download/v${_pi_ver}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('23f366f55a52c2b91cf46ddbf81ad0a6ccf9c68945f2aae43ea4bdd9cb71fd8c')
source_x86_64=("pi-linux-x64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-x64.tar.gz")
sha256sums_x86_64=('8ac03343d1e1228106e8172157f32d6b882829e46b34feaf577f171a5f1387cc')
source_aarch64=("pi-linux-arm64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-arm64.tar.gz")
sha256sums_aarch64=('49155173682473720d9decf4deecbed754fae84925ef003c0b66aac31d5f9005')

prepare() {
    cd "${pkgname}-${pkgver}"

    export HOME="${srcdir}/.home"
    mkdir -p "$HOME"

    # Place the pre-downloaded pi binary so the fetch script is skipped
    local _pidir="src-tauri/resources/pi"
    mkdir -p "${_pidir}"
    cp -a "${srcdir}/pi/". "${_pidir}/"
    printf '%s' "${_pi_ver}" > "${_pidir}/.version"

    bun install --frozen-lockfile

    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    (cd src-tauri && cargo fetch --locked --target "${CARCH}-unknown-linux-gnu")
}

build() {
    cd "${pkgname}-${pkgver}"

    export HOME="${srcdir}/.home"
    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/${pkgname}-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry"

    # Build extensions
    bun run build:extensions

    # Build Tauri app without bundling
    bun run tauri build --no-bundle
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "src-tauri/target/release/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Frontend resources
    local _libdir="${pkgdir}/usr/lib/PiStudio"
    install -d "${_libdir}"
    cp -a public "${_libdir}/public"

    # Bundled pi runtime
    cp -a src-tauri/resources/pi "${_libdir}/pi"

    # Bundled extensions
    install -d "${_libdir}/extensions"
    install -Dm644 extensions/dist/*.mjs "${_libdir}/extensions/"

    # Icons
    local _icondir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 "src-tauri/icons/32x32.png" "${_icondir}/32x32/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128.png" "${_icondir}/128x128/apps/${pkgname}.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "${_icondir}/256x256/apps/${pkgname}.png"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Pi Studio
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=pi-studio
Icon=pi-studio
Terminal=false
Categories=Development;
StartupWMClass=pi-studio
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
