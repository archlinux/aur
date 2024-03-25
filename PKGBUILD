# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ecloud-bin
_sparkname=com.cloud.21cn
pkgver=1.1.0_1_plus_a1
_electronversion=4
pkgrel=3
pkgdesc="A project of Tianyi Cloud Disk.天翼云盘Linux版"
arch=("x86_64")
url="https://cloud.189.cn/"
_devurl="https://gitlab.tech.21cn.com/f2e-cloud/cloud-pc"
_dlurl="https://mirrors.sdu.edu.cn/spark-store-repository/store//network"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}-bin"
    'nodejs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/${_sparkname}/${_sparkname}_${pkgver//_1/-1}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('66c6888fa17e64719edc0890d34d231b059aa315cd51532c64c618d5239d5af6'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt/apps/${_sparkname}/files/bin/${_sparkname}\"|${pkgname%-bin}|g" \
        -e "s|/opt/apps/${_sparkname}/entries/icons/hicolor/scalable/apps/tianyi-cloud-disk.png|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_sparkname}/entries/applications/${_sparkname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/files/lib/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/opt/apps/${_sparkname}/files/bin/resources/"{app,cloudDylib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/entries/icons/hicolor/scalable/apps/tianyi-cloud-disk.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/files/doc/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}