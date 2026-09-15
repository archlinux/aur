# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=miniter-bin
_pkgname=miniter
pkgver=0.9.4
pkgrel=1
pkgdesc="Basic video editor (for simple tasks)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/miniter"
license=('GPL3')
depends=()
optdepends=('fuse2: or fuse3 - runtime dependency for AppImage FUSE mount')
provides=('miniter')
conflicts=('miniter')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/mlm-games/miniter/releases/download/${pkgver}/miniter-${pkgver}-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/mlm-games/miniter/releases/download/${pkgver}/miniter-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('4e54852c02862b8b40d45456fe6c99f68a7d7a02169599e8427b676e040a6259')
sha256sums_aarch64=('6340550d2fbd3cefb0535779174ddd7108bdf5d98a2819b7c07fed1b5bbaf14b')
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
exec /opt/miniter/miniter.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << DESKTOP_EOF
[Desktop Entry]
Name=Miniter
Comment=Miniter video editor (desktop)
MimeType=video/;
Exec=miniter %U
Icon=miniter
Terminal=false
Type=Application
Categories=AudioVideo;Video;
StartupNotify=true
DESKTOP_EOF
  install -Dm644 "squashfs-root/miniter.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
