# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-aliyun-mail
_pkgname=com.aliyun.mail.deepin
_officalname=Alimail
pkgver=1.7.1.0
_deepinver=1.6.7.0deepin2
pkgrel=4
pkgdesc="Aliyun Mail client on Deepin Wine 6"
arch=("x86_64")
url="https://mail.aliyun.com/"
license=('custom')
depends=('deepin-wine6-stable' 'deepin-wine-helper' 'xdg-utils' 'gtk2' 'fontconfig' 'lib32-libxext' 'glib2' 'at-spi2-core' 'glibc' 'pango' \
    'lib32-libx11' 'libx11' 'sh' 'cairo' 'gdk-pixbuf2' 'freetype2' 'hicolor-icon-theme' 'lib32-glibc')
makedepends=('p7zip')
conflicts=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::https://com-store-packages.uniontech.com/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://aliyun-alimail-desktop.oss-cn-hangzhou.aliyuncs.com/Windows/lastestpackage/${_officalname}.exe"
    "${pkgname}.install"
    "run.sh"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "LICENSE.html::https://help.aliyun.com/document_detail/464805.html"
    )
sha256sums=('7e020363732d448a29a394afa3f6a5f2c54e600987af599e3a4b6c0edec3a61e'
            'e77647ddb278d3481ca0c59d672d674001f42bd66197efb4c0157382122c327d'
            '3ced7b78919cf5c29fd79e8a1170dd3923592aac6edfe162b8de579618826bb1'
            'e4c0149f310cea904db1681c319d618cbde2679dcac213f276d49eb93de2cec6'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            'f03025f50f682f7e515cb205fbc58084bfaaca6cd5e2bd91a7fdd4c33ee937e0')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Copying latest ${_officalname} files to ${srcdir}/tmp/drive_c/ProgramData/Alibaba/${_officalname} ..."
    rm -r "${srcdir}/tmp/drive_c/ProgramData/Alibaba/Alimail"
    mkdir -p "${srcdir}/tmp/drive_c/ProgramData/Alibaba/Alimail"
    cp "${srcdir}/${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/ProgramData/Alibaba/Alimail/"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/fonts/"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed -e "s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/com.aliyun.mail.deepin/files/run.sh\"|${pkgname}|g" \
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
    install -Dm755 "run.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}