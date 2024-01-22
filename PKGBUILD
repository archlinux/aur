# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=MasterMaster
_officalname=mailmaster
pkgname="deepin-wine-${_officalname}"
pkgver=5.0.8.1017
_sparkname="com.163.dashi.${_officalname}.spark"
_sparkver=4.18.1.1006
pkgrel=1
pkgdesc="网易(Netease)推出的全平台邮箱客户端,支持使用网易、Outlook等各个品牌邮箱,支持全平台设备登录."
arch=("x86_64")
url="https://dashi.163.com/"
license=('custom:freeware')
depends=(
    'deepin-wine6-stable'
    'spark-dwine-helper'
    'xdg-utils'
)
makedepends=(
    'p7zip'
)
optdepends=(
    'wqy-microhei'
    'wqy-zenhei'
)
conflicts=("${_officalname}")
install="${pkgname}.install"
source=(
    "${_officalname}-${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${_sparkname}/${_sparkname}_${_sparkver}-1_all.deb"
    "${_officalname}-${pkgver}.exe::https://res.126.net/dl/client/pcmail/dashi/mail5.exe"
    "LICENSE.html::https://mail.163.com/html/agreement/doc.html"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "${pkgname}.install"
    "${pkgname}.sh"
)
sha256sums=('65e8ba5f2e958382e38a8cf8b04de466fe329eb563254f5bd176afc8105966ed'
            'fafcc5d4c1a765295f41b6d131e4332d9039416efc627527d0be1dc57d9bff2c'
            '8ec2318da6f512f89dbee747fcbd233f552134da98c204c4ac682400341732fc'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            '48e7a80b45d16321f794020aaa9be9c46ba76d2da8c52d86f6e2bbfe6abdf13b'
            'ffdd16329beb4e69d20988b15f963ef0fa4f274757aae4c5c3d69b4312e27b66')
build() {
    sed "s|@bottlename@|${_appname}|g" -i "${srcdir}/${pkgname}.install"
    sed -e "s|@bottlename@|${_appname}|g" \
        -e "s|@appver@|${pkgver}|g" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@dirname@|${_appname}|g" \
        -e "s|@runname@|${_officalname}|g" \
        -i "${srcdir}/${pkgname}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_sparkname}" "${srcdir}/opt/apps/${pkgname}"
    sed -e "s|Icon=${_sparkname}|Icon=${pkgname}|g" \
        -e "s|\"/opt/apps/${_sparkname}/files/run.sh\"|${pkgname}|g" \
        -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop"

    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_officalname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${pkgname}/files/files.7z" -o"${srcdir}/tmp"
    7z e -aoa "${_officalname}-${pkgver}.exe"

    msg "Extracting latest ${_officalname} installer to ${srcdir}/tmp/drive_c/Program Files (x86)/Netease ..."
    bsdtar -xf "${_officalname}.7z" -C "${srcdir}/tmp/drive_c/Program Files (x86)/Netease"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
    rm -rf "${srcdir}/tmp/drive_c/Program Files (x86)/Netease/MailMaster" \
        "${srcdir}/opt/apps/${pkgname}/files/files.7z" \
        "${srcdir}/opt/apps/${pkgname}/info"

    msg "Repackaging app archive ..."
    7z a -t7z -r "${srcdir}/opt/apps/${pkgname}/files/files.7z" "${srcdir}/tmp/*"  

    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${srcdir}/opt/apps/${pkgname}/files/files.md5sum"     
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_sparkname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_sparkname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}