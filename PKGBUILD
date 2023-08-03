# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-baiduwenku
_pkgname=com.baidu.wenku.spark
_officalname=BaiduWenku
_installname=wenku-pc
pkgver=1.2.8
sparkver=1.1.7spark1
pkgrel=1
epoch=
pkgdesc="Baidu wenku Client on Deepin Wine6.一款由百度发布的供网友在线分享文档的平台"
arch=('x86_64')
url="https://wenku.baidu.com"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("Baidu")
install="${pkgname}.install"
source=("${_pkgname}_${sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/office/${_pkgname}/${_pkgname}_${sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93%20Setup%20${pkgver}.exe"
    "LICENSE.html::https://edu-wenku.bdimg.com/v1/pc/protocols/help24-new.htm"
    "${pkgname}.install"
    "run.sh")
sha256sums=('d6f7fa0257c3cdfcc3f12df61d57b2d624f0f30b63cb5b15cbde9fc7de417f3e'
            '801bff0de9a49679d0dadfe9d0811c79185d0102d4609a401e060d1caa9e83c4'
            '05d4561f53975e2e7d8abc6d5a8b7c9a3e5a641ba6999ec4ac51f3d255713956'
            '3cc53852b7bf733f9e6c28466dec84899d752983fed19fb5825b480b05952a77'
            'b293a800c44307c6df1c3a258f46ecffad335f86db495d6f6fd39b7e67510d78')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_pkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
      
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_installname} ..."
    7z e -aoa "${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/"
    rm -r "${srcdir}/tmp/drive_c/Program Files/" "${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/\$2"
      
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${pkgdir}/opt/apps/${pkgname}/info"
    7za a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|${_pkgname}|${pkgname}|g" -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
 
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}