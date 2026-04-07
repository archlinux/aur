# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-bin
_pkgname=Mailspring
pkgver=1.19.1
_electronversion=41
pkgrel=1
pkgdesc="A beautiful, fast and fully open source mail client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'krb5'
    'db5.3'
    'tidy'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-0.1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('a3d7aa72961a68a98bff32af84190198f9b784c470bb7536c73917ccde97ea14'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
_get_current_desktop_env() {
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        if echo "$XDG_CURRENT_DESKTOP" | grep -i gnome > /dev/null; then
            echo "gnome"
            return 0
        elif echo "$XDG_CURRENT_DESKTOP" | grep -i kde > /dev/null || echo "$XDG_CURRENT_DESKTOP" | grep -i plasma > /dev/null; then
            echo "plasma"
            return 0
        fi
    fi
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=x11/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
    _desktop_env="$(_get_current_desktop_env)"
    if [ "${_desktop_env}" = "gnome" ];then
        sed -i "s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin} --password-store=\"gnome-libsecret\"/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    find "${srcdir}/usr/share/${pkgname%-bin}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/usr/share/${pkgname%-bin}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/usr/share/${pkgname%-bin}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
}
