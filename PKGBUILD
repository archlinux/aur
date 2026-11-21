# Maintainer: Yuri Nogueira <personal@yurinogueira.dev.br>

_pkgname=rdiskinfo
pkgname=${_pkgname}-bin
pkgver=0.1.0 # renovate: datasource=github-releases depName=yurinogueira/RDiskInfo
pkgrel=1
pkgdesc="Cross-protocol Linux S.M.A.R.T. and disk diagnostics viewer"
arch=('x86_64')
url="https://github.com/yurinogueira/RDiskInfo"
license=('GPL-3.0-or-later')
depends=(
    'fontconfig'
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'libglvnd'
    'libxkbcommon'
    'polkit'
    'smartmontools'
    'util-linux'
)
optdepends=(
    'wayland: Wayland display backend support'
    'libx11: X11 display backend support'
    'libxcursor: X11 cursor theming support'
    'libxi: X11 input extension support'
    'libxkbcommon-x11: X11 keyboard layout support'
    'xdg-desktop-portal: native file dialogs for exporting reports, screenshots, and custom backgrounds'
    'zenity: fallback file dialogs when xdg-desktop-portal is unavailable'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
install="${pkgname}.install"
source_x86_64=(
    "https://github.com/yurinogueira/RDiskInfo/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-linux.tar.gz"
)
sha256sums_x86_64=('716b954e49df259a1c2be9bfa5091f3e5a44351b2b03007c58ed79938e085785')

check() {
    local _bundle="${srcdir}/${_pkgname}-v${pkgver}-x86_64-linux"

    # Verify binary executes and reports expected version
    local _help
    _help="$("${_bundle}/${_pkgname}" --help)"
    if ! grep -Fq "RDiskInfo v${pkgver}" <<< "${_help}"; then
        echo "Error: binary --help output did not contain expected version 'RDiskInfo v${pkgver}'" >&2
        return 1
    fi

    # Verify headless JSON scan exits cleanly without elevation
    env -u DISPLAY -u WAYLAND_DISPLAY "${_bundle}/${_pkgname}" --json --no-elevate < /dev/null >/dev/null
}

package() {
    local _bundle="${srcdir}/${_pkgname}-v${pkgver}-x86_64-linux"

    # Main executable
    install -Dm755 "${_bundle}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop entry
    install -Dm644 "${_bundle}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Application icon (512x512 PNG — do NOT install legacy scalable SVG which overrides 512x512 at <=256px)
    install -Dm644 "${_bundle}/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${_bundle}/${_pkgname}.png" \
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    # Polkit policy for pkexec privileged S.M.A.R.T. helper
    install -Dm644 "${_bundle}/io.github.yurinogueira.${_pkgname}.policy" \
        "${pkgdir}/usr/share/polkit-1/actions/io.github.yurinogueira.${_pkgname}.policy"

    # Documentation & License
    install -Dm644 "${_bundle}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 "${_bundle}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
