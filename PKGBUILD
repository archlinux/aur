# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-baiduwenku
_pkgname=com.baidu.wenku.spark
_officalname=BaiduWenku
_bottlename="Deepin-${BaiduWenku}"
_installname=wenku-pc
pkgver=2.0.2
sparkver=1.2.8spark2
pkgrel=1
pkgdesc="Baidu wenku Client on Deepin Wine6.一款由百度发布的供网友在线分享文档的平台"
arch=('x86_64')
url="https://wenku.baidu.com"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
provides=("baiduwenku")
install="${pkgname}.install"
source=(
    "${pkgname}-${sparkver}.deb::https://d.store.deepinos.org.cn/store/office/${_pkgname}/${_pkgname}_${sparkver}_all.deb"
    "${pkgname}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93%20Setup%20${pkgver}.exe"
    "LICENSE.html::https://edu-wenku.bdimg.com/v1/pc/protocols/help24-new.htm"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('06262e7ba445d996cc4cef8c555474ca8b6eef4ac676e2bb86b00df6103d45b4'
            '866d5192cd751d39c41d3a26464ae217954d4cef7c83a68aa194267c6a78ee30'
            'e93a1b4112398eefd1d0688d126af3403226c4827a0e4f5f5ee40a97999cf222'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            '07249f82aac06fcb7a60b13e544b6bfef7282b74a962aa90c8f847f070b92e74')
build() {
    sed "s|@bottlename@|${_bottlename}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|${_bottlename}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@packagename@|${pkgname}|g" \
        -e "s|@path@|${_installname}|g" \
        -i "${srcdir}/${pkgname}.sh"
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
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}