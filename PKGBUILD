# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ximalaya
pkgname="deepin-wine-${_appname}"
pkgver=4.0.0.804
_sparkpkgname="com.${_appname}.spark"
_sparkver=4.0.0spark9
pkgrel=4
pkgdesc="喜马拉雅，是中国领先的音频分享平台。用声音分享人类智慧，用声音服务美好生活，做一家人一辈子的精神食粮，是平台的使命和初心。"
arch=("x86_64")
url="https://www.ximalaya.com"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'deepin-wine-helper' 'xdg-utils' 'sh' 'lib32-glibc')
optdepends=('wqy-microhei' 'wqy-zenhei')
makedepends=('p7zip')
provides=("${_appname}")
conflicts=("${_appname}" "${_sparkpkgname}")
install="${pkgname}.install"
source=("${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_appname}-${pkgver}.exe::${url}/down/lite/v2?client=win&channelId=99&subChannelId=100002"
    "LICENSE.html"
    "${pkgname}".install
    "run.sh")
sha256sums=('95834bc4ad16e4822331adac43b5f4feb9aeba50d103788a2cefad72cd8dc941'
            '180ce17541504177a96194d25a7175030023479c1bf47df788b1a82c4c3790d1'
            '95b52ed4c2b0ef19d4a091da847c7dd20761699aa63a12bf933fa2064f49cd01'
            '6f2e0e87fe8f1abbd947d311b0fcad50c9c4c22a2531b8277db4e28e0a2d78dd'
            'f90d36cc56a4d4a0469c36bbd33597871e2a609b27d187a625d63d005a2b2332')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
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
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/opt/apps/${_sparkpkgname}/"{entries,files} "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/${pkgname}/files/"
    ln -sf "/opt/${pkgname}/files/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkpkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_sparkpkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/usr/share/maps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}