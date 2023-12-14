# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-cntv-cbox
_pkgname=com.cctv.deepin
_officalname=CBox
pkgver=6.0.0.1
_deepinver=1.0.0deepin9
pkgrel=4
pkgdesc="CGTN CBox on Deepin Wine 6"
arch=("x86_64")
url="https://app.cctv.com/"
license=('custom:freeware')
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
    "${pkgname}-${pkgver}.exe::https://download.cntv.cn/cbox/v6/ysyy_v${pkgver}_1001_setup_x32.exe"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('6e6ca3250a3a82dd46b29df450f508eff74f22cebcead9890677210b0610a4bd'
            '669174dc392af7686906da61867cc0d259764c4a7479cb9de3367703f6d35842'
            '935c1e022bb2c524b50dce1c5d4e0a3985e80d1eaf59d7073d2ae425c07fb162'
            '42cb4cdfce4cf10374b61d5201ab6411e2e945f27f22fce56826da6abf286f31')
build() {
    sed "s|@appname@|${pkgname}|g;s|@appver@|${pkgver}|g" -i "${srcdir}/${pkgname}.sh"
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