# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sukanka <su975853527 [AT] gmail.com>
pkgname=yank-note-bin
_pkgname=Yank-Note
pkgver=3.81.0
_electronversion=33
pkgrel=1
pkgdesc='A Hackable Markdown Note Application for Programmers.(Prebuilt version.Use system-wide electron)'
arch=(
    'aarch64'
    'x86_64'
)
url="https://yank-note.com/"
_ghurl="https://github.com/purocean/yn"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'python'
)
options=('!strip')
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('758b7306b1a2abb124633fa766c6a38c71957e46dad822a511aa33846c108306')
sha256sums_x86_64=('f213f0cf29932787714aa10d9051301870ab146de160a1c60da913de7071c1b0')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/yank.note/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s/\"\/opt\/${_pkgname//-/ }\/${pkgname%-bin}\"/${pkgname%-bin}/;s/Markdown;/Utility;/" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icon_sizes in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icon_sizes}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icon_sizes}/apps"
    done
}
