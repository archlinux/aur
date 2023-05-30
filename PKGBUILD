# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiguavideo
pkgname="deepin-wine-${_appname}"
_pkgname=com.ixigua.xigua-video.spark
pkgver=1.0.6
_deepinver=1.0.4spark0
pkgrel=1
pkgdesc="XiGua Video on Deepin Wine 6"
arch=('x86_64')
url="https://www.ixigua.com"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-zenhei' 'wqy-microhei')
conflicts=()
noextract=("${_appname}-${pkgver}.exe")
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${_deepinver}_amd64.deb"
    "${_appname}-${pkgver}.exe::https://lf-xigua-pc.ixigua.com/obj/xigua-video-electron/6922326164589517070/releases/10207798/${pkgver}/win32/xigua-video-${pkgver}-default.exe"
    "${pkgname}.install"
    "run.sh"
    "LICENSE.html::${url}/privacy_policy/"
    )
sha256sums=('8f30dc77792de6c406a3f5c085fc6cc4a8a2dcda4ac5eeae456dcb4a5cfc6f9b'
            '950e4bb20855c1c0e6255028d8d500136f8c42a0922f511f9493e90b263179bd'
            '660a7ebea59ed424362575d5cd2f13d661d27e7be36a2923035a2197e2f573da'
            '8fe7d242ba3ade59459532bc77a85a43a34f4abaef228b1f975c5a2d52799461'
            'fd8abc277aaa5e6ff7c608d3f3c4076806ebb3b8354940d30c7998f3f7f6640e')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/temp"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"

    msg "Extracting latest ${_officalname} files ..."
    7z e -aoa "${srcdir}/${_appname}-${pkgver}.exe" -o"${srcdir}/temp"
    bsdtar -xf "${srcdir}/temp/app-32.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/xigua-video-electron"

    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"

    sed "s|${_pkgname}|${pkgname}|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}