# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-pandaocr.pro
_pkgname=com.pandaocr.pro.spark
_officalname=PandaOCR.Pro
pkgver=5.51
sparkver=1.0.0
pkgrel=1
epoch=
pkgdesc="多功能多引擎OCR文字识别、翻译、朗读、语音合成、日漫游戏机翻汉化、验证码识别、图床上传、以图搜图、扫码工具"
arch=('x86_64')
url="https://github.com/miaomiaosoft/PandaOCR.Pro"
license=('custom')
conflicts=("pandaocr")
provides=("${_officalname}=${pkgver}")
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
noextract=("${_officalname}-${pkgver}.zip")
install="${pkgname}.install"
source=(
    "${_pkgname}_${sparkver}_i386.deb::https://d.store.deepinos.org.cn/store/reading/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${_officalname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_officalname}_${pkgver}.zip"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "run.sh"
    "LICENSE.md::https://raw.githubusercontent.com/miaomiaosoft/PandaOCR.Pro/${pkgver}/README.md"
    )
sha256sums=('f21c8dd02ee531e32a6f8b4b9cf8c49a21d6c85d422063673ff172e07deeb98f'
            'fab872bfb08d598e766daf74391254a7e18ad3cc01801b4584bf7afa3d4c8686'
            'fba9300589f8e39390cbbd82e3042d494f70b166881460e4e8ce8b75265da481'
            '21fc8ca36649a1085d71f7391c2ec1378d2322a12a1713ce00eefc1072c90f3b'
            '92b86d395f4cc2b711ebe10f8691c2df1ef3f0931be0864e7be37a896894935b'
            '7f05578539c3b961a2e425524d933c839d6c259f30d21e136bbab0daf05d13b6')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    msg "Copying latest ${_officalname} file to ${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}_5.44" "${srcdir}/tmp/drive_c/Program Files (x86)/"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    7z x -aoa "${_officalname}-${pkgver}.zip" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
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
    install -Dm755 "run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/opt/apps"
    cp -r "${srcdir}/opt/apps/${pkgname}" "${pkgdir}/opt/apps"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}