# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=o-vault-bin
_pkgname=O-Vault
pkgver=1.0.0_beta5
_electronversion=30
pkgrel=2
pkgdesc="A secure Password Manager.O-Vault is fully offline, your passwords are saved locally on your device in an encrypted file called the vault."
arch=('x86_64')
url="https://www.o-vault.org/"
_ghurl="https://github.com/O-Vault/O-Vault"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.${CARCH}.linux.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/O-Vault/O-Vault/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f2c57b58bee7d4a29a396156e56f7ebee715d3f30bbeba341e8915a1eda2d6ad'
            '2886a4d441478a70dd9b54131026729bba024e28cc82e1c19a0860a57cc89794'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}