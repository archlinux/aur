pkgname=lmstudio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="LM Studio - A desktop app for exploring and running large language models locally"
arch=('x86_64')
url="https://lmstudio.ai"
license=('EULA')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
options=('!strip')
install=lmstudio-bin.install
source=("https://installers.lmstudio.ai/linux/x64/0.4.1-1/LM-Studio-0.4.1-1-x64.AppImage"
        "lmstudio.desktop")
sha256sums=('d18e178cadef7d6798f19e6d41f33a297e26a1d285091cbc30da8252d18a46f0'
            'SKIP')

prepare() {
  chmod +x "${srcdir}/${source[0]##*/}"
}

package() {
  # Create installation directory
  install -dm755 "$pkgdir/opt/lm-studio"
  
  # Install AppImage
  install -Dm755 "${srcdir}/${source[0]##*/}" "$pkgdir/opt/lm-studio/lm-studio.AppImage"
  
  # Extract icons from AppImage and install to hicolor theme and pixmaps
  # Create temporary directory for extraction
  local tmpdir=$(mktemp -d)
  cd "$tmpdir"
  
  # Extract AppImage
  "${srcdir}/${source[0]##*/}" --appimage-extract > /dev/null 2>&1 || true
  
  # Install 1024x1024 icon (from 0x0 resolution - XDG fallback)
  if [ -f "squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png" ]; then
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/lmstudio-bin.png"
  fi
  
  # Install 512x512 icon (from resources)
  if [ -f "squashfs-root/resources/app/.webpack/Icon-512x512.png" ]; then
    install -Dm644 "squashfs-root/resources/app/.webpack/Icon-512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/lmstudio-bin.png"
  fi
  
  # Install pixmap fallback (512x512 for absolute path reference in .desktop)
  if [ -f "squashfs-root/resources/app/.webpack/Icon-512x512.png" ]; then
    install -Dm644 "squashfs-root/resources/app/.webpack/Icon-512x512.png" "$pkgdir/usr/share/pixmaps/lmstudio-bin.png"
  fi
  
  cd - > /dev/null
  rm -rf "$tmpdir"
  
  # Desktop entry
  install -Dm644 "$srcdir/lmstudio.desktop" "$pkgdir/usr/share/applications/lmstudio.desktop"
  
  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lm-studio/lm-studio.AppImage "$pkgdir/usr/bin/lm-studio"
}
