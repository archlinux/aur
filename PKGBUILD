# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ecloud-bin
_sparkname=com.cloud.21cn
pkgver=1.1.0_1_plus_a1
_electronversion=4
pkgrel=5
pkgdesc="A project of Tianyi Cloud Disk.天翼云盘Linux版"
arch=('x86_64')
url="https://cloud.189.cn/"
_devurl="https://gitlab.tech.21cn.com/f2e-cloud/cloud-pc"
_dlurl="https://mirrors.sdu.edu.cn/spark-store-repository/store//network"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/${_sparkname}/${_sparkname}_${pkgver//_1/-1}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('66c6888fa17e64719edc0890d34d231b059aa315cd51532c64c618d5239d5af6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_sparkname}-dist/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\"\/opt\/apps\/${_sparkname}\/files\/bin\/${_sparkname}\"/${pkgname%-bin}/g
        s/\/opt\/apps\/${_sparkname}\/entries\/icons\/hicolor\/scalable\/apps\/tianyi-cloud-disk.png/${pkgname%-bin}/g
    " -i "${srcdir}/opt/apps/${_sparkname}/entries/applications/${_sparkname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/files/lib/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_sparkname}/files/bin/resources/"{app,cloudDylib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/entries/icons/hicolor/scalable/apps/tianyi-cloud-disk.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/apps/${_sparkname}/files/doc/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}