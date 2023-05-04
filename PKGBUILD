# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=douyin
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.spark"
_providername=ByteDance
pkgver=2.2.2
sparkver=2.0.0spark3
pkgrel=1
epoch=
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=('x86_64')
url="https://www.douyin.com"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("${_providername}")
install="${pkgname}.install"
source=(
    "${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
	"${_appname}-${pkgver}.exe::${url}/download/pc/obj/${_appname}-pc-client/7044145585217083655/releases/10334640/${pkgver}/win32-ia32/${_appname}-v${pkgver}-win32-ia32-${_appname}Download1.exe"
	"${pkgname}.install"
    "run.sh"
    "LICENSE.html::${url}/draft/douyin_agreement/douyin_agreement_user.html"
    )
sha256sums=('04a6abe0a5a4b4deff00996aaaf4f56367fccd2b2af6631a441daf5e59592961'
            '8e1521db02f2e5eda1fc6f5d3a6a37b3fd6494a70caefb8c35abbbf514fe32e5'
            'e476028b1c94fe6a4d1a24e4b603667a39276c21dfbe76433c42cf64a73d16be'
            '482d7cede340487ede6203cbaf10c9017f3d96da9b5bf75aa1b783efb6f8db9e'
            '04b79c505f956a56144ecd5df76034bf56959ffd1ab9c4524177f71666c0f369')

prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extracted_exe"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    7z e -aoa "${srcdir}/${_appname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"    
    msg "Extract latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname} ..."
    bsdtar -xf "${srcdir}/extracted_exe/app.7z" -C "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname}"
    
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's|com.douyin.spark|deepin-wine-douyin|g;s|Video|AudioVideo|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
}
   
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
