# Maintainer: Ernesto Castellotti <ernesto@castellotti.net>

_pkgname=telegram-a
realname=telegram-tt

pkgname="${_pkgname}"-bin
pkgver=10.0.13
pkgrel=1
pkgdesc="Official Telegram Web client version A system Electron version"
arch=('any')
url="https://web.telegram.org/a/get/"
license=('GPL3')
depends=('electron' 'libappindicator-gtk3' 'zlib' 'hicolor-icon-theme')
makedepends=('asar')
conflicts=("${_pkgname}"-appimage)
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/Ajaxy/telegram-tt/releases/download/v${pkgver}/Telegram-A-x86_64.AppImage"
                "https://github.com/Ajaxy/telegram-tt/raw/v${pkgver}/LICENSE"
                "https://github.com/Ajaxy/telegram-tt/raw/v${pkgver}/src/assets/telegram-logo.svg"
                "${_pkgname}"
                "${_pkgname}.desktop")
noextract=("${_appimage}")
sha256sums=('dd9499520661a320cccdca24734b4d6302eb2925d6c702e3cbf14df393ad44b1'
                'e1c0ad728983d8a57335e52cf1064f1affd1d454173d8cebd3ed8b4a72b48704'
                'ade1ddec66f6e98e30d8a56b01e7dd9d2c84a8f4dac51bc88d2ab5bc6e5d1a62'
                '80c8ae29e5de1cab4c1d49fdef6a81d01fc8112bea8080caa4ac26de9c136284'
                'de086bb54da308478eadb00680e6feec6c50b80283a2dd7c1f67132c11e3a216')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract

    # Override app name to fix wmclass mismatch
    asar extract ${srcdir}/squashfs-root/resources/app.asar ${srcdir}/asar_out
    cat <<< "const app = require('electron').app; app.setName(\"Telegram-A\"); $(cat ${srcdir}/asar_out/dist/electron.js)" > ${srcdir}/asar_out/dist/electron.js
    asar pack ${srcdir}/asar_out ${srcdir}/${_pkgname}.asar
}

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/telegram-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/telegram-a.svg"
    install -Dm644 "${srcdir}/${_pkgname}.asar" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/squashfs-root/resources/app-update.yml" "${pkgdir}/usr/share/${_pkgname}/app-update.yml.asar"
}
