# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tencent-docs
pkgname="${_pkgname}-electron-bin"
_zhsname="腾讯文档"
_appname=tdappdesktop
_cfgname=TDAppDesktop
pkgver=3.5.0
_electronversion=25
pkgrel=1
pkgdesc="腾讯文档 Tencent Docs - 让协作更高效，创作更轻松.使用系统Electron."
arch=(
    'aarch64'
    'x86_64'
)
url="https://docs.qq.com/home/"
_dlurl="https://github.com/V0IDPlusPlus/Tencent-Docs-Debian-Package-Archive"
license=("LicenseRef-custom")
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/v${pkgver}-${pkgrel}/LinuxTencentDocsArm64.deb")
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/v${pkgver}-${pkgrel}/LinuxTencentDocsAmd64.deb")
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('a74edc6d3d653ce8ed4357615af480cef94cb0fc17237e6efb9b7adcc7d2012b')
sha256sums_x86_64=('e7a287fd03f8487420e3d60964bfeac318f44755ef5c8a9a5a51980fed8c1d4b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_cfgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/build/"{main.bundle.js,879.e8c82fd9.chunk.js}
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"\/opt\/${_zhsname}\/${_appname}\"|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,channel-config.json,file-icons,logos,template,zh_CN.lproj} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" \
        "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/${_zhsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}