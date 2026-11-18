# Maintainer: Yeah <ethanaur@yaojiu.org>
pkgname=creamlinux-installer-appimage
pkgver=1.8.0
pkgrel=1
pkgdesc="GUI application for managing DLC IDs in Steam games (AppImage version)"
arch=('x86_64')
url="https://github.com/Novattz/creamlinux-installer"
provides=('creamlinux')
conflicts=('creamlinux' 'creamlinux-installer-bin')
license=('MIT')
depends=('fuse2' 'webkit2gtk-4.1')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/Novattz/creamlinux-installer/releases/download/v${pkgver}/Creamlinux_${pkgver}_amd64.AppImage")
sha256sums=('43d495fac29a5fbab865f1f689967768fb1171179aa8ce9ed5184a94464aa4f1')
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
Icon=/usr/share/icons/hicolor/512x512/apps/creamlinux.png
Type=Application
Categories=Game;Utility;
Comment=DLC Manager for Steam games on Linux
EOF
}
