# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=quarkclouddrive
pkgname="deepin-wine-${_officalname}"
_downname=QuarkCloudDrive
_installpkgpath=quark-cloud-drive
pkgver=3.0.5spark3
_sparkpkgname="cn.${_officalname}.spark"
pkgrel=1
pkgdesc="夸克网盘是夸克推出的一款云服务产品，可轻松进行照片、视频、文档、音频等文件的在线备份、同步和分享，并支持电脑/手机/iPad端等多个端。"
arch=("x86_64")
url="https://pan.quark.cn/"
_downurl=https://pc.qq.com/
#_sparkdown=("https://d.store.deepinos.org.cn")
_sparkdown=("https://mirrors.sdu.edu.cn/spark-store")
license=('custom:freeware')
conflicts=("${_officalname}")
provides=("${_officalname}")
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
    'hicolor-icon-theme'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
source=(
    "${pkgname}_${pkgver}_amd64.deb::${_sparkdown}/store/network/${_sparkpkgname}/${_sparkpkgname}_${pkgver}_all.deb"
    "LICENSE.html"
    "${pkgname}.install"
    "${pkgname}.sh"
)
install="${pkgname}.install"
sha256sums=('a90bd9bdb07c0a77d399ef8e7ad645971824ce9114221f4a1490a883ea46ccc4'
            'b8252eb8c22ea41cc43c9436f341a78cac19cbc71c3593fa1b042fc9136f6767'
            '48e7a80b45d16321f794020aaa9be9c46ba76d2da8c52d86f6e2bbfe6abdf13b'
            '1be688a7a5c9196bfb6657911b96235671fbe10062c437e08b5e3eccc5b561b9')
build() {
    sed "s|@bottlename@|${_downname}|g" -i "${srcdir}/${pkgname}.install" 
    sed -e "s|@appname@|${pkgname}|g" \
        -e "s|@sparkver@|${_sparkver}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@installname@|${_installpkgpath}|g" \
        -e "s|@bottlename@|${_downname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    sed "s|${_sparkpkgname}|${pkgname}|g;s|\"/opt/apps/${pkgname}/files/run.sh\"|${pkgname}|g" \
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