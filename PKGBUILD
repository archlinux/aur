# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=douyin
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.spark"
_providername=ByteDance
pkgver=3.4.0
_sparkver=2.9.2spark7
pkgrel=2
pkgdesc="douyin,record beautify life;抖音，记录美好生活"
arch=('x86_64')
url="https://www.douyin.com"
_downurl="https://github.com/zxp19821005/My_AUR_Files"
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
	"${_appname}-${pkgver}.exe::${_downurl}/releases/download/${_appname}-v${pkgver}/${_appname}-v${pkgver}.exe"
    "LICENSE-${pkgver}.html"
    "${pkgname}.sh"
)
sha256sums=('f5bb3df57822718590e0bc432ed33f1548350add863a11e6a39058ea784c7c17'
            '5f50da1063c6cb68ee5ed2610a381cba79893689054644a70864a798be315bc1'
            '8a18c6c9d84fe0c25f838ced53aef6b031c58ab18ce687f0b0432599f65f4596'
            '2449301dc19b0fb82afaa7692f2e74cc8bad01296c7d3c5ac6e4f09bcc7f68ae')
build() {
    sed -e "s|@bottlename@|Deepin-${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${_appname}|g" \
        -e "s|@packagename@|${pkgname}|g" \
        -e "s|@pathname@|${_providername}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
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
    install -Dm644 "LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}