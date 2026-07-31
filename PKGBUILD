# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=picot
pkgver=0.3.1
pkgrel=1
_pi_ver=0.82.0
pkgdesc="Local Codex-style desktop GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/shixin-guo/picot"
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
# Upstream renamed the project pi-studio -> picot (GitHub repo redirect); this
# package supersedes pi-studio. replaces= migrates existing installs on -Syu.
provides=('pi-studio')
replaces=('pi-studio')
conflicts=('pi-studio' 'picot-bin')
options=('!lto' '!debug')

_pi_relurl="https://github.com/earendil-works/pi-mono/releases/download/v${_pi_ver}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c8c2823e788d1b36404371dd99b2caba6aa1f8de434a5320a1e969160ff35b2a')
source_x86_64=("pi-linux-x64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-x64.tar.gz")
sha256sums_x86_64=('791abd8043bf85deb4d090b905c9ebce4eb4f5776f919b4e3d371f69a6b977d0')
source_aarch64=("pi-linux-arm64-${_pi_ver}.tar.gz::${_pi_relurl}/pi-linux-arm64.tar.gz")
sha256sums_aarch64=('a0bd25d2f41a754463bc96fb21f5e790adb3b75d1eed98bed2b19d3529022b0f')

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

    # ponytail: upstream 0.3.1 added .cargo/config.toml (target-dir = "target"),
    # moving the binary out of src-tauri/. Accept either layout.
    install -Dm755 "$(ls target/release/picot src-tauri/target/release/picot 2>/dev/null | head -1)" \
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
Exec=picot
Icon=picot
Terminal=false
Categories=Development;
StartupWMClass=picot
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
