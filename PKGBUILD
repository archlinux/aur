# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: XelK
# Contributor: Javier Tiá <javier dot tia at gmail dot com>
pkgname=vnote-bin
_pkgname=VNote
pkgver=3.19.1
pkgrel=3
pkgdesc="A Qt-based, free and open source note-taking application, focusing on Markdown now.(Prebuilt version)"
arch=('x86_64')
url="https://app.vnote.fun/"
_ghurl="https://github.com/vnotex/vnote"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nss'
    'libdrm'
    'freetype2'
    'fribidi'
    'alsa-lib'
    'libx11'
    'qt6-declarative'
    'libxcb'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
    '!emptydirs'
    '!staticlibs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.AppImage.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('57be22dc62af4839e07ca07a222a8a712147bab864672337ddc18ef295dd6cf0'
            '7feea40a0bd1a6668b2acf9adccf1678fb1f0c00f02fd688699cc51e92ca95da')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    rm -rf "${srcdir}/squashfs-root"
    if [ ! -x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" ];then
        chmod +x "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage"
    fi
    "${srcdir}/${_pkgname}-${pkgver}-linux-x64.AppImage" --appimage-extract > /dev/null
    install -Dm644 "${srcdir}/squashfs-root/usr/local/lib/libVTextEdit.so" -t "${srcdir}/squashfs-root/usr/lib"
    rm -rf "${srcdir}/squashfs-root/usr/local"
#    _file_list=(libQt6Core5Compat.so.6 libQt6Core.so.6 libQt6DBus.so.6 libQt6Gui.so.6 libQt6Network.so.6 libQt6OpenGL.so.6 \
#        libQt6Pdf.so.6 libQt6Positioning.so.6 libQt6PrintSupport.so.6 libQt6QmlMeta.so.6 libQt6QmlModels.so.6 libQt6Qml.so.6 \
#        libQt6QmlWorkerScript.so.6 libQt6Quick.so.6 libQt6QuickWidgets.so.6 libQt6SerialPort.so.6 libQt6Sql.so.6 libQt6Svg.so.6 \
#        libQt6WebChannel.so.6 libQt6WebEngineCore.so.6 libQt6WebEngineWidgets.so.6 libQt6Widgets.so.6 libQt6XcbQpa.so.6 \
#        libssl.so.3 libcrypto.so.3 libjpeg.so.8 libxslt.so.1)
#	for _files in "${_file_list[@]}";do
#		ln -sf "/usr/lib/${_files}" "${srcdir}/squashfs-root/usr/lib/${_files}"
#	done
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}