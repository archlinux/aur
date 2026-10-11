# Maintainer: Misaka 19465 <19465@misakanet.team>

pkgname=open-orpheus-git
pkgver=r974.gb4508e9
pkgrel=2
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64' 'aarch64')
url="https://github.com/YUCLing/open-orpheus"
license=('MIT')
_srcname=open-orpheus
provides=('open-orpheus')
conflicts=('open-orpheus')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'gtk3'
    'hicolor-icon-theme'
    'libdrm'
    'libnotify'
    'libxcb'
    'mesa'
    'nss'
    'xdg-utils'
)
makedepends=(
    'git'
    'pnpm'
    'python'
    'zig'
)
makedepends_x86_64=(
    'rust'
    'rust-wasm'
    'wasm-bindgen'
)
makedepends_aarch64=(
    'cargo-zigbuild'
    'rustup'
)
source=(
    "${_srcname}::git+https://github.com/YUCLing/open-orpheus.git#branch=main"
    "${_srcname}.desktop"
    "${_srcname}.sh"
)
sha256sums=(
    'SKIP'
    '56dd949cd671722ae4fbdf71ecd45c1ddafae261068843dc04891735c93bd97a'
    '728c0ebb644d19ad2679689f2df4d1b11e8c89a22ee1606b0789ce78aca4bd18'
)

# Derives an AUR-compatible version from the latest main-branch commit.
pkgver() {
    cd "${_srcname}"
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Installs the lockfile-pinned JavaScript dependencies required for packaging.
prepare() {
    cd "${_srcname}"
    pnpm install --frozen-lockfile
    # Arch Linux ARM packages neither the wasm32-unknown-unknown target nor the
    # wasm-bindgen CLI, so provision both from the rustup toolchain, as upstream CI does.
    if [[ ${CARCH} == aarch64 ]]; then
        rustup target add wasm32-unknown-unknown
        local _wasm_bindgen_version
        _wasm_bindgen_version=$(awk '/^wasm-bindgen =/ { gsub(/"/, "", $3); print $3; exit }' Cargo.toml)
        cargo install --locked "wasm-bindgen-cli@${_wasm_bindgen_version}"
    fi
}

# Compiles native modules and produces the Linux Electron application bundle.
build() {
    cd "${_srcname}"
    pnpm build:modules
    pnpm package
}

# Installs the bundled application and its desktop integration in standard paths.
package() {
    # Electron Forge names the packaged bundle after the build host's architecture.
    local electron_arch
    case "${CARCH}" in
        x86_64) electron_arch=x64 ;;
        aarch64) electron_arch=arm64 ;;
    esac
    local appdir="${srcdir}/${_srcname}/out/${_srcname}-linux-${electron_arch}"

    install -d "${pkgdir}/usr/lib/${_srcname}"
    cp -a "${appdir}/." "${pkgdir}/usr/lib/${_srcname}/"
    # Electron Forge can retain a restrictive build-directory mode; installed payloads must be readable and traversable by every user.
    chmod -R a+rX "${pkgdir}/usr/lib/${_srcname}"
    install -Dm755 "${srcdir}/${_srcname}.sh" "${pkgdir}/usr/bin/${_srcname}"
    install -Dm644 "${srcdir}/${_srcname}.desktop" \
        "${pkgdir}/usr/share/applications/${_srcname}.desktop"
    install -Dm644 "${_srcname}/assets/icon_512.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_srcname}.png"
    install -Dm644 "${_srcname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
