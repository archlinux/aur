# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-baiduwenku
_pkgname=com.baidu.wenku.spark
_officalname=BaiduWenku
_installname=wenku-pc
pkgver=1.2.0
sparkver=1.1.7spark1
pkgrel=1
epoch=
pkgdesc="Baidu wenku Client on Deepin Wine6.一款由百度发布的供网友在线分享文档的平台"
arch=("x86_64")
url="https://wenku.baidu.com"
license=('custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("Baidu")
install="deepin-wine-baiduwenku.install"
source=(
    "${_pkgname}_${sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/office/${_pkgname}/${_pkgname}_${sparkver}_amd64.deb"
    "${_officalname}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/%E7%99%BE%E5%BA%A6%E6%96%87%E5%BA%93%20Setup%201.2.0.exe"
    "LICENSE::${url}/portal/browse/help#help/24"
    "deepin-wine-baiduwenku.install"
    "run.sh"
    )
sha256sums=('d6f7fa0257c3cdfcc3f12df61d57b2d624f0f30b63cb5b15cbde9fc7de417f3e'
            'b1ef2994618ac95f4ea1ff402ec35958e9ce5b8189988d2d7342d627e0a71dc8'
            '2a7148bb687aed4dcd3e0cb9dcece348d678f4d24da303d0128f2ae3d111f13d'
            '3cc53852b7bf733f9e6c28466dec84899d752983fed19fb5825b480b05952a77'
            'de3605767d811aa574219dbafb1bbafece6c33ae00e5dfe56b74b0779f69e9ef')
  
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/apps/${_pkgname}" "${pkgdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${pkgdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
      
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_installname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}" "${srcdir}/tmp/drive_c/Program Files/"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_installname}/${_officalname}-${pkgver}.exe"
      
    msg "Repackaging app archive ..."
    rm -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${pkgdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
      
    mv "${pkgdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.baidu.wenku.spark/deepin-wine-baiduwenku/g' -i "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf ${pkgdir}/opt/apps/${_pkgname}/info
 
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    rm -r "${pkgdir}/opt/apps/${pkgname}/info"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}