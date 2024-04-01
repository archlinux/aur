# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-mcloud
_pkgname=com.139.yun.deepin
_officalname=mCloud
pkgver=8.0.1
_deepinver=7.2.0deepin2
_deepinurl=https://com-store-packages.uniontech.com
pkgrel=3
pkgdesc="CMCC 139 client on Deepin Wine 6.中国移动云盘 on Deepin Wine 6"
arch=("x86_64")
url="https://yun.139.com/"
license=('LicenseRef-custom')
conflicts=("mcloud")
depends=(
    'deepin-wine6-stable'
    'xdg-utils'
    'deepin-wine-helper'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::${_deepinurl}/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://yun.mcloud.139.com/${_officalname}Pc/v8010/${_officalname}_Setup-001.exe"
    "LICENSE.html::https://caiyun.feixin.10086.cn:7071/portal/templateView/initve.html?id=145&marketName=hcy_yhxy"
    "${pkgname}.sh"
)
sha256sums=('ecc41143f5c0a96f17236e2f7a4c1e79eb601d1129674d89ea360999a93c6dcb'
            'ea2555db5087be3419ec898da58157b07305f25fa0499ef4f1fdfcb4c9bebbbb'
            'e53db97fd17c2d3b799d5f97801a71f27ba8c45133645d4eb424a3a9067b681e'
            '4c549967da523dc6bbb551df00ca06f0000438c8f7f967318dda40b8390f2f20')
build() {
    sed -e "s|@bottomname@|${_officalname}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
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
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    7z e -aoa "${_officalname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"
    bsdtar -xf "${srcdir}/extracted_exe/app.7z" -C "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r -snl -snh "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|${_pkgname}|${pkgname}|g;s|internet|Network|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    for _icons in 16x16 32x32 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}