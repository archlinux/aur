# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=ecloud
pkgname="deepin-wine-${_officalname}"
pkgver=6.6.0
_sparkname=cn.189.cloud.spark
_sparkver="6.5.8spark6"
pkgrel=1
pkgdesc="China Telecom eCloud Client on Deepin Wine6.天翼云盘客户端,文件云端存储,从此抛弃U盘,文件自动同步,便捷上传下载."
arch=("x86_64")
url="https://cloud.189.cn/"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'lib32-libx11'
    'lib32-libxext'
    'lib32-glibc'
    'sh'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
makedepends=(
    'p7zip'
)
conflicts=()
provides=("${_officalname}")
install="${pkgname}.install"
source=(
    "${pkgname}-${_sparkver}.deb::https://d.store.deepinos.org.cn/store/network/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://github.com/zxp19821005/My_AUR_Files/releases/download/${_officalname}-v${pkgver}/${_officalname}_${pkgver}.exe"
    "LICENSE.html"
    "${pkgname}.sh"
)
sha256sums=('ad85da24a5244be02f9049cc34d1de8dbf0bc813e6192ff93b7e4c044d0cb627'
            '0eef06eca3ec9f268db716c921967d48fb887ae4fe63fae1a3c15c03cfdd7597'
            '1ed45cc3d1362c9a00f995dc22ad452203fc9e786f703e8d73eed4ecc3b97d35'
            '66ad05612e723550149dc42c6a82ef1e44cbd89de94617a88eb5fa7cb43ce383')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    sed -e "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g" \
        -e "s|Icon=${_sparkname}|Icon=${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
      
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$PLUGINSDIR" "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$TEMP"
      
    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
}
package() {
    mkdir -p "${pkgdir}/opt/apps"
    cp -rf "${srcdir}/opt/apps/${pkgname}" "${pkgdir}/opt/apps"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}