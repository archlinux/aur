# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=deepseek-reasonix-desktop-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="DeepSeek-Reasonix Desktop - Electron-based desktop client for DeepSeek models"
arch=('x86_64')
url="https://github.com/esengine/DeepSeek-Reasonix"
license=('MIT')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
)
provides=('deepseek-reasonix-desktop' 'reasonix-desktop')
conflicts=('deepseek-reasonix-desktop' 'reasonix-desktop')
options=('!strip' '!debug')

_relurl="https://github.com/esengine/DeepSeek-Reasonix/releases/download/desktop-v${pkgver}"

source=(
    "Reasonix-linux-amd64.tar.gz::${_relurl}/Reasonix-linux-amd64.tar.gz"
    'reasonix-desktop.sh'
    'reasonix-desktop.desktop'
    "LICENSE::https://raw.githubusercontent.com/esengine/DeepSeek-Reasonix/main-v2/LICENSE"
)
sha256sums=(
    'd9cbaaeb566344499e0ee5ef9ff57d487050923b9a81e74c4ad86d18746109f6'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    # makepkg auto-extracts Reasonix-linux-amd64.tar.gz into srcdir.
    # Try common Electron-app layouts to find the Reasonix top-level directory.
    local _appdir
    if [[ -d "${srcdir}/Reasonix" ]]; then
        _appdir="${srcdir}/Reasonix"
    elif [[ -d "${srcdir}/Reasonix-${pkgver}" ]]; then
        _appdir="${srcdir}/Reasonix-${pkgver}"
    elif [[ -d "${srcdir}/Reasonix-linux-x64" ]]; then
        _appdir="${srcdir}/Reasonix-linux-x64"
    else
        # Fallback: pick the first directory found
        _appdir=$(find "${srcdir}" -maxdepth 1 -type d \
            ! -name '.' ! -name '..' 2>/dev/null | head -1)
        if [[ -z "${_appdir}" ]]; then
            error "Could not find Reasonix application directory in ${srcdir}"
            return 1
        fi
    fi

    # Install the app bundle into /opt/Reasonix
    install -d "${pkgdir}/opt/Reasonix"
    cp -a "${_appdir}/." "${pkgdir}/opt/Reasonix/"

    # Install wrapper script
    install -Dm755 "${srcdir}/reasonix-desktop.sh" \
        "${pkgdir}/usr/bin/reasonix-desktop"

    # Install .desktop entry
    install -Dm644 "${srcdir}/reasonix-desktop.desktop" \
        "${pkgdir}/usr/share/applications/reasonix-desktop.desktop"

    # Install icons (try several common paths)
    local _icon
    _icon=$(find "${_appdir}" -name '*.png' -path '*/icons/*' 2>/dev/null | head -1)
    if [[ -z "${_icon}" ]]; then
        _icon=$(find "${_appdir}" -name '*icon*' -o -name '*Icon*' 2>/dev/null | head -1)
    fi
    if [[ -z "${_icon}" ]]; then
        _icon=$(find "${_appdir}" -path '*/resources/app-dist/*.png' 2>/dev/null | head -1)
    fi
    if [[ -n "${_icon}" ]]; then
        local _icon_size
        _icon_size=$(identify -format '%w' "${_icon}" 2>/dev/null || echo 256)
        install -Dm644 "${_icon}" \
            "${pkgdir}/usr/share/icons/hicolor/${_icon_size}x${_icon_size}/apps/reasonix-desktop.png"
    fi

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
