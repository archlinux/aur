# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=miniter-bin
_pkgname=miniter
pkgver=0.6.2
pkgrel=1
pkgdesc="Basic video editor (for simple tasks)"
arch=('x86_64' 'aarch64')
url="https://github.com/mlm-games/miniter"
license=('GPL3')
depends=('fuse2' 'zlib')
provides=('miniter')
conflicts=('miniter')
options=('!strip')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/mlm-games/miniter/releases/download/${pkgver}/miniter-${pkgver}-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/mlm-games/miniter/releases/download/${pkgver}/miniter-${pkgver}-aarch64.AppImage")
sha256sums_x86_64=('9b3c1c2246df55996f7e00b97c0e2faa8487c4395eeb277a264f1d872d915020')
sha256sums_aarch64=('a2b589dcf5bfbe4a5d87c35df8b91df94012f23ac889d31893099aee87b6fe46')
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
