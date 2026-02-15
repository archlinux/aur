# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=mages-bin
_pkgname=mages
pkgver=2.6.3
pkgrel=1
pkgdesc="Mages desktop (early testing)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/mages"
license=('GPL3')
depends=('fuse2' 'zlib')
provides=('mages')
conflicts=('mages')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/mlm-games/mages/releases/download/${pkgver}/mages-${pkgver}-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/mlm-games/mages/releases/download/${pkgver}/mages-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('58a811ca290f735bf3aed29bf5aa32c62f11f8fec803abbb5ef48e328fddd374')
sha256sums_aarch64=('bb9d4840c2cad487bfd0633755c7ffd14f2588d62b433eecdcacf4776f4b7c09')
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
