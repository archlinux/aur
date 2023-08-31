# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-welink
_pkgname=com.huaweicloud.welink.spark
_appname=WeLink
pkgver=7.32.7.484
_sparkver=7.21.3.403spark1
pkgrel=1
pkgdesc="华为数字化办公实践,服务政企、高校等主要客户,是全场景安全、智能、的数字化办公平台,帮助AnyBody、AnyWhere、AnyDevice、doAnyBusiness4A办公。"
arch=("x86_64")
url="https://www.huaweicloud.com/product/welink.html"
license=('custom')
depends=('deepin-wine6-stable' 'spark-dwine-helper' 'xdg-utils' 'sh')
optdepends=('wqy-microhei' 'wqy-zenhei')
conflicts=("welink")
install="${pkgname}.install"
source=("${_pkgname}_${_sparkver}.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/${_pkgname}/${_pkgname}_${_sparkver}_i386.deb"
    "${_appname}-${pkgver}.exe::https://welink.huaweicloud.com/download/WeLink_setup.exe"
    "fake_simsun.ttc::https://images.xuthus.cc/images/fake_simsun.ttc"
    "${pkgname}.install"
    "LICENSE.html::https://www.huaweicloud.com/declaration/sa_cua_computing.html"
    "run.sh")
sha256sums=('2a5046177ad2f57ebeff4176ffe4ae2717eed19c8fd2e84fad5b9f44305d16d1'
            '6364a2a0e7aa18a2428c0727d0789aee2f7687c5e1f9773c7a8d8c36aee4714e'
            '3e2ed9203a5ce3b2f00b6c942d8fac6b24e7a6e7b1ebc863cee2e27d3ff487db'
            'd3f310b0d94bc630700afec6d0786edc1176ca28def75b518167deba1965288a'
            '2157ab88b3d8fc11c3c6bf4b1cc05ea13bce152bca4091ecf34c755e987ae8cc'
            'e89c42be3b544d6f8781e881bef759f8ea8909d8e0ec4c136a9909205c4cc1d3')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mkdir -p "${srcdir}/tmp"
    msg "Extracting Deepin Wine ${_appname} archive ..."
    7z x -aoa "${srcdir}/opt/apps/${_pkgname}/files/files.7z" -o"${srcdir}/tmp"     
    msg "Copying latest ${_appname} installer to ${srcdir}/tmp/drive_c/Program Files/${_appname} ..."
    rm -rf "${srcdir}/tmp/drive_c/Program Files/${_appname}/" "${srcdir}/tmp/drive_c/Program Files (x86)"
    mkdir -p "${srcdir}/tmp/drive_c/Program Files/${_appname}/"
    install -m644 "${_appname}-${pkgver}.exe" "${srcdir}/tmp/drive_c/Program Files/${_appname}/${_appname}-${pkgver}.exe"
    cp "${srcdir}/fake_simsun.ttc" "${srcdir}/tmp/drive_c/windows/Fonts/"
    msg "Repackaging app archive ..."
    rm -r "${srcdir}/opt/apps/${_pkgname}/files/files.7z"
    7z a -t7z -r "${srcdir}/opt/apps/${_pkgname}/files/files.7z" "${srcdir}/tmp/*"
    sed "s|chat|Network|g;s|${_pkgname}|${pkgname}|g" -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    sed "s|Icon=/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${pkgname}.png|Icon=${pkgname}|g" \
        -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
    rm -rf "${pkgdir}/opt/apps/${pkgname}/info"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/apps/${pkgname}"
    cp -r "${srcdir}/opt/apps/${_pkgname}/"* "${pkgdir}/opt/apps/${pkgname}"
    md5sum "${pkgdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" -t "${pkgdir}/opt/apps/${pkgname}/files/"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}