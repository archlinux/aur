# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=pi-studio
pkgver=0.2.2
pkgrel=1
_pi_ver=0.79.10
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
sha256sums=('04e88573b9f4414a37bed84d83fd4d0f623913fed1c37ec15dda92f18eae96e2')
source_x86_64=("pi-linux-x64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-x64.tar.gz")
sha256sums_x86_64=('a38ca21f27abb0f6d558b4cb9d1a11bb3efe76f65d9d739b9b07d7b839d23679')
source_aarch64=("pi-linux-arm64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-arm64.tar.gz")
sha256sums_aarch64=('ee5805734f665d44482285b7801262e2a165245b0153ed2c30bd6a9152c84627')

prepare() {
    cd "picot-${pkgver}"

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
    (cd src-tauri && cargo fetch --target "${CARCH}-unknown-linux-gnu")
}

build() {
    cd "picot-${pkgver}"

    export HOME="${srcdir}/.home"
    export CARGO_HOME="${srcdir}/.cargo"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}/picot-${pkgver}=/build/${pkgname} --remap-path-prefix=${srcdir}/.cargo/registry=/cargo-registry"

    # Build extensions
    bun run build:extensions

    # Build Tauri app without bundling
    bun run tauri build --no-bundle
}

package() {
    cd "picot-${pkgver}"

    install -Dm755 "src-tauri/target/release/picot" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Frontend resources
    local _libdir="${pkgdir}/usr/lib/Picot"
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
Name=Picot
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=pi-studio
Icon=pi-studio
Terminal=false
Categories=Development;
StartupWMClass=picot
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
