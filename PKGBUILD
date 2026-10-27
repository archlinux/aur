# Maintainer: Biryukov Nikita <n.biryukov.04@gmail.com>
pkgname=wwal-git
_pkgname=wwal
pkgver=1.1.0.r0.g0e7ee35
pkgrel=1
pkgdesc="Fast Wayland wallpaper, video, shader, and Steam Workshop engine with Material You color extraction"
arch=('x86_64' 'aarch64')
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
makedepends=(
  'git'
  'meson'
  'ninja'
  'pkgconf'
  'python'
  'wayland-protocols'
)
provides=('wwal' 'wwald')
conflicts=('wwal')
source=("git+https://github.com/Execorn/wwal.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "1.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  arch-meson "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}/build" \
    --auto-features=auto \
    -Doptimization=3 \
    -Db_lto=true \
    -Db_pie=true \
    -Denable_vaapi=true \
    -Denable_io_uring=true \
    -Denable_simd=true \
    -Denable_seccomp=true \
    -Denable_systemd=true \
    -Dtests=true
  meson compile -C "${srcdir}/${_pkgname}/build"
}

check() {
  meson test -C "${srcdir}/${_pkgname}/build" --print-errorlogs
}

package() {
  meson install -C "${srcdir}/${_pkgname}/build" --destdir "${pkgdir}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
