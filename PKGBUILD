# Maintainer: jeryd leuck <jerydleuck@gmail.com>
# Contributor: envolution <envolution at mesh dot xyz>
# Contributor: SoleSoul

pkgname=lmstudio-beta
_appname=lm-studio
pkgver=0.4.14
pkgrel=1
pkgdesc="Discover, download, and run local LLMs (Professional Beta Repack)"
arch=('x86_64')
url="https://lmstudio.ai/"
license=('LicenseRef-EULA')
depends=('alsa-lib' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'mesa' 'nss' 'pango')
optdepends=('cuda: NVIDIA GPU acceleration'
            'rocm-core: AMD GPU acceleration')
provides=('lmstudio')
conflicts=('lmstudio-beta-appimage')
filename="LM-Studio-${pkgver}-1-x64.deb"
source=("$filename::https://installers.lmstudio.ai/linux/x64/${pkgver}-1/LM-Studio-${pkgver}-1-x64.deb")
sha256sums=('b6a5a61f0058f72f8ad77ceaa6a669b473303f304574ea8f0ba54ccf60e68ee2')

package() {
  # Extract data.tar.xz from the debian package
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$pkgdir" -xv

  # Fix permissions for chrome-sandbox (required for Electron sandboxing)
  chmod 4755 "$pkgdir/opt/LM-Studio/chrome-sandbox"

  # Create symlink for terminal access
  install -d "$pkgdir/usr/bin"
  ln -s /opt/LM-Studio/lm-studio "$pkgdir/usr/bin/lmstudio-beta"
  ln -s /opt/LM-Studio/lm-studio "$pkgdir/usr/bin/lms-beta"

  # Fix the icon path (the .deb uses usr/share/icons/hicolor/0x0/...)
  install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  mv "$pkgdir/usr/share/icons/hicolor/0x0/apps/lm-studio.png" \
     "$pkgdir/usr/share/icons/hicolor/512x512/apps/lmstudio-beta.png"
  rmdir "$pkgdir/usr/share/icons/hicolor/0x0/apps"
  rmdir "$pkgdir/usr/share/icons/hicolor/0x0"

  # Fix the desktop file
  mv "$pkgdir/usr/share/applications/lm-studio.desktop" "$pkgdir/usr/share/applications/lmstudio-beta.desktop"
  sed -i 's/^Name=.*/Name=LM Studio Beta/' "$pkgdir/usr/share/applications/lmstudio-beta.desktop"
  sed -i "s|^Exec=.*|Exec=/usr/bin/lmstudio-beta %U|" "$pkgdir/usr/share/applications/lmstudio-beta.desktop"
  sed -i 's/^Icon=.*/Icon=lmstudio-beta/' "$pkgdir/usr/share/applications/lmstudio-beta.desktop"
  
  # Install License
  install -Dm644 "$pkgdir/opt/LM-Studio/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
}
