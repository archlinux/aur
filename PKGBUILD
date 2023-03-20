# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-ximalaya
_officalname=ximalaya
pkgver=3.3.5_99B
_sparkpkgname=com.ximalaya.spark
_sparkver=3.3.0spark6
pkgrel=1
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('wqy-microhei' 'wqy-zenhei')
provides=(ximalaya)
install="${pkgname}.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.exe::${url}/down/lite/v2?client=win&channelId=99&subChannelId=100002"
    "LICENSE::https://passport.ximalaya.com/page/register_rule"
    "${pkgname}".install
    run.sh
    )
sha256sums=('54989d78270b73e473e71eaa5676eb668976232fb06fff0cd4d62336d00da71e'
            '3197ea21b88398008eda74cbbf4e38ddcbb276581c97135d5524235ab49d01e5'
            '49d0dbd526a0e15cb24cc6ab7bb6f9205198688ab1f7d184740ee6cbf2ef1558'
            '6f2e0e87fe8f1abbd947d311b0fcad50c9c4c22a2531b8277db4e28e0a2d78dd'
            'ba810342c668ec3346dbb90811f090254a46b32964e074d3d3dbc806ed2e7116')
 
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_sparkpkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}"
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/dlls"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_officalname}/${_officalname}-${pkgver}.exe"     
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"     
    mv "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.ximalaya.spark/deepin-wine-ximalaya/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/Audio/AudioVideo/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" 
    echo "Icon=deepin-wine-ximalaya.png" >> "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" 
    rm -rf ${pkgdir}/opt/apps/${pkgname}/info
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install  "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
