# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=yuque
pkgname="deepin-wine-${_officalname}"
_pkgname="com.${_officalname}.spark"
_bottlename=Deepin-YuQue
pkgver=3.2.2.1107
pkgrel=2
pkgdesc="新一代云端知识库，用于个人笔记与知识创作，团队协同与知识沉淀"
arch=("x86_64")
url="https://www.yuque.com/"
_downurl="https://d.store.deepinos.org.cn/"
license=('custom')
conflicts=("${_officalname}" "${_officalname}-pake")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'libx11'
    'lib32-glibc'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
install="${pkgname}.install"
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/store/office/${_pkgname}/${_pkgname}_${pkgver}spark14_all.deb"
    "msmpeg2vdec.dll.7z::https://raw.githubusercontent.com/zxp19821005/My_AUR_Files/main/${pkgname}/msmpeg2vdec.dll.7z"
    "LICENSE-${pkgver}::https://www.yuque.com/terms"
    "${pkgname}.install"
    "${pkgname%-bin}.sh"
)
sha256sums=('165ab89ecfa89c1639b3607599cb1e35393cde66251d9e470dbb23592a72a3c7'
            'f66967eb394b93a61c01b30efb2f03128e6d9d019526808d7db687aee29a8bb3'
            '7aa2050d60eadd5ce409ddf243fb4b86aefd826afc2cc2e9ed7da9aaa0eff282'
            '9fc08b3f39ab99a3335449f6ea69aff4bb67d8b4dd2b243009738369af544201'
            'ad569a217f51481a0a9e7b4be1536f580a6abd2bdbde4a22f2dba31cada709ef')
build() {
    sed "s|@bottlename@|${_bottlename}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|${_bottlename}|g" \
        -e "s|@pkgname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
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