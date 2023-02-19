# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-ecloud
_officalname=ecloud
pkgver=6.5.5
_sparkpkgname=cn.189.cloud.spark
_sparkver=6.5.3spark4
pkgrel=1
epoch=
pkgdesc="China Telecom eCloud Client on Deepin Wine6.天翼云盘客户端,文件云端存储,从此抛弃U盘,文件自动同步,便捷上传下载."
arch=("x86_64")
url="https://cloud.189.cn/"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("ecloud")
install="deepin-wine-ecloud.install"
source=(
    "${_sparkpkgname}_${_sparkver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/${_officalname}_${pkgver}_setup.exe"
    "LICENSE::https://cloud.189.cn/web/static/template/help.html"
    "deepin-wine-ecloud.install"
    "run.sh"
    #"start.sh"
    #"kill.sh"
    )
sha256sums=('81fc28209d8db1d33530d4b5553444b54d11ed8735cbb46085a8072c39eed5a7'
            '4f05e04a28597c4ac8fe2805a23917afaccfcb2f42efa5b9f6f11a05ecc97363'
            'f9679b8c9d5c0b91d5bd05962ef42f245bb6b5e34c1ac769db525edec1abaa70'
            'b78b04279fd026f3b9a71e71cb0fa5ed4b776c5592eafbcdda21d99ad71957cf'
            '02abe1f95dd9a8fb1b3d1f382db087f92853b0054612d053b1552cf4ba06c0b6')
  
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
      
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    #rm -r "${srcdir}/opt/apps/${pkgname}/files/dlls"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_officalname}/${_officalname}-${pkgver}.exe"
      
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
      
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/cn.189.cloud.spark/deepin-wine-ecloud/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" 
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
}
     
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install  "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    #install -Dm755 "start.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    #install -Dm755 "kill.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
