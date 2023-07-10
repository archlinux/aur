# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-adrive
_pkgname=com.adrive.deepin
_officalname=aDrive
pkgver=4.5.0.964
_deepinver=2.2.6deepin8
pkgrel=1
pkgdesc="Aliyun aDrive on Deepin Wine 6"
arch=("x86_64")
url="https://www.aliyundrive.com"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils' 'lib32-glibc' 'hicolor-icon-theme' 'lib32-libxext' 'lib32-libx11' 'sh')
optdepends=()
conflicts=()
install="deepin-wine-adrive.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive.exe"
    "deepin-wine-adrive.install"
    "run.sh"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_alibaba_group/suit_bu1_alibaba_group202102022125_53871.html"
    )
sha256sums=('9db53833b86b3ad941f23bdefa354170ec432c3b15980621e8011261d5617843'
            '216fe9050e58a5de4975803d7045d161656941b4dcf5a301e65e6caf355c147b'
            '592a72685f9f3b69015259015d9eaa9701dbca5ef8289e178f89ee4c7311c1f6'
            '41453f6ffe2c19da6f1b6712d84b7849033db626b659ddf93ed9ab7c59ab3479'
            'b6aa1fd4abf1ded8b208321fbaa73c083cf1376535b385217e3c96f62cbf9a91')
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/${_officalname} ..."
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/tmp/drive_c/Program Files/${_officalname}/"
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$PLUGINSDIR" \
        "${srcdir}/tmp/drive_c/Program Files/${_officalname}/\$TEMP"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed 's|com.adrive.deepin|deepin-wine-adrive|g;s|internet|Network|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 24x24 32x32 48x48 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" -t "${pkgdir}/opt/apps/${pkgname}/files"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}