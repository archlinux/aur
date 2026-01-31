pkgname=lmstudio-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="LM Studio - A desktop app for exploring and running large language models locally"
arch=('x86_64')
url="https://lmstudio.ai"
license=('EULA')
depends=('fuse2' 'zlib' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
options=('!strip')
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
  
  # Extract icon from AppImage and install to hicolor theme
  # Create temporary directory for extraction
  local tmpdir=$(mktemp -d)
  cd "$tmpdir"
  
  # Extract AppImage
  "${srcdir}/${source[0]##*/}" --appimage-extract > /dev/null 2>&1 || true
  
  # Find and install icon (check both 512x512 and 0x0 for XDG compliance)
  if [ -f "squashfs-root/usr/share/icons/hicolor/512x512/apps/lm-studio.png" ]; then
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/lm-studio.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/lmstudio-bin.png"
  elif [ -f "squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png" ]; then
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png" "$pkgdir/usr/share/icons/hicolor/0x0/apps/lmstudio-bin.png"
  fi
  
  cd - > /dev/null
  rm -rf "$tmpdir"
  
  # Desktop entry
  install -Dm644 "$srcdir/lmstudio.desktop" "$pkgdir/usr/share/applications/lmstudio.desktop"
  
  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lm-studio/lm-studio.AppImage "$pkgdir/usr/bin/lm-studio"
}
