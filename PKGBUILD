# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-bin
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=1.1.7
pkgrel=5
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders.(Prebuilt version)"
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.freac.org/"
_ghurl="https://github.com/enzo1982/freac"
license=('GPL-2.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libpulse'
    'gtk3'
    'libcdio-paranoia'
    'libcdio'
    'openssl-1.1'
)
makedepends=(
    'fuse2'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armhf.AppImage")
source_i686=("${pkgname%-bin}-${pkgver}-i686.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-i686.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('77391df0280b544aa250b93bb76a56be3b91d38620399a2c3ee0ffaa987ea47e')
sha256sums_aarch64=('027a53acf9c083edaada7d9225d6b75b69020a8beec0b99e65e950a19716e37e')
sha256sums_armv7h=('935a12b6c2b5113d6560c297ab6eceb8963d24b31020e1c7766f4095a08075a0')
sha256sums_i686=('76db7d56f61c282f63d3ef80dfd7f5be690ccecf724f5e730a336930629dc4c8')
sha256sums_x86_64=('17d5d8ee6c3a0498e1639d002ff64ee557fe3c9f4b347996107d8755ea91f2d6')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}