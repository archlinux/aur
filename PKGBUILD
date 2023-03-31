# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_pkgdownloadname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=2.5.17
_sparkpkgname=cn.quarkclouddrive.spark
_sparkver=2.5.1spark1
pkgrel=1
epoch=
pkgdesc="夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。"
arch=("x86_64")
url="https://pan.quark.cn/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper-git' 'xdg-utils')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("Quark")
install="${pkgname}.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_installpkgpath}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/${_pkgdownloadname}-${pkgver}-win-release2.exe"
    "LICENSE::https://broccoli.uc.cn/apps/quark_icloud_pay/routes/service_help?uc_param_str=dsdnfrpfbivesscpgimibtbmnijblauputogpintnwktprchmt&uc_biz_str=S%3Acustom|C%3Atitlebar_hover_2"
    "${pkgname}.install"
    "run.sh"
    )
sha256sums=('a7426b5b1fac66aa464b62d81740d5c86067f6bd00d64d0dd9708f2b05b91b04'
            '11138dc2c415c28226323f4db1d495dbe5f49aad079dfc1f110ba3c2c3ac9ac3'
            '7b9b1a3ec72f29f0d38b2c0438942c22767d7adef8205ed0600ad080e921cb7b'
            'd7f46cae43addb386fd3dddf469530b6942143c2a4ce00e1b92d7f256ed90b70'
            '85b028b2d823bea5f2cc807996a34887cf4e26e40a59399f09724e3e76451a98')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    #rm -r "${srcdir}/opt/apps/${pkgname}/files/dlls"
    install -m644 "${_installpkgpath}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}/${_installpkgpath}-${pkgver}.exe"
       
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
       
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/cn.189.cloud.spark/deepin-wine-quarkclouddrive/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install  "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}