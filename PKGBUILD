# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tencent-docs
pkgname="${_pkgname}-electron-bin"
_zhsname='腾讯文档'
_appname=tdappdesktop
_cfgname=TDAppDesktop
pkgver=3.9.20
_electronversion=25
pkgrel=1
pkgdesc="Tencent Docs - Make collaboration more efficient and creation easier.(Prebuilt version.Use system-wide electron)${_zhsname},让协作更高效，创作更轻松."
arch=(
    'aarch64'
    'x86_64'
)
url="https://docs.qq.com/home/"
_dlurl="https://desktop.docs.qq.com/Installer"
license=("LicenseRef-custom")
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${_pkgname}"
    "${pkgname%-bin}"
    "${_appname}"
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
source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::${_dlurl}/30001/${pkgver}/TencentDocs-arm64.rpm")
source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${_dlurl}/30001/${pkgver}/TencentDocs-x64.rpm")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('ed8a7865c5ebd645bae03ca86a93109f46c1205cce5b81d88f6be224316e80c6')
sha256sums_x86_64=('b74da3782c4c8e0d44ccbd981d79e000f10eb993cd09ed49e35bab27b36a7d70')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_cfgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    asar e "${srcdir}/opt/${_zhsname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/build" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/@tencent/"{clipboard-*,docs-*,pssuspend,windows*}
    rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/@tencent/node-database/prebuilds/"{darwin-*,win32-*}
    rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/leveldown/prebuilds/"{android-*,darwin-*,win32-*}
    rm -rf "${srcdir}/opt/${_zhsname}/resources/fta"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/@tencent/node-database/prebuilds/"{linux-arm,linux-x64*}
            rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/leveldown/prebuilds/"{linux-arm,linux-x64}
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/@tencent/node-database/prebuilds/linux-arm"*
            rm -rf "${srcdir}/opt/${_zhsname}/resources/app.asar.unpacked/node_modules/leveldown/prebuilds/linux-arm"*
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhsname}/resources/"{app.asar.unpacked,*.lproj,file-icons,logos,template,vbs,*.json} \
        "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" \
        "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/${_zhsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}