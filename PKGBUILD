# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=ecloud
pkgname="deepin-wine-${_officalname}"
pkgver=6.5.6
_sparkname=cn.189.cloud.spark
_sparkver=6.5.5spark5
pkgrel=1
pkgdesc="China Telecom eCloud Client on Deepin Wine6.天翼云盘客户端,文件云端存储,从此抛弃U盘,文件自动同步,便捷上传下载."
arch=("x86_64")
url="https://cloud.189.cn/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'lib32-libx11' 'lib32-libxext' 'hicolor-icon-theme' 'lib32-glibc' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("${_officalname}")
install="${pkgname}.install"
source=(
    "${_sparkname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/${_officalname}_${pkgver}_setup(20230406105048).exe"
    "LICENSE.html::https://cloud.189.cn/web/static/licence/service_agreement.html"
    "${pkgname}.install"
    "run.sh"
    )
sha256sums=('029813330b1f897676e303682da68ee4a1f0de5a4153a75d9e964e5fdc823ccc'
            '625411e10d0555fdea1398c7421da9be8dda7c021378e70e735693243de98c5e'
            '989328a242ab9b271d86f3fd0c8e6c8e8bec79e3bac370d3f2b0f791954262cf'
            '982b789e17499e0be20fac34992e829681189dd44fbaab6891e1dc0c2b099f24'
            'e1bb6d45918332d2f66a7d9a2d9550c52fa0a76b12d4aabbeae17d312e5d7931')
  
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
      
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$PLUGINSDIR" "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$TEMP"
      
    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
}
     
package() {
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
    cp -rf "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    sed 's|cn.189.cloud.spark|deepin-wine-ecloud|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/run.sh" -t "${pkgdir}/opt/apps/${pkgname}/files/"
}
