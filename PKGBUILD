# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=wiiudownloader-bin
pkgver=3.2
pkgrel=1
pkgdesc="Download encrypted Wii U files from Nintendo's official servers (upstream AppImage)"
arch=('x86_64')
url="https://github.com/Xpl0itU/WiiUDownloader"
license=('GPL-3.0-or-later')
# the AppImage is built with sharun and carries GTK4, libadwaita, Mesa and its
# own glibc and dynamic loader; only the shell that runs its AppRun.sh is left
depends=('hicolor-icon-theme' 'sh')
provides=('wiiudownloader')
conflicts=('wiiudownloader')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/WiiUDownloader-Linux-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('e0d6fd3a244bbe0a49949c8e22ae9e3e7cc8842b9187e58ebae6631be0b826d4')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  # upstream's AppImage payload, installed unchanged; its self-updater hook
  # only acts when started from an AppImage ($APPIMAGE), so it stays inert
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgname/"
  rm -f "$pkgdir/opt/$pkgname/.DirIcon"

  # AppRun resolves its own directory, so it has to be exec'd by its real
  # path - a symlink from /usr/bin would make it look next to the symlink
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/wiiudownloader" << EOF
#!/bin/sh
exec /opt/$pkgname/AppRun "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/wiiudownloader"

  install -Dm644 "$srcdir/squashfs-root/WiiUDownloader.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/wiiudownloader.png"
  install -Dm644 "$srcdir/squashfs-root/WiiUDownloader.desktop" \
    "$pkgdir/usr/share/applications/wiiudownloader.desktop"
  sed -i -e 's|^Exec=.*|Exec=wiiudownloader|' -e 's|^Icon=.*|Icon=wiiudownloader|' \
    -e '/^X-AppImage-/d' \
    "$pkgdir/usr/share/applications/wiiudownloader.desktop"
}
