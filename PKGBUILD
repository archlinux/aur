# Maintainer: Ice Year
_appname=freeshow
pkgname=freeshow-electron-bin
_pkgname=FreeShow
pkgver=1.5.6
_tag=v1.5.6
_assetver=1.5.6
_assetname=FreeShow-1.5.6-amd64.deb
_electronversion=37
pkgrel=1
pkgdesc="FreeShow with system-wide Electron"
arch=('x86_64')
url="https://github.com/ChurchApps/FreeShow"
license=('GPL-3.0-only')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-bin"
    "${_appname}-git"
)
depends=(
    "gtk3"
    "libnotify"
    "nss"
    "libxss"
    "libxtst"
    "xdg-utils"
    "at-spi2-core"
    "util-linux-libs"
    "libsecret"
    "electron${_electronversion}"
)
optdepends=(
    "libappindicator-gtk3"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}.sh"
    "${pkgname%-bin}-${pkgver}-amd64.deb::${url}/releases/download/${_tag}/${_assetname}"
)
sha256sums=(
    'e08b8699c47bfa38365f7194d2dce675b3f36ef36235be993579db8647a8b307'
    '1fa1607ce5ba5f4d7f272ce788ae92eddc76d424a5228310daba13b77a034d5e'
)
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/FreeShow/FreeShow" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"

    ar x "${srcdir}/${pkgname%-bin}-${pkgver}-amd64.deb"
    _data_archive="$(ls data.tar.* 2>/dev/null | head -n1)"
    if [[ -z "${_data_archive}" ]]; then
        echo "Missing data.tar.* in deb archive"
        return 1
    fi
    if command -v bsdtar >/dev/null 2>&1; then
        bsdtar -xf "${_data_archive}"
    else
        tar -xf "${_data_archive}"
    fi

    _get_electron_version

    sed -i -e "
        s|Exec=.*|Exec=${pkgname%-bin} %U|g
        s|Icon=.*|Icon=${pkgname%-bin}|g
    " "${srcdir}/usr/share/applications/FreeShow.desktop"

    asar e "${srcdir}/opt/FreeShow/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if [[ -d "${srcdir}/opt/FreeShow/resources/app.asar.unpacked" ]]; then
        cp -Pr --no-preserve=ownership "${srcdir}/opt/FreeShow/resources/app.asar.unpacked" \
            "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked"
    fi
    if [[ -d "${srcdir}/opt/FreeShow/resources/slideshow" ]]; then
        cp -Pr --no-preserve=ownership "${srcdir}/opt/FreeShow/resources/slideshow" \
            "${pkgdir}/usr/lib/${pkgname%-bin}/slideshow"
    fi
    install -Dm644 "${srcdir}/usr/share/applications/FreeShow.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}"; do
        if [[ -f "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/FreeShow.png" ]]; then
            install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/FreeShow.png" \
                "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        fi
    done
}
