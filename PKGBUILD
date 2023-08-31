# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-mcloud
_pkgname=com.139.yun.deepin
_officalname=mCloud
pkgver=7.6.1
_deepinver=7.2.0deepin2
_deepinurl=https://com-store-packages.uniontech.com
pkgrel=3
pkgdesc="CMCC 139 client on Deepin Wine 6.中国移动云盘 on Deepin Wine 6"
arch=("x86_64")
url="https://yun.139.com/"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils' 'hicolor-icon-theme' 'lib32-at-spi2-core' 'lib32-pango' 'lib32-gtk3' \
    'lib32-cairo' 'lib32-gdk-pixbuf2' 'lib32-libxext' 'lib32-glibc' 'lib32-libx11' 'sh' 'lib32-glib2')
optdepends=()
conflicts=()
install="${pkgname}.install"
source=("${_pkgname}_${_deepinver}_i386.deb::${_deepinurl}/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://img.zone139.com/m2012/controlupdate/v6/mCloud_Setup-001.exe"
    "${pkgname}.install"
    "run.sh"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "LICENSE.html::https://caiyun.feixin.10086.cn:7071/portal/templateView/initve.html?id=145&marketName=hcy_yhxy")
sha256sums=('ecc41143f5c0a96f17236e2f7a4c1e79eb601d1129674d89ea360999a93c6dcb'
            'e0be37a4bc6a03b64ed9fa2e46e7b3c973c4a523b857a8b030284a21c69b2ac8'
            'f24db714acc5bdfc1590da6f4d24b8b24bc6e0f371d2ccb27ff7a32cb87b3f8e'
            'dcca6b8d54d9f52ef7b59c07e07302d41f8d9ffb3df24bf9b54aac8298faa7dd'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '32a78acb27a19f901f6989c889113bb1b8e02a918d5bea67a6bcf29e7ec6dc95')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp" "${srcdir}/extracted_exe"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Extract latest ${_officalname} files to ${srcdir}/tmp/drive_c/Program Files/mCloud/ ..."
    rm -r "${srcdir}/tmp/drive_c/deepin" "${srcdir}/tmp/drive_c/Program Files/Maxthon2" \
        "${srcdir}/tmp/drive_c/yidongyunpan" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Application Data/aDrive" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Application Data/ThinkMail" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Local Settings/Application Data/Programs" \
        "${srcdir}/tmp/drive_c/users/@current_user@/Start Menu/Programs"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/mCloud"
    7z e -aoa "${_officalname}-${pkgver}.exe" -o"${srcdir}/extracted_exe"
    bsdtar -xf "${srcdir}/extracted_exe/app.7z" -C "${srcdir}/tmp/drive_c/Program Files/mCloud"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/opt/apps/${pkgname}/info"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|${_pkgname}|${pkgname}|g;s|internet|Network|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for _icons in 16x16 32x32 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}