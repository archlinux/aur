# Maintainer: wingsbutterfly <wingsbutterfly@users.noreply.github.com>
# Contributor: msojocs <jiyecafe@gmail.com>
#
# NVIDIA GPU acceleration fork — Electron 43 (Chromium 150) + VaapiOnNvidiaGPUs
# for NVDEC hardware video decode on NVIDIA GPUs under Wayland.
# Original upstream: https://github.com/msojocs/bilibili-linux
# Fork: https://github.com/wings1848/bilibili-linux

pkgname=bilibili-gpu-bin
_pkgreal=bilibili
pkgver=1.17.9
pkgrel=1
pkgdesc="Bilibili client for Linux (Electron 43, NVIDIA GPU acceleration fork)"
arch=('x86_64')
url="https://github.com/wings1848/bilibili-linux"
license=('MIT')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libva'
  'libva-nvidia-driver'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'cups'
  'libxkbcommon'
  'mesa'
  'alsa-lib'
)
optdepends=(
  'python-faster-whisper: AI subtitle transcription'
)
conflicts=('bilibili' 'bilibili-bin')
provides=("${_pkgreal}=${pkgver}")
source_x86_64=("${_pkgreal}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}-${pkgrel}/bilibili-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=('SKIP')

package() {
  install -dm755 "${pkgdir}/opt/bilibili"
  install -dm755 "${pkgdir}/usr/bin"
  # Extract and install from AppImage
  "${srcdir}/bilibili-${pkgver}-x86_64.AppImage" --appimage-extract
  cp -r squashfs-root/* "${pkgdir}/opt/bilibili/"
  ln -sf "/opt/bilibili/AppRun" "${pkgdir}/usr/bin/bilibili"

  # Install default flags config for NVIDIA GPU acceleration
  install -dm755 "${pkgdir}/etc/skel/.config/bilibili"
  cat > "${pkgdir}/etc/skel/.config/bilibili/bilibili-flags.conf" << 'FLAGS'
--ignore-gpu-blocklist
--use-gl=angle
--use-angle=gl
--enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoDecodeLinuxZeroCopyGL,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,PlatformHEVCDecoderSupport
--enable-gpu-rasterization
--enable-zero-copy
--disable-gpu-sandbox
FLAGS
}
