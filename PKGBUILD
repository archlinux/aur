# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=mailmaster
pkgname="deepin-wine-${_officalname}"
pkgver=4.19.1.1003
_sparkname=com.163.dashi.mailmaster.spark
_sparkver=4.18.1.1006
pkgrel=1
epoch=
pkgdesc="网易(Netease)推出的全平台邮箱客户端,支持使用网易、Outlook等各个品牌邮箱,支持全平台设备登录."
arch=("x86_64")
url="https://dashi.163.com/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'glibc' 'libx11' 'gcc-libs' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
provides=("Netease")
install="${pkgname}.install"
source=("${_sparkname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkname}/${_sparkname}_${_sparkver}_i386.deb"
    "${_officalname}-${pkgver}.exe::https://res.126.net/dl/client/pcmail/dashi/mail.exe"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname}.install"
    "run.sh")
sha256sums=('fe1c70aeb9a8007c8cdcb0e63298c0c69c590af963c365fea22194a4ad1b77d5'
            '0665d859a6b713439364a8a6dbaae244086d862eb39476d12efa31e856d4350f'
            'a0cda3796e8d0d932eadc0e588dd7422183a55969c48316a01df7ff6aff1580a'
            'cb8eb7ef4af1cc2e9f87a0aeb44cc0642c918615a237bd75852788aea654a76f'
            'ed95307ae79a53d79a7c4673b7d88a57eccb88140fa229b7b73c32cb8b5714bf')
   
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    7z e -aoa "${_officalname}-${pkgver}.exe"
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/Netease ..."
    bsdtar -xf "${_officalname}.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/Netease"
    rm -rf "${srcdir}/tmp/drive_c/Program Files (x86)/Netease/MailMaster"
    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"       
    sed 's|com.163.dashi.mailmaster.spark|deepin-wine-mailmaster|g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${pkgname}/info"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}