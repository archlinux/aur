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
  
  # Icon Extraction with Search & Fail
  local icon_source=""
  if [ -L "${srcdir}/squashfs-root/.DirIcon" ]; then
      icon_source=$(readlink -f "${srcdir}/squashfs-root/.DirIcon")
  elif [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png" ]; then
      icon_source="${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/lm-studio.png"
  else
      icon_source=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "*.png" | head -n 1)
  fi

  if [ -z "$icon_source" ] || [ ! -f "$icon_source" ]; then
      echo "ERROR: No application icon found!"
      exit 1
  fi

  install -Dm644 "$icon_source" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lmstudio-bin.png"
  install -Dm644 "$icon_source" "${pkgdir}/usr/share/pixmaps/lmstudio-bin.png"
  rm -rf "$tmpdir"
  
  # Desktop entry
  install -Dm644 "$srcdir/lmstudio.desktop" "$pkgdir/usr/share/applications/lmstudio.desktop"
  
  # Symlink to binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lm-studio/lm-studio.AppImage "$pkgdir/usr/bin/lm-studio"
}
