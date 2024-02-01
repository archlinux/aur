# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-pandaocr.pro
_pkgname=com.pandaocr.pro.spark
_officalname=PandaOCR.Pro
pkgver=5.52
sparkver=1.0.0
pkgrel=1
epoch=
pkgdesc="多功能多引擎OCR文字识别、翻译、朗读、语音合成、日漫游戏机翻汉化、验证码识别、图床上传、以图搜图、扫码工具"
arch=('x86_64')
url="https://github.com/miaomiaosoft/PandaOCR.Pro"
license=('LicenseRef-custom')
conflicts=("pandaocr")
noextract=("${pkgname}-${pkgver}.zip")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${sparkver}.deb::https://d.store.deepinos.org.cn/store/reading/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_officalname}_${pkgver}.zip"
    "${pkgname}.sh"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/miaomiaosoft/PandaOCR.Pro/${pkgver}/README.md"
)
sha256sums=('f21c8dd02ee531e32a6f8b4b9cf8c49a21d6c85d422063673ff172e07deeb98f'
            '9d630036c07b0cb6fc380668395d94f2bf4e6c728a822ba9f43d439ed4e79406'
            '21fc8ca36649a1085d71f7391c2ec1378d2322a12a1713ce00eefc1072c90f3b'
            'af3e23013f0ab183d5362b0b20569f0cf6cb7895fbe051af47ca586ddfd92950'
            '8dbb5f5d875a8e79f0818ae3290ab92fd3925c949485f825f8ae4cf6a508c2b0')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@bottlename@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
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
    sed -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -e "s|/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png|${pkgname}|g" \
        -e "s|GenericName=${_pkgname}|GenericName=${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/opt" "${pkgdir}/opt"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}