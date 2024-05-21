# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_downname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=3.2.6spark4
_sparkpkgname="cn.${_officalname}.spark"
pkgrel=1
pkgdesc="夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。"
arch=("x86_64")
url="https://pan.quark.cn/"
_downurl=https://pc.qq.com/
#_sparkdown=("https://d.store.deepinos.org.cn")
_sparkdown=("https://mirrors.sdu.edu.cn/spark-store")
license=('LicenseRef-custom')
conflicts=("${_officalname}")
provides=("${_officalname}")
depends=(
    'deepin-wine8-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'spark-transhell'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
install="${pkgname}.install"
source=(
    "${pkgname}_${pkgver}_amd64.deb::${_sparkdown}/store/network/${_sparkpkgname}/${_sparkpkgname}_${pkgver}_all.deb"
    "LICENSE.html"
    "${pkgname}.sh"
)
sha256sums=('1f01a60ff524d214f0e53a0b61a828263306e9748528c132637325010d67e425'
            'b8252eb8c22ea41cc43c9436f341a78cac19cbc71c3593fa1b042fc9136f6767'
            '8a8034c3a22623f1dd424425f133a9837b65dfd09a18959c9e0038e0e036b077')
build() {
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@bottlename@|${_downname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data."*
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|${_sparkpkgname}|${pkgname}|g;s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname} --no-sandbox|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname}/info"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}