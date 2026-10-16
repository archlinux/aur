# Maintainer: MLM-stuff <gfxoxinzh@mozmail.com>
pkgname=miniter-bin
_pkgname=miniter
pkgver=0.9.7
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
sha256sums_x86_64=('27a81e5d19522e4fa957a76bd774c14eaa540ac34adf4db3fb1179d9aa990bcc')
sha256sums_aarch64=('8feaf40ff55965cf77058c0db9465c47caa1cb47965a56c158432e84e7a4462d')
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
