# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rabbitremotecontrol-bin
_pkgname=RabbitRemoteControl
_rpmname="io.github.KangLin.${_pkgname}"
pkgver=0.0.34
pkgrel=1
pkgdesc="Remote control. Support VNC, RDP, Terminal, SSH, TELNET etc.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/KangLin/RabbitRemoteControl"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'qt6-base'
    'qt6-scxml'
    'qt6-multimedia'
    'libjpeg6-turbo'
    'libpcap'
    'libvncserver'
    'openssl'
    'cmark'
)
optdepends=(
    'freerdp'
    'libssh'
    'libssh2'
    'qtermwidget'
    'libtelnet'
    'libdatachannel'
    'qxmpp'
    'pcapplusplus'
    'ffmpeg'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.fc41.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.fc41.x86_64.rpm")
sha256sums=('b6255be5cbf5685c1195a41cdad5a2490c403d6641c56c065040d5dbd3589aad')
sha256sums_aarch64=('bcdb91a149fc72650dd8608e04807b6b6a128b21607415ad4666fca56b6c4d6c')
sha256sums_x86_64=('fe02f4d793332781fb3f50c624bc87a67b8d8a0d0fc4700f5934922da8449df8')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Path=\/opt\/${_pkgname}/Path=\/usr\/lib\/${pkgname%-bin}/g
        s/Exec=${_pkgname}App/Exec=${pkgname%-bin}/g
        s/Icon=${_rpmname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${_pkgname}/share/applications/${_rpmname}.desktop"
    sed -i "s/${_rpmname}/${pkgname%-bin}/g" "${srcdir}/opt/${_pkgname}/share/metainfo/${_rpmname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_pkgname}/bin/${_pkgname}App-${pkgver}" "${pkgdir}/usr/lib/${pkgname%-bin}/bin/${_pkgname}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/etc/${_pkgname}_logqt.ini" -t "${pkgdir}/usr/lib/${pkgname%-bin}/etc"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/lib64/"* "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    ln -sf "/usr/lib/libcmark.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libcmark.so.0.30.3"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{plugins,share} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/icons/hicolor/scalable/apps/${_rpmname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_rpmname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/metainfo/${_rpmname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/doc/${_pkgname}/License.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/var/log/${pkgname%-bin}"
}
