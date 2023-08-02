# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_pkgdownloadname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=2.5.42
_sparkpkgname=cn.quarkclouddrive.spark
_sparkver=2.5.39spark2
pkgrel=1
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
    "${_installpkgpath}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/${_pkgdownloadname}-v${pkgver}-release3-pckk@other_ch-20230726145926.exe"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/c_platform_service_agreement/20230516130129722/20230516130129722.html"
    "${pkgname}.install"
    "run.sh")
sha256sums=('28d43ab249de81f945c033d28938e8252edc20f2bac887efd4648be3d67cffae'
            '1ec8af3bf58ff13ecb6bd07e008ff59debeec1f2bf0bb81f271a102b835e84c5'
            'b8252eb8c22ea41cc43c9436f341a78cac19cbc71c3593fa1b042fc9136f6767'
            'd7f46cae43addb386fd3dddf469530b6942143c2a4ce00e1b92d7f256ed90b70'
            'eba321fb57fbe50feef198d71ef3d6affa33a8929896be2683921d0939ce5f1e')
   
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