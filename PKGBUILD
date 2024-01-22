# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=welink
pkgname="deepin-wine-${_pkgname}"
_sparkname="com.huaweicloud.${_pkgname}.spark"
_appname=WeLink
pkgver=7.36.7
_sparkver=7.21.3.403spark1
pkgrel=1
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
    "${pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${_appname}-${pkgver}.exe::https://welink.huaweicloud.com/download/${_appname}_setup.exe"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "${pkgname}.install"
    "LICENSE.html::https://www.huaweicloud.com/declaration/sa_cua_computing.html"
    "${pkgname}.sh"
)
sha256sums=('2a5046177ad2f57ebeff4176ffe4ae2717eed19c8fd2e84fad5b9f44305d16d1'
            'c703e2b726c89af1aa0c8ba31365b78d257382a91689a768c56563de00287649'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '2a9e70d0bc04f291d2d7d774ace08edb83c5f5d299ebd66920457c9d8fb336b7'
            'ccc8fcb75c75fe61bdb206f2a450fcaf0dfb7890ae181d9dcbde0d73c2432ccf'
            'c54ef202c74cc198a03eb3de72e9e929d60f0ed52a02c1811078d99f4376adcc')
build() {
    sed "s|@appname@|${_appname}|g" -i "${srcdir}/${pkgname}.install"
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
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
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