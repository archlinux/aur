# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> 
pkgname=deepin-wine-tencent-edu
pkgver=4.6.1.1
_pkgname=com.tencent.edu.deepin
_deepinver=3.0.3.55deepin6
_officalname=TXEDU
pkgrel=1
pkgdesc="Tencent Classroom on Deepin Wine 6.腾讯课堂"
arch=("x86_64")
url="https://ke.qq.com"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme' 'sh')
conflicts=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://down.qq.com/txedupc/EduInstall_${pkgver}_10193.exe"
    "run.sh"
    "${pkgname}.install"
    "LICENSE.html::${url}/article/645"
)
sha256sums=('c61e98e1cff8eb5274c79499d807d08712f5092bff1e73c263849780c000da41'
            '8d111baa69311355aacfe6640d162a645165f6fe4ed8145861b50d963eac6889'
            '4c4c79f3248f8829afb1db6a04ebb21e4c4f40f57a55be081c6ccc2f2b7b2245'
            '605dc1c32ea98be6d00312a7b98100b9b89cd43258d9b84a8572bc5739199e07'
            'e7c9efe5e722cfc9c66420d5d111202a28bbbdaa14832dfaa676e9da6e44c367')
 
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
          
    msg "Extracting latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/Tencent/EDU"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/\$PLUGINSDIR"
   
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed 's|com.tencent.edu.deepin|deepin-wine-tencent-edu|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 32x32 48x48 128x128;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}