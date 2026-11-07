# Maintainer: Pedro Simoes <pedrofchsimoes at protonmail dot com>

# Use the following variable to change package architecture.
# To use OS architecture, uncomment the CARCH option.
_arch="x64"
# _arch="${CARCH}"
# Possible values: "x86", "x64"

case "${_arch:-${CARCH}}" in
    i686|x86)
        _archstr=''
        ;;
    x86_64|x64)
        _archstr='.x64'
        ;;
    *)
        error "Unsupported architecture: ${_arch}"
        return 1
        ;;
esac

pkgbase=notepadpp
pkgname=notepad++
_pkgname=notepad-plus-plus
pkgver=8.9.9
pkgrel=1
pkgdesc="A free source code editor for Windows"
url="https://${_pkgname}.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh' 'fuse-overlayfs')
makedepends=('unzip' 'icoutils')
provides=('notepadpp')
replaces=('notepadpp-win32' 'notepadpp-win64' 'notepadpp')

source=(
    notepad++
    notepad++.desktop
    "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.zip"{,.sig}
    "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.x64.zip"{,.sig}
)

sha256sums=('643713113d26d32b2e6d861e9cd6db8153a3359f3784dbd1710f12e89468654a'
            '58702dffc447abd46a5e80312f5049e0badd52959b9eb75b67aeaf83c25ba918'
            '0a68764f708bf0aeaaeccd2ce111633bcf62b5891871849ffe38569a2552ba80'
            'SKIP'
            '96a8216930f5316ed5961663b2cc92a62ec7d303b6c3077b92a7cfc38a8761b7'
            'SKIP')

noextract=(
    "npp.${pkgver}.portable.zip"
    "npp.${pkgver}.portable.x64.zip"
)

validpgpkeys=('14BCE4362749B2B51F8C71226C429F1D8D84F46E')

options=('!strip')

package() {
    local _appdir="${pkgdir}/usr/share/${pkgname}"
    local _icondir="${srcdir}/icons"
    local _png _name _size

    install -d -m755 "${_appdir}"

    unzip "${srcdir}/npp.${pkgver}.portable${_archstr}.zip" -d "${_appdir}"

    # Keep the updater for Plugins Admin, but disable automatic self-updates.
    rm -f "${_appdir}/license.txt"

    install -m644 /dev/null "${_appdir}/disableNppAutoUpdate.xml"

    # Verify the files required for the intended update behavior.
    if [[ ! -f "${_appdir}/updater/GUP.exe" ]]; then
        error "Plugins Admin updater (updater/GUP.exe) was not found."
        return 1
    fi

    if [[ ! -f "${_appdir}/notepad++.exe" ]]; then
        error "notepad++.exe was not found."
        return 1
    fi

    # Set permissions.
    find "${_appdir}" -type d -exec chmod 755 {} +
    find "${_appdir}" -type f -exec chmod 644 {} +

    # Extract the application icon from Notepad++.exe.
    mkdir -p "${_icondir}"

    wrestool -x -t 14 -n 100 \
        -o "${_icondir}/notepad++.ico" \
        "${_appdir}/notepad++.exe"

    icotool -x -o "${_icondir}" "${_icondir}/notepad++.ico"

    # Install each extracted PNG into its matching hicolor size directory.
    for _png in "${_icondir}"/notepad++_*x*x32.png; do
        [[ -f "${_png}" ]] || continue

        _name="${_png##*/}"
        _size="${_name#*_}"
        _size="${_size#*_}"
        _size="${_size%%x*}"

        install -D -m644 "${_png}" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/notepad++.png"
    done

    install -D -m755 "${srcdir}/notepad++" \
        "${pkgdir}/usr/bin/notepad++"

    install -D -m644 "${srcdir}/notepad++.desktop" \
        "${pkgdir}/usr/share/applications/notepad++.desktop"
}
