# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ximalaya
pkgname="deepin-wine-${_appname}"
pkgver=3.3.7_99B
_sparkpkgname="com.${_appname}.spark"
_sparkver=3.3.0spark6
pkgrel=1
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme')
optdepends=('wqy-microhei' 'wqy-zenhei')
provides=("${_appname}")
install="${pkgname}.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_appname}-${pkgver}.exe::${url}/down/lite/v2?client=win&channelId=99&subChannelId=100001"
    "LICENSE::https://passport.ximalaya.com/page/register_rule"
    "${pkgname}".install
    "run.sh"
    )
sha256sums=('54989d78270b73e473e71eaa5676eb668976232fb06fff0cd4d62336d00da71e'
            'bfc6955980077628889e366a7a874208e4f03e34e9ede39281f9b2912a6abfa3'
            '49d0dbd526a0e15cb24cc6ab7bb6f9205198688ab1f7d184740ee6cbf2ef1558'
            '6f2e0e87fe8f1abbd947d311b0fcad50c9c4c22a2531b8277db4e28e0a2d78dd'
            'dca08236b89afa219042fdc576db33e43ee6e46e59dec0846a670171c91cbbd9')
 
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_sparkpkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Copying latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files/${_appname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_appname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_appname}"
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/dlls"
    install -m644 "${_appname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_appname}/${_appname}-${pkgver}.exe"     
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"     
    mv "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.ximalaya.spark/deepin-wine-ximalaya/g;s/Audio/AudioVideo/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    echo "Icon=deepin-wine-ximalaya.png" >> "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" 
    rm -rf "${pkgdir}/opt/apps/${pkgname}/info"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
