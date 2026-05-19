# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=msty-studio
pkgver=2.7.3
pkgrel=5
pkgdesc="Desktop AI workflow application (Local/Private)"
arch=('x86_64')
url="https://msty.ai/"
license=('custom:proprietary')
depends=('alsa-lib' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'mesa' 'nss' 'pango')
optdepends=('cuda: NVIDIA GPU acceleration'
            'rocm-core: AMD GPU acceleration'
            'docker: Intel GPU acceleration (via ipex-llm container workaround)'
            'libpulse: Support for Voice-to-Text and Text-to-Voice features'
            'ollama: Use system-wide Ollama instead of the bundled version')
provides=('msty' 'msty-deb' 'msty-rocm-bin')
conflicts=('msty' 'msty-deb' 'msty-bin' 'msty-rocm-bin')
filename="MstyStudio_amd64_${pkgver}.deb"
source=("$filename::https://next-assets.msty.studio/app/latest/linux/MstyStudio_amd64.deb?ver=$pkgver")
sha256sums=("4dbd8aa69cd7de3ff12a1d219556dca7b7de16469f76b943a06f96d6134d3833")

check() {
  find "$pkgdir" -type f -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print | while read -r elf; do
    if ldd "$elf" | grep -q "not found"; then
      echo "Broken dependencies in $elf:"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done
}

package() {
  # Extract data.tar.xz from the debian package
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$pkgdir" -xv

  # Fix permissions for chrome-sandbox (required for Electron sandboxing)
  chmod 4755 "$pkgdir/opt/MstyStudio/chrome-sandbox"

  # Fix the .desktop file (Name with space, clean up extra lines)
  sed -i 's/^Name=.*/Name=Msty Studio/' "$pkgdir/usr/share/applications/MstyStudio.desktop"
  sed -i '/^exec=mstystudio/d' "$pkgdir/usr/share/applications/MstyStudio.desktop"

  # Create symlinks in /usr/bin for terminal access
  install -d "$pkgdir/usr/bin"
  ln -s /opt/MstyStudio/MstyStudio "$pkgdir/usr/bin/msty"
  ln -s /opt/MstyStudio/MstyStudio "$pkgdir/usr/bin/msty-studio"

  # Install Licenses
  install -Dm644 "$pkgdir/opt/MstyStudio/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$pkgdir/opt/MstyStudio/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
