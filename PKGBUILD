# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=mailmaster
pkgname="deepin-wine-${_officalname}"
pkgver=4.19.4.1001
_sparkname="com.163.dashi.${_officalname}.spark"
_sparkver=4.18.1.1006
pkgrel=1
pkgdesc="网易(Netease)推出的全平台邮箱客户端,支持使用网易、Outlook等各个品牌邮箱,支持全平台设备登录."
arch=("x86_64")
url="https://dashi.163.com/"
license=('custom:freeware')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'hicolor-icon-theme' 'glibc' 'libx11' 'gcc-libs' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=()
install="${pkgname}.install"
source=("${_sparkname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkname}/${_sparkname}_${_sparkver}-1_all.deb"
    "${_officalname}-${pkgver}.exe::https://res.126.net/dl/client/pcmail/dashi/mail.exe"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "${pkgname}.install"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "run.sh")
sha256sums=('65e8ba5f2e958382e38a8cf8b04de466fe329eb563254f5bd176afc8105966ed'
            'c0da7ca48c945f71f2b8fb6b441d8d6730e8b8110a61d9ef5ba613b1d6da19f0'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            'cb8eb7ef4af1cc2e9f87a0aeb44cc0642c918615a237bd75852788aea654a76f'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '0e0c2abb40e0cddc52c0fdff22db407714acaaa490e410087e0760c87099938c')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    7z e -aoa "${_officalname}-${pkgver}.exe"
    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/Netease ..."
    bsdtar -xf "${_officalname}.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/Netease"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
    rm -rf "${srcdir}/tmp/drive_c/Program Files (x86)/Netease/MailMaster"
    msg "Repackaging app archive ..."
    rm -rf "${srcdir}/opt/apps/${pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"       
    sed "s|${_sparkname}|${pkgname}|g" -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"
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