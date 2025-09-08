pkgname=wayclip-cli
pkgver=0.1.56
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb')
makedepends=('rust' 'cargo' 'clang' 'git')
_core_ver="v0.1.4"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/${_core_ver}/wayclip-${_core_ver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare() {
  if [ -d "$srcdir/cli-$pkgver" ]; then
    mv "$srcdir/cli-$pkgver" "$srcdir/$pkgname-$pkgver"
  fi
  mkdir -p "$srcdir/wayclip-core"
  bsdtar -xvf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/wayclip-core"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/wayclip-cli" "$pkgdir/usr/bin/wayclip-cli"
  core_bin_dir="$srcdir/wayclip-core/wayclip-binaries"
  for n in daemon trigger; do
    if [ -f "$core_bin_dir/$n" ]; then
      install -Dm755 "$core_bin_dir/$n" "$pkgdir/usr/bin/wayclip-$n"
    else
      echo "ERROR: Did not find the '$n' binary in $core_bin_dir!"
      return 1
    fi
  done
  if [ -f "assets/wayclip-daemon.service" ]; then
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/wayclip-daemon|' "assets/wayclip-daemon.service"
    install -Dm644 "assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
  fi
}
