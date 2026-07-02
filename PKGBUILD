# Maintainer: Wanxp <977741432@qq.com>
pkgname=rssh-git
_pkgname=rssh
pkgver=0.2.10.r7.g3b41605
pkgrel=1
pkgdesc="SSH client built to be an AI ops copilot (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/shihuili1218/rssh"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'librsvg'
    'libsecret'
    'systemd-libs'
)
makedepends=(
    'git'
    'rust'
    'npm'
    'pkgconf'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!lto')
source=(
    "git+${url}.git"
    "${_pkgname}.desktop"
)
sha256sums=(
    'SKIP'
    '77d851d63f705d8e302e56645a948e710ef674beee130fdc1e67a129e285ee0a'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags --match 'v[0-9]*' \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/npm-cache"

    npm ci
    cargo fetch --locked --manifest-path src-tauri/Cargo.toml

    # Arch packages should not install into /usr/local.  Keep one public command
    # (`/usr/bin/rssh`) for the CLI and let it launch the GUI from /usr/lib.
    sed -e 's|/usr/bin/rssh|/usr/lib/rssh/rssh-gui|g' \
        -i src-tauri/src/bin/rssh/main.rs
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/npm-cache"

    npm run build

    cd src-tauri
    cargo build --release --locked --features cli --bin rssh-cli
    cargo build --release --locked --features custom-protocol --bin rssh
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 src-tauri/target/release/rssh-cli "${pkgdir}/usr/bin/rssh"
    install -Dm755 src-tauri/target/release/rssh "${pkgdir}/usr/lib/rssh/rssh-gui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    if [[ -f src-tauri/icons/32x32.png ]]; then
        install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/64x64.png ]]; then
        install -Dm644 src-tauri/icons/64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/128x128.png ]]; then
        install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/128x128@2x.png ]]; then
        install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    fi
}
