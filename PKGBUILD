# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=MasterMaster
_officalname=mailmaster
pkgname="deepin-wine-${_officalname}"
pkgver=5.0.9.1015
_sparkname="com.163.dashi.${_officalname}.spark"
pkgrel=1
pkgdesc="网易(Netease)推出的全平台邮箱客户端,支持使用网易、Outlook等各个品牌邮箱,支持全平台设备登录."
arch=("x86_64")
url="https://dashi.163.com/"
license=('LicenseRef-freeware')
depends=(
    'deepin-wine8-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
conflicts=("${_officalname}")
install="${pkgname}.install"
source=(
    "${_officalname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store//network/${_sparkname}/${_sparkname}_${pkgver}_all.deb"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname}.sh"
)
sha256sums=('32966235131c0e6afc0f6bc38cebfedd18b04deffc706974cf41465287004603'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            'ac4c303323434c78b05a5e8af70d15ed529c8466eaa7aca623cca5489f51b72d')
build() {
    sed -e "s|@bottlename@|${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@dirname@|${_appname}|g" \
        -e "s|@runname@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|Icon=${_sparkname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${srcdir}/opt/apps/${pkgname}/files/files.md5sum"     
}

package() {
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}