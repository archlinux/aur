# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-pandaocr.pro
_pkgname=com.pandaocr.pro.spark
_officalname=PandaOCR.Pro
pkgver=5.57
sparkver=1.0.0
pkgrel=1
pkgdesc="Multi-functional multi-engine OCR text recognition, translation, reading, voice synthesis, Japanese comic game machine translation to Chinese, captcha recognition, image hosting upload, reverse image search, QR code scanning tool.Use deepin-wine."
arch=('x86_64')
url="https://github.com/miaomiaosoft/PandaOCR.Pro"
license=('LicenseRef-custom')
conflicts=("pandaocr")
noextract=("${pkgname}-${pkgver}.zip")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store/store/reading/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_officalname}_${pkgver}.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/miaomiaosoft/PandaOCR.Pro/${pkgver}/README.md"
    "${pkgname}.sh"
)
sha256sums=('f21c8dd02ee531e32a6f8b4b9cf8c49a21d6c85d422063673ff172e07deeb98f'
            '12a9cc6ace431deb2ac6d8a08fb9db9cc4387fa2c3348a3d904e06af8e7e273f'
            '338dae7030b4250f1541074911a7040bee7b5f616fa9b3432558a7fdb3ddae29'
            'b467dc84c7e1c481f354394cbb7f057473dce8aac64a8be0fcf46fab3ea4ba03')
prepare() {
    sed -e "
        s/@appname@/${pkgname}/g
        s/@appver@/${pkgver}/g
        s/@bottlename@/${_officalname}/g
    " -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    msg "Copying latest ${_officalname} file to ${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}"* "${srcdir}/tmp/drive_c/Program Files (x86)/"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    7z x -aoa "${srcdir}/${pkgname}-${pkgver}.zip" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    chmod +x "${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname}.exe"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    sed -e " 
        s/\"\/opt\/apps\/${_pkgname}\/files\/run.sh\"/${pkgname}/g
        s/\/opt\/apps\/${_pkgname}\/entries\/icons\/hicolor\/scalable\/apps\/${_pkgname}.png/${pkgname}/g
        s/GenericName=${_pkgname}/GenericName=${pkgname}/g
    " -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
