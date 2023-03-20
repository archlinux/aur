# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> 
pkgname=deepin-wine-tencent-edu
pkgver=4.3.1.1
_pkgname=com.tencent.edu.deepin
_deepinver=3.0.3.55deepin6
_officalname=TXEDU
pkgrel=1
pkgdesc="Tencent Classroom on Deepin Wine 6.腾讯课堂"
arch=("x86_64")
url="https://ke.qq.com/"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils')
conflicts=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://down.qq.com/txedupc/EduInstall_${pkgver}_10190.exe"
    "run.sh"
    "${pkgname}.install"
)
sha256sums=('c61e98e1cff8eb5274c79499d807d08712f5092bff1e73c263849780c000da41'
            'd994472305a759ef02f5b27808351f8fd4e66c60a55c2aa85b48aa28c32bc56b'
            '7149484a71f6e4c0f11e832097f9561f5222d1b091d9bc1e9810114b30ccc172'
            '605dc1c32ea98be6d00312a7b98100b9b89cd43258d9b84a8572bc5739199e07')
 
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
          
    msg "Extracting latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin"
    7z e -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin/"
   
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
    sed 's/com.tencent.edu.deepin/deepin-wine-tencent-edu/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for i in 32x32 48x48 128x128;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
