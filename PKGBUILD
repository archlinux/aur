pkgname=stroke
pkgver=0.4.7
pkgrel=2
pkgdesc="Cross-database desktop studio built with Tauri"
arch=('x86_64')
url="https://github.com/broisnischal/stroke"
license=('custom')
depends=('fuse2')
options=(!strip)

source=("${pkgname}-${pkgver}.AppImage::https://github.com/broisnischal/stroke/releases/download/v${pkgver}/Stroke_${pkgver}_amd64.AppImage")
sha256sums=('dee0443d9a31c679d71513e985b3fae269cad225749fe0a1ff73103cfafbc683')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  cd "${srcdir}"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/stroke/stroke.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/stroke" <<'WRAPPER'
#!/usr/bin/env sh
export WEBKIT_DISABLE_DMABUF_RENDERER=1
export WEBKIT_FORCE_SANDBOX=0
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export GDK_BACKEND=x11
export GSK_RENDERER=cairo
exec /opt/stroke/stroke.AppImage "$@"
WRAPPER

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/stroke.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Stroke
Comment=Cross-database desktop studio
Exec=stroke %U
Icon=stroke
Terminal=false
Type=Application
Categories=Development;Database;
StartupWMClass=stroke
DESKTOP

  for _size in 16x16 32x32 64x64 128x128 256x256; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/app.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/stroke.png"
  done
}
