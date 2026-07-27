# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=wiiudownloader-bin
pkgver=2.99
pkgrel=2
pkgdesc="Download encrypted Wii U files from Nintendo's official servers (upstream AppImage)"
arch=('x86_64')
url="https://github.com/Xpl0itU/WiiUDownloader"
license=('GPL-3.0-or-later')
# the AppImage bundles GTK3 and its stack; these are what is left over
depends=('glibc' 'libx11' 'libxcb' 'wayland' 'fontconfig' 'freetype2'
         'harfbuzz' 'fribidi' 'zlib' 'bzip2' 'expat' 'libgpg-error'
         'hicolor-icon-theme')
provides=('wiiudownloader')
conflicts=('wiiudownloader')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/WiiUDownloader-Linux-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('3a2e8e7f34a288308666032d6834db00c515a0c897a66a2ae1012702d017f240')

prepare() {
  chmod +x "$srcdir/${pkgname}-${pkgver}.AppImage"
  "$srcdir/${pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  # upstream's AppImage payload, installed unchanged
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

  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/WiiUDownloader.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/wiiudownloader.png"
  install -Dm644 "$srcdir/squashfs-root/WiiUDownloader.desktop" \
    "$pkgdir/usr/share/applications/wiiudownloader.desktop"
  sed -i -e 's|^Exec=.*|Exec=wiiudownloader|' -e 's|^Icon=.*|Icon=wiiudownloader|' \
    "$pkgdir/usr/share/applications/wiiudownloader.desktop"
}
