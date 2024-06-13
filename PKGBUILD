# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=adrive
pkgname="deepin-wine-${_appname}"
_sparkname=com.aliyundrive.spark
_officalname=aDrive
pkgver=4.9.15spark9
pkgrel=1
pkgdesc="Aliyun aDrive on Deepin Wine 8"
arch=("x86_64")
url="https://www.aliyundrive.com"
_dlurl="https://mirrors.sdu.edu.cn/spark-store-repository/store"
license=('LicenseRef-custom')
conflicts=("${_appname}")
provides=("${_appname}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::${_dlurl}//network/${_sparkname}/${_sparkname}_${pkgver}_all.deb"
    "LICENSE.html::https://terms.alicdn.com/legal-agreement/terms/suit_bu1_alibaba_group/suit_bu1_alibaba_group202102022125_53871.html"
    "${pkgname}.sh"
)
sha256sums=('769e2265f50c5eb3d53299f86f3975ebf9ea783b132de9fd7d44002e15487966'
            '6805d4f66fba42ef107aa186c1aa57b157273dc75469bc5476134f4ce001e96a'
            '60092b36b388d8c5899ced088bf4fa2f26999ba5ea7470dedf196bdc6473b43b')
build() {
    sed -e "s|@bottlename@|Deepin-${_officalname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@pathname@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"

    bsdtar -xf "${srcdir}/data."* -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g;s|${_sparkname}|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh" -t "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}