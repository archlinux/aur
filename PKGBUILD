# Maintainer: TheMrAhmad <https://github.com/AtomicError>
pkgname=whisper-desktop-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="High-performance native desktop studio for local speech-to-text, subtitle translation, and video hardsubbing"
arch=('x86_64' 'aarch64')
url="https://github.com/AtomicError/whisper-desktop"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
  'glibc'
  'gcc-libs'
)
optdepends=(
  'vulkan-icd-loader: Vulkan GPU hardware acceleration'
  'intel-compute-runtime: Intel Iris Xe / Arc GPU OpenVINO acceleration'
  'libayatana-appindicator: System tray indicator support'
  'ffmpeg: System FFmpeg utilities (if configured to use system binary)'
)
provides=('whisper-desktop')
conflicts=('whisper-desktop')
options=('!strip')

source=("LICENSE-v${pkgver}::https://raw.githubusercontent.com/AtomicError/whisper-desktop/v${pkgver}/LICENSE")
sha256sums=('37f60e97a2677fe8cc2ad83fd4576decb90675c0fe189598450677bf5820e53a')

source_x86_64=("https://github.com/AtomicError/whisper-desktop/releases/download/v${pkgver}/WhisperDesktop_${pkgver}_amd64.deb")
sha256sums_x86_64=('cdbe4018e47a61443cfcdd6800722191fa7e17aba479d4d17d0788e36ffe70d0')

source_aarch64=("https://github.com/AtomicError/whisper-desktop/releases/download/v${pkgver}/WhisperDesktop_${pkgver}_arm64.deb")
sha256sums_aarch64=('4d5aa981d41c0879184b385580cdfb55f2abebcd6690b3e5016441bf728c1c3f')

package() {
  cd "$srcdir"

  # Extract the main data payload of the deb package into the Arch packaging directory
  if [ -f data.tar.zst ]; then
    bsdtar -xf data.tar.zst -C "$pkgdir/"
  elif [ -f data.tar.xz ]; then
    bsdtar -xf data.tar.xz -C "$pkgdir/"
  elif [ -f data.tar.gz ]; then
    bsdtar -xf data.tar.gz -C "$pkgdir/"
  else
    # Safe fallback if makepkg didn't automatically unpack the deb archive
    local _deb=(WhisperDesktop_"${pkgver}"_*.deb)
    bsdtar -xf "$srcdir/${_deb[0]}"
    bsdtar -xf data.tar.* -C "$pkgdir/"
  fi

  # FreeDesktop desktop file compatibility symlink
  if [ -f "$pkgdir/usr/share/applications/Whisper Desktop.desktop" ]; then
    ln -s "Whisper Desktop.desktop" "$pkgdir/usr/share/applications/whisper-desktop.desktop"
  fi

  # Ensure correct execution permissions on binaries and dynamic libraries
  chmod 755 "$pkgdir/usr/bin/whisper-desktop"
  if [ -d "$pkgdir/usr/lib/Whisper Desktop/resources" ]; then
    chmod 755 "$pkgdir/usr/lib/Whisper Desktop/resources"/ffmpeg
    chmod 755 "$pkgdir/usr/lib/Whisper Desktop/resources"/ffprobe
    chmod 755 "$pkgdir/usr/lib/Whisper Desktop/resources"/whisper-cli-*
    find "$pkgdir/usr/lib/Whisper Desktop/resources" -name "*.so*" -exec chmod 755 {} +
  fi

  # Install upstream license
  install -Dm644 "$srcdir/LICENSE-v${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
