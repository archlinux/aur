# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-weiyunsync
_officalname=WeiyunSync
pkgver=3.0.0.630
_sparkpkgname=com.weiyunsync.spark
_sparkver=3.0.0spark1
pkgrel=1
_provides="Tencent"
epoch=
pkgdesc="WeiyunSync on Deepin Wine6.基于深度Wine6的微云同步助手"
arch=("x86_64")
url="https://www.weiyun.com"
license=('custom:freeware')
depends=( 'deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'lib32-glibc' 'lib32-libx11' 'lib32-libxext' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("${_provides}")
install="${pkgname}.install"
source=("${_sparkpkgname}_${_sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://dldir1.qq.com/weiyun/${_officalname}Install_Beta_1_${pkgver}_20230413_145539_r0.exe"
    "LICENSE::${url}/xy.html"
    "${pkgname}.install"
    "run.sh")
sha256sums=('1c9361a9070ad2bfc85236397c75201c8e63374cc311514b68eae25877cadf84'
            '41c90c4587f7ae2801422f4ba29314550beaac2ae672cffb6110559e82f7c801'
            '2ac93d3863409e8feb3aac829601c916d63cb3a22419b28b597480d9651b83b7'
            '5176064feb5ba3a08e99ef4be8bf440957bdc3eae13b274d23cba1a9b4c951c1'
            '9ff3917c0e0b5af83d10aca9e012df0a84b11d3d972b9e992cddf8cd630f9677')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
       
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_provides}/${_officalname} ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_provides}/"
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_provides}/\$PLUGINSDIR"
       
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
       
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.svg" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.svg"
    sed 's|com.weiyunsync.spark|deepin-wine-weiyunsync|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
