# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=tencent-docs
pkgname="${_pkgname}-electron-bin"
_zhsname='腾讯文档'
_appname=tdappdesktop
_cfgname=TDAppDesktop
pkgver=3.10.1
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
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('b25dc69a281b29967e095770fddfcb354a859d7dfaff34cf0064fa6c6780b8d6')
sha256sums_x86_64=('090dec825f526a8c90b905c10308fd1f9bfb93755de505167d7024a15c2ff268')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_zhsname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_cfgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
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
