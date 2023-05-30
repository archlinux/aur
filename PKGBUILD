# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-cntv-cbox
_pkgname=com.cctv.deepin
_officalname=CBox
pkgver=5.1.3.1
_deepinver=1.0.0deepin9
pkgrel=2
pkgdesc="CGTN CBox on Deepin Wine 6"
arch=("x86_64")
url="https://app.cctv.com/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme' 'sh')
optdepends=()
conflicts=()
install="${pkgname}.install"
source=("${_pkgname}-${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://download.cntv.cn/cbox/v5/ysyy_v${pkgver}_1001_setup.exe"
    "${pkgname}.install"
    "run.sh"
    "LICENSE.html::https://app.cctv.com/index.shtml#page6")
sha256sums=('6e6ca3250a3a82dd46b29df450f508eff74f22cebcead9890677210b0610a4bd'
            '2904bf840638f93e1b62d91eb28d3d67405721ada41da8e4620ee8d9819471ee'
            '935c1e022bb2c524b50dce1c5d4e0a3985e80d1eaf59d7073d2ae425c07fb162'
            '4f06309662aff34683acd80c066dba83d91b1eb690abf41171d3d0038e673f89'
            '2ffb70a616caf15b84f8672f03d209cf1bce1f3f80d16846e4b54d2e6c14da4a')
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extractfiles"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
        
    msg "Extracting latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/CNTV/${_officalname} ..."
    7z e -aoa "${_officalname}-${pkgver}.exe" -o"${srcdir}/extractfiles"
    bsdtar -xf "${srcdir}/extractfiles/${_officalname}.7z" -C "${srcdir}/tmp/drive_c/Program Files/CNTV/${_officalname}"
 
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    sed 's|com.cctv.deepin|deepin-wine-cntv-cbox|g;s|Categories=|Categories=AudioVideo;|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 32x32 128x128;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}