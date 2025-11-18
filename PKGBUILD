# Maintainer: Your Name <your.email@example.com>
pkgname=collapseloader-bin
pkgver=0.2.3
pkgrel=2
pkgdesc="GUI utility for launching Minecraft clients (binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('GPL-3.0')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('collapseloader')
conflicts=('collapseloader-git')
source=("collapseloader-0.2.3.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/0.2.3/collapseloader_0.2.3_amd64.AppImage")
sha256sums=('SKIP')
noextract=("collapseloader-${pkgver}.AppImage")

prepare() {
  chmod +x "${srcdir}/collapseloader-${pkgver}.AppImage"

  cd "${srcdir}"
  "${srcdir}/collapseloader-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=latest
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients (stable)
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF

  if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" \
      "${pkgdir}/usr/share/pixmaps/collapseloader.png"
  elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
    install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" \
      "${pkgdir}/usr/share/pixmaps/collapseloader.png"
  elif [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
    install -Dm644 "${srcdir}/squashfs-root/.DirIcon" \
      "${pkgdir}/usr/share/pixmaps/collapseloader.png"
  fi
}
