# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_pkgname=iFinD
_appname=com.51ifind
pkgver=1.10.12.382.001
pkgrel=1
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=('aarch64' 'x86_64')
url="https://www.51ifind.com/"
_dlurl="https://sp.thsi.cn/staticS3/mobileweb-upload-static-server.file/app_6/downloadcenter"
license=('custom::freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('nss' 'alsa-lib' 'at-spi2-core' 'libxfixes' 'dbus' 'libxext' 'mesa' 'glib2' 'libxcb' 'expat' 'util-linux-libs' \
    'glibc' 'nspr' 'libdrm' 'libx11' 'gcc-libs' 'libxkbcommon' 'libxcomposite' 'libxrandr' 'libcups' 'libxdamage' 'zlib' \
    'fontconfig' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_appname}_uos_${pkgver}_amd64_signed.deb")
sha256sums_aarch64=('c9206aad6858de7e8ac96c142bd816ac7a2f06173b9b890592c0c6ec4490517f')
sha256sums_x86_64=('4df1d4ddd002ed6c19a8a968e3ec0c7e375bf683e1f77f22b8396167ebc10d7b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    mv "${srcdir}/opt/apps/${_appname}" "${srcdir}/opt/apps/${pkgname%-bin}"
    sed -e "s|/opt/apps/${_appname}/files/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|/opt/apps/${_appname}/entries/icons/hicolor/scalable/apps/JiGouBan.svg|${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${pkgname%-bin}/entries/applications/${_appname}.desktop"
    rm -rf "${srcdir}/opt/apps/${pkgname%-bin}/info"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/apps" "${pkgdir}/opt"
    ln -sf "/opt/apps/${pkgname%-bin}/files/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/entries/icons/hicolor/scalable/apps/JiGouBan.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/opt/apps/${pkgname%-bin}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}