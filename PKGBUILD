# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="fireblocks recovery utility"
pkgname="${_pkgname// /-}-bin"
_appname="Fireblocks Recovery Utility"
pkgver=0.3.5
pkgrel=1
pkgdesc="Recover Fireblocks assets and keys in a disaster, verify a Recovery Kit, or generate keys to set up a new Recovery Kit."
arch=('x86_64')
url="https://www.fireblocks.com/"
_ghurl="https://github.com/fireblocks/recovery"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxcomposite'
    'libcups'
    'libxkbcommon'
    'mesa'
    'libdbusmenu-glib'
    'expat'
    'gtk2'
    'nss'
    'nspr'
    'wayland'
    'libxext'
    'dbus-glib'
    'hicolor-icon-theme'
    'libxdamage'
    'libx11'
    'libxrandr'
    'alsa-lib'
    'libxcb'
    'at-spi2-core'
    'gtk3'
    'pango'
    'libxfixes'
    'libdrm'
    'cairo'
    'gdk-pixbuf2'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver%.2}/Recovery.Utility.Ubuntu.${CARCH//_/-}.zip
")
sha256sums=('365860a35536f396d085e532feca1faa04f23ffbaafeb1d412a0561aced60e89')
build() {
    chmod a+x "${srcdir}/${_appname}-${pkgver}.AppImage"
    "${srcdir}/${_appname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
    sed -e "s|AppRun|${pkgname%-bin}|g" -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}