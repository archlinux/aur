# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-mailmaster
_officalname=mailmaster
pkgver=4.18.1.1007
_sparkpkgname=com.163.dashi.mailmaster.spark
_sparkver=4.18.1.1006
pkgrel=1
epoch=
pkgdesc="网易(Netease)推出的全平台邮箱客户端,支持使用网易、Outlook等各个品牌邮箱,支持全平台设备登录."
arch=("x86_64")
url="https://dashi.163.com/"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper-git'
    'xdg-utils'
    )
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
    )
conflicts=()
provides=("Netease")
install="deepin-wine-mailmaster.install"
source=(
    "${_sparkpkgname}_${_sparkver}_i386.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkpkgname}/${_sparkpkgname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://res.126.net/dl/client/pcmail/dashi/mail.exe"
    "LICENSE::https://dashi.163.com/help.html"
    "deepin-wine-mailmaster.install"
    "run.sh"
    )
sha256sums=('fe1c70aeb9a8007c8cdcb0e63298c0c69c590af963c365fea22194a4ad1b77d5'
            '85668015fe0370c9497b60bba4da557359e2837dd1bc121621d0ed15c528910d'
            'cb5b010f60e4208a6c89e9d9f9be35fc049005560818db3eb8c5aae0dac0cd33'
            'cb8eb7ef4af1cc2e9f87a0aeb44cc0642c918615a237bd75852788aea654a76f'
            '16385e194e1c863afa47fa709be9885621f14d89b7b9ae9c875edcb1f7e5d352')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkpkgname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
       
    msg "Copying latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/${provides} ..."
    rm -r "${srcdir}/tmp/drive_c/Program Files (x86)/${provides}"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files (x86)/${provides}/"
       
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    rm -r "${srcdir}/opt/apps/${pkgname}/files/disable_mailmaster_shadows"
    7z x -aoa "${srcdir}/${_officalname}-${pkgver}.exe" -o"${srcdir}/${_officalname}.7z"
    7z x -aoa "${srcdir}/${_officalname}.7z" -o"${srcdir}/tmp/drive_c/Program Files (x86)/${provides}/"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"
       
    mv "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkpkgname}.desktop" "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    mv "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkpkgname}.png" "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png"
    sed 's/com.163.dashi.mailmaster.spark/deepin-wine-mailmaster/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop"
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
}
      
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm644 ${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    install  "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}
