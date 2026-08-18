# Maintainer: Misaka 19465 <19465@misakanet.team>

pkgname=open-orpheus-git
pkgver=r941.gda75ffd
pkgrel=1
pkgdesc="An open-source implementation of Netease Cloud Music's Orpheus browser host."
arch=('x86_64')
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
optdepends=('kde-cli-tools: enable trash integration')
makedepends=(
    'git'
    'pnpm'
    'python'
    'rust'
    'rust-wasm'
    'wasm-bindgen'
)
source=(
    "${_srcname}::git+https://github.com/YUCLing/open-orpheus.git#branch=main"
    "${_srcname}.desktop"
    "${_srcname}.sh"
)
sha256sums=(
    'SKIP'
    'b707d4e2108965d8821d334e897f5ea11d3e0e3ba9e05bf3617139f52ac40df8'
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
}

# Compiles native modules and produces the Linux Electron application bundle.
build() {
    cd "${_srcname}"
    pnpm build:modules
    pnpm package
}

# Installs the bundled application and its desktop integration in standard paths.
package() {
    local appdir="${srcdir}/${_srcname}/out/${_srcname}-linux-x64"

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
