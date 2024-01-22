# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-cntv-cbox
_pkgname=com.cctv.deepin
_officalname=CBox
pkgver=6.0.0.2
_deepinver=1.0.0deepin9
pkgrel=1
pkgdesc="CGTN CBox on Deepin Wine 6"
arch=("x86_64")
url="https://app.cctv.com/"
license=('LicenseRef-freeware')
depends=(
    'deepin-wine6-stable'
    'deepin-wine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${pkgname}-${pkgver}.exe::https://download.cntv.cn/cbox/v6/ysyy_v${pkgver}_1001_setup_x86.exe"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('6e6ca3250a3a82dd46b29df450f508eff74f22cebcead9890677210b0610a4bd'
            '519b04ac61a4b3e9422de238ce5e76d2fafefe58f93776f99494f3eb59005264'
            '2a9e70d0bc04f291d2d7d774ace08edb83c5f5d299ebd66920457c9d8fb336b7'
            'd12dfd865b8143a9c610fbaa966aed4b6c56557a2b1039469e9f637364cc16b5')
build() {
    sed "s|@appname@|${_officalname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@appname@|${_officalname}|g" \
        -e "s|@pkgname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|Audio Video;|AudioVideo;|g" \
        -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extractfiles"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Extracting latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/CNTV/${_officalname} ..."
    7z e -aoa "${pkgname}-${pkgver}.exe" -o"${srcdir}/extractfiles"
    bsdtar -xf "${srcdir}/extractfiles/${_officalname}.7z" -C "${srcdir}/tmp/drive_c/Program Files/CNTV/${_officalname}"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 32x32 128x128;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}