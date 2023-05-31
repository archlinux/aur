# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_pkgdownloadname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=2.5.31
_sparkpkgname=cn.quarkclouddrive.spark
_sparkver=2.5.1spark1
pkgrel=2
pkgdesc="夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。"
arch=("x86_64")
url="https://pan.quark.cn/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("Quark")
install="${pkgname}.install"
source=("${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_installpkgpath}-${pkgver}.exe::https://pdds.quark.cn/download/stfile/ddjemdljmdehdflfm/${_pkgdownloadname}-v${pkgver}-release-pckk%40other_ch-20230511181042.exe"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_uc/suit_bu1_uc202002251416_20839.html"
    "${pkgname}.install"
    "run.sh")
sha256sums=('a7426b5b1fac66aa464b62d81740d5c86067f6bd00d64d0dd9708f2b05b91b04'
            '2df021c009ed9bbfb44c3d7ba8cddbb1e7bfb2c8908b032ab5cc72cfc15e57ff'
            'f16c57190147ec7c09cbcf0711956ab63b7af9f7e3713a23961a85e5859d1753'
            'd7f46cae43addb386fd3dddf469530b6942143c2a4ce00e1b92d7f256ed90b70'
            'ab9e0d1d1cbb7b6c5ee5379eeec12b956fff3b747989f4e5256b29cc6b449863')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    install -m644 "${_installpkgpath}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}/${_pkgdownloadname}.exe"
       
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"

    sed 's|cn.189.cloud.spark|deepin-wine-quarkclouddrive|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}