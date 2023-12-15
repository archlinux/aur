# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=adrive
pkgname="deepin-wine-${_appname}"
_pkgname="com.${_appname}.deepin"
_officalname=aDrive
pkgver=4.9.16
_deepinver=2.2.6deepin8
pkgrel=1
pkgdesc="Aliyun aDrive on Deepin Wine 6"
arch=("x86_64")
url="https://www.aliyundrive.com"
license=('custom')
conflicts=("${_appname}")
provides=("${_appname}")
depends=(
    'deepin-wine6-stable'
    'deepin-wine-helper'
    'xdg-utils'
    'lib32-glibc'
    'hicolor-icon-theme'
    'lib32-libxext'
    'lib32-libx11'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://cdn.aliyundrive.net/downloads/apps/desktop/${_officalname}-${pkgver}.exe"
    "${pkgname}.install"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_alibaba_group/suit_bu1_alibaba_group202102022125_53871.html"
    "${pkgname}.sh"
)
sha256sums=('9db53833b86b3ad941f23bdefa354170ec432c3b15980621e8011261d5617843'
            'bb36e6204d6be7073ca9b13f273b55f788cd48dc9a849251a26b3239438b08d4'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            '44ca9db05446acc42bd3c1d7dfe2d68b286b23203ab2105b9f77a9b8110205d2'
            '797f5242f1d12ce443903193b4ab7f95d013cd55d9a9610749f6b4602f4308b2')
build() {
    sed "s|@bottlename@|Deepin-${_officalname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|/@pathname@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"

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
    sed -e "s|${_pkgname}|${pkgname}|g" -e "s|internet|Network|g" -e "s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 24x24 32x32 48x48 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/${pkgname}.sh" -t "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
