# Maintainer: Biryukov Nikita <n.biryukov.04@gmail.com>
pkgname=wwal-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Fast Wayland wallpaper, video, shader, and Steam Workshop engine with Material You color extraction (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Execorn/wwal"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'wayland'
  'libdrm'
  'mesa'
  'libva'
  'liburing'
  'libseccomp'
  'libpng'
  'libjpeg-turbo'
)
optdepends=(
  'libwebp: WebP static and animated image decoding'
  'libavif: AVIF and HEIC HDR/Solar dynamic wallpaper decoding'
  'libjxl: JPEG-XL image decoding'
  'librsvg: SVG vector wallpaper rendering'
  'pipewire: Real-time audio capture for audio-reactive shaders and scenes'
  'ffmpeg: Software video fallback and animated image pre-transcoding'
  'lz4: Fast Wallpaper Engine .tex LZ4 decompression'
)
provides=('wwal' 'wwald')
conflicts=('wwal' 'wwal-git')
source=(
  "wwal-${pkgver}-linux-x86_64.tar.gz::https://github.com/Execorn/wwal/releases/download/v${pkgver}/wwal-v${pkgver}-linux-x86_64.tar.gz"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Execorn/wwal/v${pkgver}/LICENSE"
)
sha256sums=(
  'd91bbddf80043c3d5d1d45ef527989ed9f7d1b60cf6e9014f239f7ee07256306'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
  local _prefix="${srcdir}/usr"
  if [[ -d "${srcdir}/usr/local" ]]; then
    _prefix="${srcdir}/usr/local"
  fi

  install -Dm755 "${_prefix}/bin/wwal" "${pkgdir}/usr/bin/wwal"
  install -Dm755 "${_prefix}/bin/wwald" "${pkgdir}/usr/bin/wwald"

  install -Dm644 "${_prefix}/lib/systemd/user/wwald.service" "${pkgdir}/usr/lib/systemd/user/wwald.service"
  sed -i 's|/usr/local/bin/wwald|/usr/bin/wwald|g; s|^ExecStart=wwald$|ExecStart=/usr/bin/wwald|' \
    "${pkgdir}/usr/lib/systemd/user/wwald.service"
  install -Dm644 "${_prefix}/lib/systemd/user/wwald.socket" "${pkgdir}/usr/lib/systemd/user/wwald.socket"

  install -Dm644 "${_prefix}/share/man/man1/wwal.1" "${pkgdir}/usr/share/man/man1/wwal.1"
  install -Dm644 "${_prefix}/share/man/man1/wwald.1" "${pkgdir}/usr/share/man/man1/wwald.1"
  install -Dm644 "${_prefix}/share/man/man5/wwal-config.5" "${pkgdir}/usr/share/man/man5/wwal-config.5"

  install -Dm644 "${_prefix}/share/bash-completion/completions/wwal" \
    "${pkgdir}/usr/share/bash-completion/completions/wwal"
  install -Dm644 "${_prefix}/share/zsh/site-functions/_wwal" \
    "${pkgdir}/usr/share/zsh/site-functions/_wwal"
  install -Dm644 "${_prefix}/share/fish/vendor_completions.d/wwal.fish" \
    "${pkgdir}/usr/share/fish/vendor_completions.d/wwal.fish"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
