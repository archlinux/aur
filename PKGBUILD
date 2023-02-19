# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-weiyunsync
_officalname=WeiyunSync
pkgver=3.0.0.620
_sparkpkgname=com.weiyunsync.spark
_sparkver=3.0.0spark1
pkgrel=1
epoch=
pkgdesc="WeiyunSync on Deepin Wine6.基于深度Wine6的微云同步助手"
arch=("x86_64")
url="https://www.weiyun.com/"
license=('custom:freeware')
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
provides=("Tencent")
install="deepin-wine-weiyunsync.install"
source=(
    "${_sparkpkgname}_${_sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://dldir1.qq.com/weiyun/WeiyunSyncInstall_Beta_${pkgver}_20230109_120158_r0.exe"
    "LICENSE::http://www.weiyun.com/xy.html"
    "deepin-wine-weiyunsync.install"
    "run.sh"
    )
sha256sums=('1c9361a9070ad2bfc85236397c75201c8e63374cc311514b68eae25877cadf84'
            '386b7a055ad3b2fc094a1a9ada9684041e3326820b55d5c628ae727b57ef4f4e'
            'cd38449194d309d607c42567df9b1670b4eee9ef63398cfd4f9bc95517d38803'
            '5176064feb5ba3a08e99ef4be8bf440957bdc3eae13b274d23cba1a9b4c951c1'
            '8e9f9bfec0a5d489f2e55b7c9670b6c4888a80bb8725030b27e57f22920e929b')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${provides}/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${provides}/${_officalname}"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${provides}/${_officalname}/${_officalname}-${pkgver}.exe"
       
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
       
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.svg" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.svg"
    sed 's/com.weiyunsync.spark/deepin-wine-weiyunsync/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install  "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
