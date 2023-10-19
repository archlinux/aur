# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=douyin
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.spark"
_providername=ByteDance
pkgver=2.9.2
sparkver=2.5.0spark6
pkgrel=1
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=('x86_64')
url="https://www.douyin.com"
_downurl="https://webcdn.m.qq.com/spcmgr/download"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'sh')
makedepends=('p7zip')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=("${_appname}")
install="${pkgname}.install"
source=("${_pkgname}_${sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${sparkver}_i386.deb"
	"${_appname}-${pkgver}.exe::${_downurl}/${_appname}-v${pkgver}-win32-ia32-tencent.exe"
	"${pkgname}.install"
    "run.sh"
    "LICENSE.html::${url}/draft/douyin_agreement/douyin_agreement_user.html")
sha256sums=('d2913afe2d65b9b1840ed644182cb6ffb565c14538d42d035f13be5658247842'
            '8532e53e95730513b88387a690ddef1211154488992f339510a48028970e55f3'
            'e476028b1c94fe6a4d1a24e4b603667a39276c21dfbe76433c42cf64a73d16be'
            'd79124897371fb614d86d7e6b54d189442284b83b04028bfcd83dcddf39473d6'
            '80d1bfb7a530d4497e8be2305e2ee662a25c4d6bc2e8f1b3a24642eec7efd054')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extracted_exe"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    7z e -aoa "${srcdir}/${_appname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"    
    msg "Extract latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname} ..."
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname}"
    bsdtar -xf "${srcdir}/extracted_exe/app.7z" -C "${srcdir}/tmp/drive_c/Program Files/${_providername}/${_appname}"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/"*
    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}