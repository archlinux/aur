pkgname=wayclip-cli
pkgver=0.1.66
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb')
makedepends=('rust' 'cargo')
_core_ver="v0.1.13"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core-binaries.tar.gz::https://github.com/Wayclip/core/releases/download/${_core_ver}/wayclip-${_core_ver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir/cli-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/cli-$pkgver/target/release/wayclip-cli" "$pkgdir/usr/bin/wayclip-cli"
  
  install -Dm755 "$srcdir/wayclip-binaries/daemon" "$pkgdir/usr/bin/wayclip-daemon"
  install -Dm755 "$srcdir/wayclip-binaries/trigger" "$pkgdir/usr/bin/wayclip-trigger"
  
  if [ -f "$srcdir/cli-$pkgver/assets/wayclip-daemon.service" ]; then
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/wayclip-daemon|' "$srcdir/cli-$pkgver/assets/wayclip-daemon.service"
    install -Dm644 "$srcdir/cli-$pkgver/assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
  fi
}
