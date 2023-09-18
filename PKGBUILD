# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_downname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=2.5.46
_sparkpkgname=cn.quarkclouddrive.spark
_sparkver=2.5.39spark2
pkgrel=2
pkgdesc="夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。"
arch=("x86_64")
url="https://pan.quark.cn/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh' 'p7zip')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=("${_officalname}")
provides=("Quark")
install="${pkgname}.install"
source=("${_sparkpkgname}_${_sparkver}_amd64.deb::https://d.store.deepinos.org.cn/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_amd64.deb"
    "${_installpkgpath}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/${_downname}-v${pkgver}-release-pckk@tencent_promote-20230822152425%20(1).exe"
    "LICENSE.html"
    "${pkgname}.install"
    "run.sh")
sha256sums=('28d43ab249de81f945c033d28938e8252edc20f2bac887efd4648be3d67cffae'
            'c420702180c344bbca373503ed7d33d6646d40712359d63dd2394332ca6154e0'
            'b8252eb8c22ea41cc43c9436f341a78cac19cbc71c3593fa1b042fc9136f6767'
            'd7f46cae43addb386fd3dddf469530b6942143c2a4ce00e1b92d7f256ed90b70'
            '729f0df646e061b61386d38f013151234034e00bb40dec9f281b0a9ab0cfab7c')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    install -m644 "${_installpkgpath}-${pkgver}.exe" -t "${srcdir}/tmp/drive_c/Program Files (x86)/${_installpkgpath}"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|${_sparkpkgname}|${pkgname}|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop"
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