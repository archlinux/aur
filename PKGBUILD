# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-aliyun-mail
_pkgname=com.aliyun.mail.deepin
_officalname=AliMail
_providername=Alibaba
pkgver=2.7.1.13834
_deepinver=1.6.7.0deepin2
pkgrel=8
pkgdesc="Aliyun Mail client on Deepin Wine 6"
arch=("x86_64")
url="https://mail.aliyun.com/"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'deepin-wine-helper'
    'xdg-utils'
    'gtk2'
)
makedepends=(
    'p7zip'
)
conflicts=("${pkgname}")
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://aliyun-alimail-desktop.oss-cn-hangzhou.aliyuncs.com/alimail/alimail-standard/latest/${_officalname}.exe"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "LICENSE.html::https://help.aliyun.com/document_detail/464805.html"
    "${pkgname}.sh"
)
noextract=("${_officalname}-${pkgver}.exe")
sha256sums=('7e020363732d448a29a394afa3f6a5f2c54e600987af599e3a4b6c0edec3a61e'
            'f85e4a06c6da0781c4148dbe3ca4cf591996e445449aafb4198a747e22f9c1ce'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '4e1c8cac900b9eb08b5830106c32913d3a5680230e073648f788dad479fdb0f2'
            '2383c785f8b72f3d3a3529f0a9d8c2be0f03fc01b0b98218601eab421a3301e4')
build() {
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@sparkver@|${_deepinver}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@pathname@|${_officalname}|g" \
        -e "s|@providername@|${_providername}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Copying latest ${_officalname} files to ${srcdir}/tmp/drive_c/ProgramData/Alibaba/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/ProgramData/Alibaba"
    mkdir -p "${srcdir}/tmp/drive_c/ProgramData/Alibaba/${_officalname}"
    bsdtar -xf "${srcdir}/${_officalname}-${pkgver}.exe" -C "${srcdir}/tmp/drive_c/ProgramData/Alibaba/${_officalname}/"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/fonts/"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}