# Binary package for Sumi (prebuilt release tarball), Arch Linux x86_64.
# The tarball is built by CI and upstream publishes SHA256SUMS.txt with every release.
# The published checksum for this release is pinned in sha256sums below.
pkgname=sumi-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Paint, draw and sketch: the Sumi desktop app (prebuilt binary)'
arch=('x86_64')
url='https://github.com/mafuzyk/sumi'
license=('GPL-3.0-or-later')
provides=('sumi')
conflicts=('sumi')
# The binary ships already stripped by package.sh; keep it byte-identical to the published sums.
options=(!strip)
# nfpm's depends, in Arch package names (libx11 covers Debian's libx11-6 + libx11-xcb1).
depends=(
  glibc
  gcc-libs
  libxkbcommon
  libxkbcommon-x11
  wayland
  libx11
  libxcb
  libxcursor
  libxi
  vulkan-icd-loader
)
# nfpm's recommends, in Arch package names. Sumi shells out to pw-play/pw-cat, paplay/pacat
# or aplay for Feedback Sounds and brush sounds; on Arch those tools come from these packages
# (not from the pipewire/pulseaudio sound servers themselves).
optdepends=(
  'mesa: OpenGL/EGL fallback when the GPU has no Vulkan'
  'vulkan-intel: Vulkan driver for Intel integrated GPUs'
  'vulkan-radeon: Vulkan driver for AMD Radeon GPUs'
  'vulkan-nouveau: Vulkan driver for NVIDIA GPUs (open-source Nouveau)'
  'vulkan-swrast: software Vulkan driver (CPU rendering, no GPU required)'
  'ffmpeg: time-lapse, animation and video import/export'
  'poppler: open PDF files as frames'
  'pipewire-audio: Feedback Sounds and brush sounds via pw-play/pw-cat (PipeWire)'
  'libpulse: Feedback Sounds and brush sounds via paplay/pacat (PulseAudio client)'
  'alsa-utils: Feedback Sounds and brush sounds via aplay (ALSA)'
)
source=("$pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/mafuzyk/sumi/releases/download/v$pkgver/sumi-$pkgver-linux-x86_64.tar.gz")
sha256sums=('4356c5d685b9f9962f25823ea12a1cc69861bb03c4e853af1690eb1257bdc6b4')

package() {
  cd "$srcdir/sumi-$pkgver-linux-x86_64"
  mkdir -p "$pkgdir"
  # The tarball root (sumi-<version>-linux-x86_64/) holds bin/ and share/ directly, not usr/:
  # package.sh does `cp -R "$STAGE/usr" "$WORK/tar/$BASENAME"`, which creates $BASENAME as the
  # copy of usr/. Install from that real layout into the FHS paths.
  install -Dm755 bin/sumi "$pkgdir/usr/bin/sumi"
  mkdir -p "$pkgdir/usr/share" && cp -a share/. "$pkgdir/usr/share/"
}
