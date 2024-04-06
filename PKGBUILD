# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=welink
pkgname="deepin-wine-${_pkgname}"
_sparkname="com.huaweicloud.${_pkgname}.spark"
_appname=WeLink
pkgver=7.37.3
_sparkver=7.21.3.403spark1
pkgrel=2
pkgdesc="华为数字化办公实践,服务政企、高校等主要客户,是全场景安全、智能、的数字化办公平台,帮助AnyBody、AnyWhere、AnyDevice、doAnyBusiness4A办公。"
arch=("x86_64")
url="https://www.huaweicloud.com/product/welink.html"
license=('LicenseRef-custom')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makededpends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
conflicts=(
    "${_pkgname}"
    "huaweicloudmeeting"
)
install="${pkgname}.install"
source=(
    "${pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store//chat/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${_appname}-${pkgver}.exe::https://welink.huaweicloud.com/download/${_appname}_setup.exe"
    #"fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "LICENSE.html::https://www.huaweicloud.com/declaration/sa_cua_computing.html"
    "${pkgname}.sh"
)
sha256sums=('2a5046177ad2f57ebeff4176ffe4ae2717eed19c8fd2e84fad5b9f44305d16d1'
            '045c334577032f51d963188d30254a0e1d8fea7876fbd7b00e78bd5b7bb59685'
            'd5d83468ded64766fdfdb7e0e5b0510fcaa3c3102bcd01d57ac213d2b9d09e1b'
            '457847c22fc306279a20070ee7578403653e5c2ed8c602065f5996cf353c4722')
build() {
    sed -e "s|@appname@|${_appname}|g" \
        -e "s|@pkgname@|${pkgname}|g" \
        -e "s|@sparkver@|${_sparkver%spark1}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Copying latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files/${_appname} ..."
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_appname}/" "${srcdir}/tmp/drive_c/Program Files (x86)"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_appname}/"
    install -m644 "${srcdir}/${_appname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_appname}/${_appname}-${pkgver}.exe"
    #cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed -e "s|chat|Network|g" \
        -e "s|/opt/apps/${_sparkname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png|${pkgname}|g" \
        -e "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}