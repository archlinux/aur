# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-adrive
_pkgname=com.adrive.deepin
_officalname=aDrive
pkgver=4.1.2
_deepinver=2.2.6deepin8
pkgrel=1
pkgdesc="Aliyun aDrive on Deepin Wine 6"
arch=("x86_64")
url="https://www.aliyundrive.com/"
license=('unknown')
depends=(deepin-wine6-stable xdg-utils lib32-glibc hicolor-icon-theme lib32-libxext lib32-libx11)
optdepends=()
conflicts=()
install="deepin-wine-adrive.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive.exe?spm=aliyundrive.index.0.0.2d836f60Cqzbtc&file=aDrive.exe"
    "deepin-wine-adrive.install"
    "run.sh"
    )
sha256sums=('9db53833b86b3ad941f23bdefa354170ec432c3b15980621e8011261d5617843'
            '1987310397ab88ddfa46c601630d36d628db4d39166ca9294f678ec85eb4cec4'
            '592a72685f9f3b69015259015d9eaa9701dbca5ef8289e178f89ee4c7311c1f6'
            '78663cc7aa1bdbe52e3f126812aaf20408d55a8bbd0ae0511a0c9d7efcb999d3')
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files/${_officalname}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"

    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    sed 's/com.adrive.deepin/deepin-wine-adrive/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    sed 's/Categories=internet/Categories=Network/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for i in 24x24 32x32 48x48 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
