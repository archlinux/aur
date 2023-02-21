# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-pandaocr.pro
_pkgname=com.pandaocr.pro.spark
_officalname=PandaOCR.Pro
pkgver=5.46
sparkver=1.0.0
pkgrel=1
epoch=
pkgdesc="多功能多引擎OCR文字识别、翻译、朗读、语音合成、日漫游戏机翻汉化、验证码识别、图床上传、以图搜图、扫码工具"
arch=("x86_64")
url="https://github.com/miaomiaosoft/PandaOCR.Pro"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("miaomiaosoft")
install="${pkgname}.install"
source=(
    "${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/reading/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${_officalname}_${pkgver}.zip::${url}/releases/download/${pkgver}/${_officalname}_${pkgver}.zip"
    "${pkgname}.install"
    "${pkgname}.desktop"
    "run.sh"
    )
sha256sums=('f21c8dd02ee531e32a6f8b4b9cf8c49a21d6c85d422063673ff172e07deeb98f'
            '1cecdaec9f3c6c58a591e72c8eaab145fbfc59b961201e0ee55a358bcfac5746'
            'fba9300589f8e39390cbbd82e3042d494f70b166881460e4e8ce8b75265da481'
            '21fc8ca36649a1085d71f7391c2ec1378d2322a12a1713ce00eefc1072c90f3b'
            'ec46ba753145c6e03bd78251c20457e891a08d2daec20ce09c35ab3395f387a8')
 
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
     
    msg "Copying latest ${_officalname} file to ${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}_5.44"
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    7z x -aoa "${_officalname}_${pkgver}.zip" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    chmod +x "${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname}.exe"
     
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
     
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    rm -rf "${srcdir}/opt/apps/${pkgname}/entries/applications"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
    
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${pkgname}.desktop" ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
