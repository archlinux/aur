# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=mages-bin
_pkgname=mages
pkgver=4.9.3
pkgrel=1
pkgdesc="Mages desktop (early testing)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/mages"
license=('GPL3')
depends=()
provides=('mages')
conflicts=('mages')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/mlm-games/mages/releases/download/${pkgver}/mages-${pkgver}-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/mlm-games/mages/releases/download/${pkgver}/mages-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('1a27c21329bd769d476b2e7970a83edf4c84457873281207b0115462f175adb5')
sha256sums_aarch64=('2bd4c7d4852a481bd2cea359c02f349d895f5a2392a514126efed775edae8704')
prepare() {
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.AppImage"
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract
}
package() {
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.AppImage" \
    "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'WRAPPER'
#!/bin/sh
exec /opt/mages/mages.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Mages
Comment=Mages matrix client (desktop)
MimeType=x-scheme-handler/matrix;
Exec=mages %U
Icon=mages
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupNotify=true
DESKTOP_EOF
  install -Dm644 "squashfs-root/mages.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
