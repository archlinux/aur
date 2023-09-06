# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ximalaya
pkgname="deepin-wine-${_appname}"
pkgver=4.0.0.804
_sparkpkgname="com.${_appname}.spark"
_sparkver=4.0.0spark9
pkgrel=3
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme' 'sh' 'lib32-glibc')
optdepends=('wqy-microhei' 'wqy-zenhei')
provides=("${_appname}")
install="${pkgname}.install"
source=("${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_appname}-${pkgver}.exe::${url}/down/lite/v2?client=win&channelId=99&subChannelId=100002"
    "LICENSE.html"
    "${pkgname}".install
    "run.sh"    )
sha256sums=('95834bc4ad16e4822331adac43b5f4feb9aeba50d103788a2cefad72cd8dc941'
            '180ce17541504177a96194d25a7175030023479c1bf47df788b1a82c4c3790d1'
            '95b52ed4c2b0ef19d4a091da847c7dd20761699aa63a12bf933fa2064f49cd01'
            '6f2e0e87fe8f1abbd947d311b0fcad50c9c4c22a2531b8277db4e28e0a2d78dd'
            'da34f807690703b338b18003b6c6151e6c721bb2ca1bee78f4df6a6f1d8afc88')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_sparkpkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Extracting latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${_appname} ..."
    7z x -aoa "${_appname}-${pkgver}.exe"
    bsdtar -xf "${srcdir}/${_appname}-${pkgver}-ia32.nsis.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/${_appname}"
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"     
    sed 's|com.ximalaya.spark|deepin-wine-ximalaya|g;s|Audio|AudioVideo|g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop"
    rm -rf "${pkgdir}/opt/apps/${pkgname}/info"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}