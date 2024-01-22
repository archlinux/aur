# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=eCloud
_officalname=ecloud
pkgname="deepin-wine-${_officalname}"
pkgver=6.6.0spark7
_sparkname=cn.189.cloud.spark
pkgrel=1
pkgdesc="China Telecom eCloud Client on Deepin Wine6.天翼云盘客户端,文件云端存储,从此抛弃U盘,文件自动同步,便捷上传下载."
arch=("x86_64")
url="https://cloud.189.cn/"
license=('LicenseRef-freeware')
depends=(
    'deepin-wine8-stable'
    'spark-dwine-helper'
    'xdg-utils'
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
    "${pkgname}-${pkgver}.deb::https://mirrors.sdu.edu.cn/spark-store/store/network/${_sparkname}/${_sparkname}_${pkgver}_all.deb"
    "LICENSE.html"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('ece91916014866f04f760ef42206c905c0608c18e0a325b2ba07fcf23a6a4f2a'
            '1ed45cc3d1362c9a00f995dc22ad452203fc9e786f703e8d73eed4ecc3b97d35'
            '48e7a80b45d16321f794020aaa9be9c46ba76d2da8c52d86f6e2bbfe6abdf13b'
            'b32b70af974ed22c7a63bb4d655ddc2f1059374b6b2553637a365272a01da54d')
build() {
    sed "s|@bottlename@|${_appname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@pathname@|${_officalname}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    sed -e "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g" \
        -e "s|Icon=${_sparkname}|Icon=${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
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