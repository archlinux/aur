# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=yuque
pkgname="deepin-wine-${_officalname}"
_pkgname="com.${_officalname}.spark"
_appname=YuQue
pkgver=3.2.2.1107
pkgrel=4
pkgdesc="新一代云端知识库，用于个人笔记与知识创作，团队协同与知识沉淀"
arch=("x86_64")
url="https://www.yuque.com/"
_downurl="https://d.store.deepinos.org.cn/"
license=('LicenseRef-custom')
conflicts=(
    "${_officalname}"
    "${_officalname}-pake"
)
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'libx11'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.deb::${_downurl}/store/office/${_pkgname}/${_pkgname}_${pkgver}spark14_all.deb"
    "msmpeg2vdec.dll.7z::https://raw.githubusercontent.com/zxp19821005/My_AUR_Files/main/${pkgname}/msmpeg2vdec.dll.7z"
    "LICENSE-${pkgver}::https://www.yuque.com/terms"
    "${pkgname}.sh"
)
sha256sums=('165ab89ecfa89c1639b3607599cb1e35393cde66251d9e470dbb23592a72a3c7'
            'f66967eb394b93a61c01b30efb2f03128e6d9d019526808d7db687aee29a8bb3'
            '79b82aa631d01a625dc18021c30234a03029bb69011460de83c4395928f75f36'
            '99ebf377576c233e2c7b54bdc2ecc983ef735a615697943f093b47ca55a448a1')
build() {
    sed -e "s|@bottlename@|${_appname}|g" \
        -e "s|@pkgname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    install -Dm755 -d "${srcdir}/tmp"
    bsdtar -xf "${srcdir}/opt/apps/${pkgname}/files/files.7z" -C "${srcdir}/tmp"
    install -Dm644 "${srcdir}/msmpeg2vdec.dll" "${srcdir}/tmp/drive_c/windows/system32"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|\"/opt/apps/${_pkgname}/files/run.sh\"|${pkgname} --disable-gpu|g;s|Icon=${_pkgname}|Icon=${pkgname}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}