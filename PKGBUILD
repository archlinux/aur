# Maintainer: jeryd leuck <jerydleuck@gmail.com>
pkgname=msty-studio-bin
pkgver=2.7.4
pkgrel=1
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
provides=('msty' 'msty-deb' 'msty-rocm-bin' 'msty-studio')
conflicts=('msty' 'msty-deb' 'msty-bin' 'msty-rocm-bin' 'msty-studio')
filename="MstyStudio_amd64_${pkgver}.deb"
source=("$filename::https://next-assets.msty.studio/app/latest/linux/MstyStudio_amd64.deb?ver=$pkgver")
sha256sums=("ef26a2ee5d764e7a2939b8a580a2b3af94300fbc7773f1b53335c9d450f2a97f")

prepare() {
  mkdir -p "$srcdir/pkg-contents"
  bsdtar -xOf "$srcdir/$filename" data.tar.xz | bsdtar -C "$srcdir/pkg-contents" -xv
}

check() {
  find "$srcdir/pkg-contents" -path "*/resources" -prune -o -type f -exec sh -c 'file "$1" | grep -q ELF' _ {} \; -print | while read -r elf; do
    if ldd "$elf" | grep -q "not found"; then
      echo "Broken dependencies in $elf:"
      ldd "$elf" | grep "not found"
      exit 1
    fi
  done
}

package() {
  # Copy extracted files to pkgdir (do not preserve ownership to support container builds)
  cp -a --no-preserve=ownership "$srcdir/pkg-contents/." "$pkgdir/"

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
