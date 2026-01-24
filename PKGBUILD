pkgname=auriscribe
pkgver=c536ffe
pkgrel=1
pkgdesc="Auriscribe - offline speech-to-text tray app (git)"
arch=('x86_64')
url="https://github.com/rabfulton/Auriscribe"
license=('MIT')
depends=('gtk3' 'libayatana-appindicator' 'libpulse' 'json-c' 'curl' 'libx11')
makedepends=('git' 'base-devel' 'pkgconf')
optdepends=('xdotool: X11 typing/paste' 'wtype: Wayland typing/paste' 'wl-clipboard: Wayland clipboard paste' 'xclip: X11 clipboard paste')
provides=('auriscribe')
conflicts=('auriscribe')
source=(
  "git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Auriscribe"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/Auriscribe"

  # Build whisper.cpp static library (enable Vulkan if available)
  if pkg-config --exists vulkan; then
    make -C libs/whisper.cpp GGML_VULKAN=1 libwhisper.a -j"$(nproc)"
  else
    make -C libs/whisper.cpp libwhisper.a -j"$(nproc)"
  fi

  make -j"$(nproc)"
}

package() {
  cd "$srcdir/Auriscribe"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
