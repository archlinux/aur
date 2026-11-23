pkgname=snipline-git
pkgver=0.1.0.r1.g62d32ea
pkgrel=1
pkgdesc='Wayland screenshot, recording, QR and OCR selector (Git version)'
arch=('x86_64')
url='https://github.com/lufimio/snipline'
license=('MIT')
provides=("snipline=$pkgver")
conflicts=('snipline')
depends=(
  'curl' 'gcc-libs' 'glibc'
  'qt6-base>=6.5' 'qt6-declarative' 'qt6-wayland' 'qt6-svg'
  'layer-shell-qt' 'wayland' 'grim'
  'gstreamer>=1.20' 'gst-plugins-base-libs' 'gst-plugins-base'
  'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'libpulse'
  'zxing-cpp>=2.0'
)
makedepends=(
  'git' 'cmake>=3.24' 'ninja' 'pkgconf'
  'wayland-protocols>=1.41' 'hyprland-protocols>=0.8'
)
optdepends=(
  'tesseract: OCR recognition'
  'ffmpeg: GIF export'
  'gst-plugins-bad: optional hardware encoders and additional codecs'
)
options=('!debug')
source=("snipline::git+$url.git")
# Git sources are versioned by their commit, not a fixed archive checksum.
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/snipline"

  local version
  if version=$(git describe --tags --long --match 'v[0-9]*' 2>/dev/null); then
    # v0.1.0-2-gabcdef -> 0.1.0.r2.gabcdef
    printf '%s\n' "$version" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.0.0.r%s.g%s\n' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cmake -S "$srcdir/snipline" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  mv "$pkgdir/usr/share/licenses/snipline" "$pkgdir/usr/share/licenses/$pkgname"
}
