# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-douyin
_pkgname=com.douyin.spark
_officalname=douyin
_providername=ByteDance
pkgver=1.9.1
sparkver=1.7.1spark2
pkgrel=1
epoch=
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=("x86_64")
url="https://www.douyin.com"
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
provides=("ByteDance")
install="deepin-wine-douyin.install"
source=(
    "${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
	"${_officalname}-${pkgver}.exe::${url}/download/pc/obj/douyin-pc-client/7044145585217083655/releases/9962158/${pkgver}/win32-ia32/douyin-v${pkgver}-win32-ia32-douyinDownload1.exe"
	deepin-wine-douyin.install
    run.sh
    )
sha256sums=('ddb6e863b45e4eddee273119866e73de27b10efa5e57054933153fb442f1ce10'
            '1defbe3ae36b46be90006bbab237ce401c597a1bc6e9c21eb00368e035f7fa39'
            'e476028b1c94fe6a4d1a24e4b603667a39276c21dfbe76433c42cf64a73d16be'
            'd4740a8b43dd12f73892cef4dc35a219f1a26418fa43f37521ebc0b6e9dbad60')

prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7za x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files/${_providername}/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_officalname}"
    install -m644 "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_officalname}/${_officalname}-${pkgver}.exe"
    
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7za a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.douyin.spark/deepin-wine-douyin/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    sed 's/Video/AudioVideo/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"

    echo "Icon=deepin-wine-douyin.png" >> "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"

    rm -rf ${srcdir}/opt/apps/${_pkgname}/info
}
   
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
