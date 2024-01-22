# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-mcloud
_pkgname=com.139.yun.deepin
_officalname=mCloud
pkgver=7.7.1
_deepinver=7.2.0deepin2
_deepinurl=https://com-store-packages.uniontech.com
pkgrel=1
pkgdesc="CMCC 139 client on Deepin Wine 6.中国移动云盘 on Deepin Wine 6"
arch=("x86_64")
url="https://yun.139.com/"
license=('LicenseRef-custom')
conflicts=("mcloud")
depends=(
    'deepin-wine6-stable'
    'xdg-utils'
    'hicolor-icon-theme'
    'deepin-wine-helper'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::${_deepinurl}/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://img.zone139.com/m2012/controlupdate/v6/${_officalname}_Setup-001.exe"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "LICENSE.html::https://caiyun.feixin.10086.cn:7071/portal/templateView/initve.html?id=145&marketName=hcy_yhxy"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('ecc41143f5c0a96f17236e2f7a4c1e79eb601d1129674d89ea360999a93c6dcb'
            'cbe7b194f8b8ca9241aa5fadf168771a855523e177b5c85230d2e239097cbacf'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '5997490663bddd20190aed804aadbc064c05cd6ac9c30ff2fdfaf217226141c6'
            '6d0f2ff2ebe71e2890966c58decea4b9f4f8a7b957949c70e9d2e0e8c264a7f4'
            'e60c39abfbe1430b6967eedf6b9de074bceba11163265648461dcd27b6484e1f')
build() {
    sed "s|@bottomname@|${_officalname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottomname@|${_officalname}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extracted_exe"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Extract latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/${_officalname}/ ..."
    rm -r "${srcdir}/tmp/drive_c/deepin" "${srcdir}/tmp/drive_c/Program Files/Maxthon2" \
        "${srcdir}/tmp/drive_c/yidongyunpan" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Application Data/aDrive" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Application Data/ThinkMail" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Local Settings/Application Data/Programs" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Start Menu/Programs"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    7z e -aoa "${_officalname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"
    bsdtar -xf "${srcdir}/extracted_exe/app.7z" -C "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|${_pkgname}|${pkgname}|g;s|internet|Network|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 16x16 32x32 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}