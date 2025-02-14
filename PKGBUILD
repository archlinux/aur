# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notebook-bin
_pkgname=NoteBook
pkgver=1.1.0
_electronversion=28
pkgrel=2
pkgdesc="A powerful application designed to streamline your note-taking experience. With its intuitive interface and robust features, Notebook provides a seamless platform for organizing your thoughts, ideas, and tasks.(Prebuild version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/akash2061/NoteBook-app"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/akash2061/NoteBook-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('14a80cfca1e7a5af4a3a70bb7fecb21ceb2b4c1e1a73f1c9c590a7051afafb74'
            '2d318a6705771bcfb3d6950490be56f7ab1a431ae2e6884d588a1f7190c81a02'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g;s/Productivity/Productivity;Utility/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/${pkgname%-bin}-png.png" \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/resources/icon.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}