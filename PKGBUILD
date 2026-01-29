# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=openshot-bin
_pkgname=OpenShot
pkgver=3.4.0
pkgrel=2
pkgdesc="An award-winning free and open-source video editor,is dedicated to delivering high quality video editing and animation solutions to the world.(Prebuilt version)"
arch=('x86_64')
url="http://www.openshot.org/"
_ghurl="https://github.com/OpenShot/openshot-qt"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'ffmpeg'
    'python'
    'python-pyqt5'
    'python-pyzmq'
    'python-requests'
    'qt5-base'
    'qt5-svg'
    'chromaprint'
    'python-defusedxml'
    'numactl'
    'python-opengl'
    'libsm'
    'python-pillow'
    'wavpack'
    'libtool'
    'babl'
    'libice'
    'liblqr'
    'ffmpeg4.4'
    'twolame'
    'python-distro'
    'qt5-tools'
)
optdepends=(
    'faac: for exporting audio using AAC'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('2ef8bc773b2ad8a6811cfdfd6d7187dc7e95a284a9f39033eac6675cf78eef2c'
            'db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}-qt/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/${pkgname%-bin}-qt-launch/${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-qt/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/usr/share/applications/org.${pkgname%-bin}.${_pkgname}.desktop"
    sed -i "s/org.${pkgname%-bin}.${_pkgname}.desktop/${pkgname%-bin}.desktop/g" \
        "${srcdir}/squashfs-root/usr/share/metainfo/org.${pkgname%-bin}.${_pkgname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/bin/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/org.${pkgname%-bin}.${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/org.${pkgname%-bin}.${_pkgname}.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdate.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.${pkgname%-bin}.${_pkgname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    _icon_sizes=(64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-qt.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}-qt.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
}