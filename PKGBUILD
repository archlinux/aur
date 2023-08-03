# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=douyin
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.spark"
_providername=ByteDance
pkgver=2.6.0
sparkver=2.5.0spark6
pkgrel=1
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=('x86_64')
url="https://www.douyin.com"
_downurl="https://webcdn.m.qq.com"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=("${_appname}")
install="${pkgname}.install"
source=("${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
	"${_appname}-${pkgver}.exe::${_downurl}/spcmgr/download/${_appname}-v${pkgver}-win32-ia32-tencent.exe"
	"${pkgname}.install"
    "run.sh"
    "LICENSE.html::${url}/draft/douyin_agreement/douyin_agreement_user.html")
sha256sums=('d2913afe2d65b9b1840ed644182cb6ffb565c14538d42d035f13be5658247842'
            '5a1a7c3976488cf162c01700de111aee10155e13caedc750ec81a82ff55072dd'
            'e476028b1c94fe6a4d1a24e4b603667a39276c21dfbe76433c42cf64a73d16be'
            '4240d7a794ad28d3f199d56440f628e9a21521f8d4b8a7b866f692ea5360fd54'
            '04b79c505f956a56144ecd5df76034bf56959ffd1ab9c4524177f71666c0f369')
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extracted_exe"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    17z e -aoa "${srcdir}/${_appname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"    
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
