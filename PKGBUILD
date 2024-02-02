# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> 
pkgname=deepin-wine-tencent-edu
pkgver=4.6.1.2
_pkgname=com.tencent.edu.deepin
_deepinver=3.0.3.55deepin6
_officalname=TXEDU
pkgrel=5
pkgdesc="Tencent Classroom on Deepin Wine 6.腾讯课堂"
arch=("x86_64")
url="https://ke.qq.com"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://down.qq.com/txedupc/EduInstall_${pkgver}_10193.exe"
    "LICENSE.html::${url}/article/645"
    "${pkgname}.sh"
)
sha256sums=('c61e98e1cff8eb5274c79499d807d08712f5092bff1e73c263849780c000da41'
            '0898729e7784b2fc63aad5cef7bda66a5a2853c3b156deea2280ede56ace218d'
            'e7c9efe5e722cfc9c66420d5d111202a28bbbdaa14832dfaa676e9da6e44c367'
            '6aa0967712976b4b294645843071e74111975c97026eec3ce9c8234a38484fde')
build() {
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@packagename@|${pkgname}|g" \
        -e "s|@appname@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"

    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"

    msg "Extracting latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/Tencent/EDU"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/\$PLUGINSDIR"

    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
}
package() {
    mkdir -p "${pkgdir}/opt/apps"
    cp -r "${srcdir}/opt/apps/${pkgname}" "${pkgdir}/opt/apps"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 32x32 48x48 128x128;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}