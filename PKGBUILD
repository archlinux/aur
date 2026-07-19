# Maintainer: Yeah <ethanaur@yaojiu.org>
pkgname=creamlinux-installer-appimage
pkgver=1.7.1
pkgrel=3
pkgdesc="GUI application for managing DLC IDs in Steam games (AppImage version)"
arch=('x86_64')
url="https://github.com/Novattz/creamlinux-installer"
provides=('creamlinux')
conflicts=('creamlinux' 'creamlinux-installer-bin')
license=('MIT')
depends=('fuse2' 'webkit2gtk-4.1')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Novattz/creamlinux-installer/releases/download/v${pkgver}/Creamlinux_${pkgver}_amd64.AppImage")
sha256sums=('5375bac0a6be7d07435a27f25360a0af6a9692cf94350c8b9e994610b7c4c815')
install=${pkgname}.install
options=('!strip' '!debug')

prepare() {
  local appimage="${pkgname}-${pkgver}.AppImage"
  chmod +x "$appimage"
  ./"${appimage}" --appimage-extract usr/share/icons/hicolor/512x512/apps/creamlinux.png
}

package() {
  # Install appimage file
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/${pkgname}/creamlinux.AppImage"

  # Symlink to /usr/bin
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/creamlinux.AppImage" "${pkgdir}/usr/bin/creamlinux"

  # Install icon file
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/creamlinux.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/creamlinux.png"

  # Desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/creamlinux.desktop" << 'EOF'
[Desktop Entry]
Name=Creamlinux
Exec=/usr/bin/creamlinux
Icon=creamlinux
Type=Application
Categories=Game;Utility;
Comment=DLC Manager for Steam games on Linux
EOF
}
