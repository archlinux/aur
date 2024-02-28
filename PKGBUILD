# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=soundsync-bin
_pkgname=Soundsync
pkgver=0.4.16
_electronversion=15
pkgrel=9
pkgdesc="Virtual cables between any audio source and any speaker in your home"
arch=('x86_64')
url="https://soundsync.app/"
_ghurl="https://github.com/geekuillaume/soundsync"
license=('BUSL1.1')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libpulse'
    'python>3'
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x64-${pkgver}.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/geekuillaume/soundsync/v${pkgver}/LICENSE"
    "${pkgname%-bin}.service"
    "${pkgname%-bin}.sh"
)
sha256sums=('12bd6190537d80a29fa89fa2fa37da310593d5e6c54a7fe9f16c5f1509d4b94c'
            '0c659fd7972a1a233b161380cfb177149d6d75b3c4f97c8cf8bbd8eb91b026d0'
            'b0b07f20aa91c04c6aa05590ebd4d4697b2939283bcb122810759a2ed961a005'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm644 "${srcdir}/opt/${_pkgname}/package_extra/systemd/default/files/etc/systemd/system/${pkgname%-bin}.service" \
        -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/opt/${_pkgname}/package_extra/systemd/default/files/etc/default/${pkgname%-bin}" \
        -t "${pkgdir}/etc/default"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/"{app,res,webui} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}