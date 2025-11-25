# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=mages-bin
_pkgname=mages
pkgver=0.7.2
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

sha256sums_x86_64=('3cf4a2f7b1db1d7d0bfa20e13e6273ab3e33b3c6afbd22c7d0cb4f3fdcfc70ad')
sha256sums_aarch64=('80bd41c22081761c5fb7199d601b8d949974d1dda90d1e6040b0f9fd97bcc1c4')

prepare() {
  chmod +x "${_pkgname}-${pkgver}-${CARCH}.AppImage"
  
  # Extract .desktop file and icons from AppImage
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract "${_pkgname}.desktop" 2>/dev/null || true
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract "usr/share/icons" 2>/dev/null || true
  "./${_pkgname}-${pkgver}-${CARCH}.AppImage" --appimage-extract "*.png" 2>/dev/null || true
}

package() {
  # Install AppImage
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}.AppImage" \
    "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  
  # Create wrapper script
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'WRAPPER'
#!/bin/sh
exec /opt/mages/mages.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  # Install .desktop file
  if [ -f "squashfs-root/${_pkgname}.desktop" ]; then
    install -Dm644 "squashfs-root/${_pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # Fix Exec path in desktop file
    sed -i 's|Exec=Mages|Exec=mages|g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  else
    # Fallback desktop entry if extraction failed
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
  fi

  # Install icons
  if [ -d "squashfs-root/usr/share/icons" ]; then
    cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
  elif [ -f "squashfs-root/${_pkgname}.png" ]; then
    # Fallback: install single icon
    install -Dm644 "squashfs-root/${_pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  fi
}
