# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=freac-bin
_appname="org.${pkgname%-bin}.${pkgname%-bin}"
pkgver=1.1.7
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.freac.org/"
_ghurl="https://github.com/enzo1982/freac"
license=('GPL2')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libpulse'
    'gtk3'
    'libcdio'
    'libogg'
    'openssl-1.1'
    'cairo'
    'libvorbis'
    'libcdio-paranoia'
    'curl'
    'lib32-glibc'
    'pango'
)
makedepends=(
    'squashfuse'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.AppImage")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-armhf.AppImage")
source_i686=("${pkgname%-bin}-${pkgver}-i686.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-i686.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('3a93ab88f95f3938bf41c0b94450176b51c15b46910f25e91898cf1b80a46d28')
sha256sums_aarch64=('027a53acf9c083edaada7d9225d6b75b69020a8beec0b99e65e950a19716e37e')
sha256sums_armv7h=('935a12b6c2b5113d6560c297ab6eceb8963d24b31020e1c7766f4095a08075a0')
sha256sums_i686=('76db7d56f61c282f63d3ef80dfd7f5be690ccecf724f5e730a336930629dc4c8')
sha256sums_x86_64=('17d5d8ee6c3a0498e1639d002ff64ee557fe3c9f4b347996107d8755ea91f2d6')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}