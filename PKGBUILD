# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-welink
_pkgname=com.huaweicloud.welink.spark
_officalname=WeLink
pkgver=7.26.7
_sparkver=7.21.3.403
pkgrel=1
epoch=
pkgdesc="华为数字化办公实践,服务政企、高校等主要客户,是全场景安全、智能、的数字化办公平台,帮助AnyBody、AnyWhere、AnyDevice、doAnyBusiness4A办公。"
arch=("x86_64")
url="https://www.huaweicloud.com/product/welink.html"
license=('custom')
depends=(deepin-wine6-stable hicolor-icon-theme)
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_pkgname}/${_pkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://welink.huaweicloud.com/download/WeLink_setup.exe"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "${pkgname}.install"
    run.sh)
sha256sums=('56273fdd2c74d0b310a4513c49cfb2ee07ab89f97312ff871c1b6d9c6b25279c'
            'dcde4cfb0247c591099ca98735c2311b38eb89f88c7f0b65077682d1154ace66'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            'd3f310b0d94bc630700afec6d0786edc1176ca28def75b518167deba1965288a'
            '82e40c7d78bb4ff9b0a0758b71fa0994616ba68d1b61021c1aef6456c90ca661')
 
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
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
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
