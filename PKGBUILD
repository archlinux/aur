# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ximalaya
pkgname="deepin-wine-${_appname}"
pkgver=4.0.2
pkgrel=3
_sparkpkgname="com.${_appname}.spark"
_sparkver=4.0.0spark9
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    'ttf-ms-fonts'
)
makedepends=(
    'p7zip'
)
provides=("${_appname}")
conflicts=("${_appname}" "${_sparkpkgname}")
install="${pkgname}.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_appname}-${pkgver}.exe::${url}/down/lite/v2?client=win&channelId=99&subChannelId=100001"
    "LICENSE.html"
    "${pkgname}".sh
)
sha256sums=('95834bc4ad16e4822331adac43b5f4feb9aeba50d103788a2cefad72cd8dc941'
            '7bb0647d70828858fcccba3af63cffc8ac0179defaba674fb120bd3786c703be'
            '95b52ed4c2b0ef19d4a091da847c7dd20761699aa63a12bf933fa2064f49cd01'
            '8303c95e1a707be4e418d1750a47eaebf861f2cdff81a9e0c0212ae2edacef2a')
build() {
    sed -e "s|@appname@|${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@packagename@|${pkgname}|g" \
        -i "${pkgname}.sh"
    
    bsdtar -xf "${srcdir}/data."*
    mkdir -p "${srcdir}/tmp"

    msg "Extracting Deepin Wine ${_appname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${_sparkpkgname}/files/files.7z" -C "${srcdir}/tmp"

    msg "Extracting latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${_appname} ..."
    7z x -aoa "${_appname}-${pkgver}.exe"
    bsdtar -xf "${srcdir}/${_appname}-${pkgver%.804}-ia32.nsis.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/${_appname}"

    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${_sparkpkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${_sparkpkgname}/files/files.7z" "${srcdir}/tmp/*"

    sed "s|${_sparkpkgname}|${pkgname}|g;s|\"/opt/apps/${pkgname}/files/run.sh\" -u %u|${pkgname} -u %U|g" \
        -i "${srcdir}/opt/apps/${_sparkpkgname}/entries/applications/${_sparkpkgname}.desktop"
    md5sum "${srcdir}/opt/apps/${_sparkpkgname}/files/files.7z" | awk '{ print $1 }' > "${srcdir}/opt/apps/${_sparkpkgname}/files/files.md5sum"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname}"
    cp -r "${srcdir}/opt/apps/${_sparkpkgname}/"{entries,files} "${pkgdir}/opt/apps/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/opt/apps/${pkgname}/files/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkpkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_sparkpkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}