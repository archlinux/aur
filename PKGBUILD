# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> 
pkgname=deepin-wine-tencent-edu
pkgver=4.2.2.8
_pkgname=com.tencent.edu.deepin
_deepinver=3.0.3.55deepin6
_officalname=TXEDU
pkgrel=1
pkgdesc="Tencent Classroom on Deepin Wine 6"
arch=("x86_64")
url="https://work.weixin.qq.com/"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils')
conflicts=()
install="deepin-wine-tencent-edu.install"
source=(
    "${_pkgname}_${_deepinver}.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://down.qq.com/txedupc/EduInstall_4.2.2.8_10180.exe"
    "run.sh"
    "deepin-wine-tencent-edu.install"
)
md5sums=('e8cee4d0d9ca70eb239847e22aac045f'
         '74def420c9ea17e3b92ef9fc4988f66d'
         '9d023740585add41cc2398256e49f779'
         'd42fb9118bc2c1cdc2470cd24cbe564c')
 
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
          
    msg "Copying latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin"
    cp "${srcdir}/${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/Tencent/EDU/bin/"
   
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
