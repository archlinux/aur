  # Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
  # Contributor:  solaraquarion <shlomochoina@gmial.com>
  # Contributor:  derbetakevin <derbetakevin@outlook.de>
pkgname=extraterm-bin
_pkgname=ExtratermQt
pkgver=0.81.3
pkgrel=1
pkgdesc="The swiss army chainsaw of terminal emulators.(Prebuilt versrion)"
arch=('x86_64')
url="https://extraterm.org/"
_ghurl="https://github.com/sedwards2009/extraterm"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libdrm'
    'krb5'
    'xcb-util-cursor'
    'at-spi2-core'
    'gtk3'
    'xcb-util-keysyms'
    'qt6-base'
    'xcb-util-wm'
    'libxkbcommon-x11'
)
options=('!strip')
source=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.glibc2.34-${CARCH}.AppImage")
sha256sums=('1541433e560ad088dd29a284f37b931613ca6460694536ce8c8c9de6ecd2f5bb')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
      s/Exec=${pkgname%-bin}qt/Exec=${pkgname%-bin}/g
      s/Icon=extratermqt/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/opt/${pkgname%-bin}qt/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}qt" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}qt.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/opt/${pkgname%-bin}qt/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
