# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ifind-bin
_pkgname=iFinD
_appname="com.51${pkgname%-bin}"
pkgver=1.10.12.394.001
pkgrel=2
pkgdesc="同花顺iFinD PC版提供资讯、行情、深度资料、数据浏览器、企业库等功能,满足用户多方面的使用需求。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.51ifind.com/"
_dlurl="https://sp.thsi.cn/staticS3/mobileweb-upload-static-server.file/app_6/downloadcenter"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    '!emptydirs'
    'staticlibs'
)
depends=(
    'nss'
    'alsa-lib'
    'libxrandr'
    'libxkbcommon'
    'libcups'
    'libxcomposite'
    'libxdamage'
    'at-spi2-core'
    'libva'
    'libdrm'
    'mesa'
    'fontconfig'
    'dotnet-sdk-5.0'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/${_appname}_uos_${pkgver}_arm64_signed.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/${_appname}_${pkgver}_amd64_signed.deb")
sha256sums=('936d2d4299699da4e66d836e9001e1ff43fef95c53aef61569a1c3f667283fcd')
sha256sums_aarch64=('a7869ef499d7fd3f8a5ba1960e9b667cb18ba63f4fe96bf5be2f68eb5e28674a')
sha256sums_x86_64=('f6c9280e7c52327404834b41be714cbfdb013ba2bad854404ce1ca75de8475af')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\"\/opt\/apps\/${_appname}\/files\/bin\/run.sh\"/${pkgname%-bin} %F/g
        s/\/opt\/apps\/${_appname}\/entries\/icons\/hicolor\/scalable\/apps\/${_appname}.svg/${pkgname%-bin}/g
        s/Name=${_appname}/Name=${_pkgname}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/cef/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.IO.Compression.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.IO.Compression.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Net.Security.Native.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Net.Security.Native.a"
    ln -sf "/usr/share/dotnet/shared/Microsoft.NETCore.App/5.0.17/libSystem.Security.Cryptography.Native.OpenSsl.a" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/libSystem.Security.Cryptography.Native.OpenSsl.a"
}
