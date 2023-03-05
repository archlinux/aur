# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-mcloud
_pkgname=com.139.yun.deepin
_officalname=mCloud
pkgver=7.3.4
_deepinver=7.2.0deepin2
_deepinurl=https://com-store-packages.uniontech.com
pkgrel=2
pkgdesc="CMCC 139 client on Deepin Wine 6.中国移动云盘 on Deepin Wine 6"
arch=("x86_64")
url="https://yun.139.com/"
license=('custom')
depends=('deepin-wine6-stable' 'xdg-utils')
optdepends=()
conflicts=()
install="${pkgname}.install"
source=(
    "${_pkgname}_${_deepinver}_i386.deb::${_deepinurl}/appstore/pool/appstore/c/${_pkgname}/${_pkgname}_${_deepinver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://img.zone139.com/m2012/controlupdate/v6/mCloud_Setup-001.exe"
    "${pkgname}.install"
    "run.sh"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    )
sha256sums=('ecc41143f5c0a96f17236e2f7a4c1e79eb601d1129674d89ea360999a93c6dcb'
            'a7916088010b455ac5330bb0a9b848adff2d61981ac761212f704241f03a3f37'
            'f24db714acc5bdfc1590da6f4d24b8b24bc6e0f371d2ccb27ff7a32cb87b3f8e'
            'e035a119d3731f07bfe85ec49c04d50d8062ee44e19f441f36ada02d7f3e7cd2'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db')
prepare() {
    bsdtar -xvf data.tar.xz
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    bsdtar -xvf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    msg "Cpoying latest ${_officalname} files to ${srcdir}/tmp/drive_c/yidongyunpan/mCloud/ ..."
    cp "${_officalname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/yidongyunpan/mCloud/"
    rm -r "${srcdir}/tmp/drive_c/deepin" "${srcdir}/tmp/drive_c/Program Files/Maxthon2" 
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
    sed 's/com.139.yun.deepin/deepin-wine-mcloud/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
    sed 's/Categories=internet/Categories=Network/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for i in 16x16 32x32 64x64;do
        install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
