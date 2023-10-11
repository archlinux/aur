# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-baiduwenku
_pkgname=com.baidu.wenku.spark
_officalname=BaiduWenku
_installname=wenku-pc
pkgver=1.2.8
sparkver=1.1.7spark1
pkgrel=2
pkgdesc="Baidu wenku Client on Deepin Wine6.一款由百度发布的供网友在线分享文档的平台"
arch=('x86_64')
url="https://wenku.baidu.com"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'sh' 'p7zip')
optdepends=('wqy-microhei' 'wqy-zenhei')
provides=("Baidu")
install="${pkgname}.install"
source=("${pkgname}-${sparkver}_amd64.deb::https://d.store.deepinos.org.cn/store/office/${_pkgname}/${_pkgname}_${sparkver}_amd64.deb"
    "${pkgname}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93%20Setup%20${pkgver}.exe"
    "LICENSE.html::https://edu-wenku.bdimg.com/v1/pc/protocols/help24-new.htm"
    "${pkgname}.install"
    "run.sh")
sha256sums=('d6f7fa0257c3cdfcc3f12df61d57b2d624f0f30b63cb5b15cbde9fc7de417f3e'
            '801bff0de9a49679d0dadfe9d0811c79185d0102d4609a401e060d1caa9e83c4'
            'e93a1b4112398eefd1d0688d126af3403226c4827a0e4f5f5ee40a97999cf222'
            '3cc53852b7bf733f9e6c28466dec84899d752983fed19fb5825b480b05952a77'
            'e228acf31512d1457b51a474950cf79514789bb861d8a59d350324103e7dd6c1')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"

    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"

    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_installname} ..."
    7z e -aoa "${srcdir}/${pkgname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/"
    rm -r "${srcdir}/tmp/drive_c/Program Files/" "${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/\$2"

    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
}
package() {
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/opt/apps" "${pkgdir}/opt"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}