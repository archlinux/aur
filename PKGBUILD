# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xiguavideo
pkgname="deepin-wine-${_appname}"
_pkgname=com.ixigua.xigua-video.spark
pkgver=1.0.7
_deepinver=1.0.6spark1
pkgrel=1
pkgdesc="XiGua Video on Deepin Wine 6"
arch=('x86_64')
url="https://www.ixigua.com"
license=('custom:freeware')
conflicts=(
    "${_appname}"
    "${pkgname}"
)
provides=("${_appname}=${pkgver}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'sh'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-zenhei'
    'wqy-microhei'
)
noextract=("${_appname}-${pkgver}.exe")
install="${pkgname}.install"
source=(
    "${_appname}-${_deepinver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${_deepinver}_amd64.deb"
    "${_appname}-${pkgver}.exe::https://lf-xigua-pc.ixigua.com/obj/xigua-video-electron/6922326164589517070/releases/11210180/${pkgver}/win32/xigua-video-${pkgver}-default.exe"
    "${pkgname}.install"
    "LICENSE.html"
    "${pkgname}.sh"
)
sha256sums=('18b2277ea23d6a61d45197b422b99a53e7f5f5e2764f1f5616443984598af321'
            'f3b4277641de91d3838ede96a56e25257ea869b382cda40ae1c7b53dba4e98a7'
            '660a7ebea59ed424362575d5cd2f13d661d27e7be36a2923035a2197e2f573da'
            '37bfde6970ae8f7575aa29b1146a5662e0780f6ceb5b99128bca6ae6ebdc0b09'
            '7867b577c69a76e85a49472f44be6794e497add5bf3443b884774457e3407b11')
build() {
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

    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}