# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-welink
_pkgname=com.huaweicloud.welink.spark
_officalname=WeLink
pkgver=7.25.5.437
sparkver=7.21.3.403
pkgrel=1
epoch=
pkgdesc="华为数字化办公实践,服务政企、高校等主要客户,是全场景安全、智能、的数字化办公平台,帮助AnyBody、AnyWhere、AnyDevice、doAnyBusiness4A办公。"
arch=("x86_64")
url="https://www.huaweicloud.com/product/welink.html"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'spark-transhell'
    'xdg-utils'
    'wqy-microhei'
    'wqy-zenhei'
    )
optdepends=( )
conflicts=()
provides=("Huawei")
install="${pkgname}.install"
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://nginx-obs-bj4.obs.cn-north-4.myhuaweicloud.com/${_officalname}_setup.exe"
    ${pkgname}.install
    run.sh)
sha256sums=('56273fdd2c74d0b310a4513c49cfb2ee07ab89f97312ff871c1b6d9c6b25279c'
            '476f51f32ecab6c5683189ce596bfd52c7220fc7d6b9b5a95f6a92c7422c3d34'
            'd0f49dc030924f3a6ae84ca17e7b5148ad5ce669b7b20ff5ff37a5253cfefce2'
            'a9778c03f527836e937eb890cb8b948bd869e96985d53ca15afc7a876425e909')
 
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
     
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname}-${pkgver}.exe"
     
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
     
    sed 's/chat/Network/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    sed 's/com.huaweicloud.welink.spark/deepin-wine-welink/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    sed 's/Icon/#Icon/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    echo "Icon=deepin-wine-welink.png" >> "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
    
package() {
    cp -r "${srcdir}/opt/" "${pkgdir}/opt/"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
