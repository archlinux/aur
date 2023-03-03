# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-welink
_pkgname=com.huaweicloud.welink.spark
_officalname=WeLink
pkgver=7.25.5.437
_sparkver=7.21.3.403
pkgrel=3
epoch=
pkgdesc="华为数字化办公实践,服务政企、高校等主要客户,是全场景安全、智能、的数字化办公平台,帮助AnyBody、AnyWhere、AnyDevice、doAnyBusiness4A办公。"
arch=("x86_64")
url="https://www.huaweicloud.com/product/welink.html"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper-git' 'spark-transhell' 'xdg-utils')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_pkgname}/${_pkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://welink.huaweicloud.com/download/WeLink_setup.exe"
    ${pkgname}.install
    run.sh)
sha256sums=('56273fdd2c74d0b310a4513c49cfb2ee07ab89f97312ff871c1b6d9c6b25279c'
            '476f51f32ecab6c5683189ce596bfd52c7220fc7d6b9b5a95f6a92c7422c3d34'
            'd3f310b0d94bc630700afec6d0786edc1176ca28def75b518167deba1965288a'
            '0f5cf40fbcf31250db95a5b1e4d1011f1b1f3bdfb17398578065ffcb2a573e48')
 
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_pkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"    
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}/" "${srcdir}/tmp/drive_c/Program Files (x86)"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname}-${pkgver}.exe"     
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"     
    sed 's/chat/Network/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/com.huaweicloud.welink.spark/deepin-wine-welink/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf "${pkgdir}/opt/apps/${pkgname}/info"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    chown -R root:root "${pkgdir}"
}
