# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=douyin
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.spark"
_providername=ByteDance
pkgver=3.3.1
_sparkver=2.9.2spark7
pkgrel=1
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=('x86_64')
url="https://www.douyin.com"
_downurl="https://pc.qq.com"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
conflicts=("${_appname}")
install="${pkgname}.install"
source=(
    "${_pkgname}_${_sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store//store/video/${_pkgname}/${_pkgname}_${_sparkver}_all.deb"
	"${_appname}-${pkgver}.exe::https://sw.pcmgr.qq.com/ed3a076392d2482e1ba71ecca450f833/65ae2a86/spcmgr/download/${_appname}-v${pkgver}-win32-ia32-tencent.exe"
    "LICENSE.html::${url}/draft/douyin_agreement/douyin_agreement_user.html"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('f5bb3df57822718590e0bc432ed33f1548350add863a11e6a39058ea784c7c17'
            '7e210b64495ba8a6d1734636079de19e757bc2a292775caecc2c4349e3bff688'
            '80d1bfb7a530d4497e8be2305e2ee662a25c4d6bc2e8f1b3a24642eec7efd054'
            'e0f6a619e8bf2e30ce115bb4cef48a0e6635e93a324ed280bd9d5f39d7f42cd9'
            'ab98d48487a4682e7e01f05f0f6333f35d8fef346d568f916d0c052e5198f05d')
build() {
    sed "s|@bottlename@|Deepin-${_appname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|Deepin-${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${_appname}|g" \
        -e "s|@packagename@|${pkgname}|g" \
        -e "s|@pathname@|${_providername}|g" \
        -i "${srcdir}/${pkgname}.sh"
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
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}