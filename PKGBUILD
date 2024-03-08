# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_downname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=3.0.5spark3
_sparkpkgname="cn.${_officalname}.spark"
pkgrel=3
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
    'hicolor-icon-theme'
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
sha256sums=('a90bd9bdb07c0a77d399ef8e7ad645971824ce9114221f4a1490a883ea46ccc4'
            'b8252eb8c22ea41cc43c9436f341a78cac19cbc71c3593fa1b042fc9136f6767'
            '995a42768b6d0d861711a35a828969aa2e97dd6d69143c8cf46927b2145109d5')
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