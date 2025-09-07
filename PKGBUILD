# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.47
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb')
makedepends=('rust' 'cargo' 'clang' 'git' 'bsdtar')
_core_ver="${CORE_TAG_FULL}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/${_core_ver}/wayclip-${_core_ver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare() {
  if [ -d "$srcdir/cli-$pkgver" ]; then
    mv "$srcdir/cli-$pkgver" "$srcdir/$pkgname-$pkgver"
  elif [ -d "$srcdir/wayclip-cli-$pkgver" ]; then
    mv "$srcdir/wayclip-cli-$pkgver" "$srcdir/$pkgname-$pkgver"
  fi

  mkdir -p "$srcdir/wayclip-core"
  if [ -f "$srcdir/wayclip-core.tar.gz" ]; then
    bsdtar -xzf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/wayclip-core"
  else
    core_archive=$(ls "$srcdir"/wayclip-*-x86_64-unknown-linux-gnu.tar.gz 2>/dev/null | head -n1 || true)
    if [ -n "$core_archive" ]; then
      bsdtar -xzf "$core_archive" -C "$srcdir/wayclip-core"
    fi
  fi

  if [ -d "$srcdir/wayclip-core" ]; then
    subdirs=$(find "$srcdir/wayclip-core" -mindepth 1 -maxdepth 1 -type d | wc -l)
    if [ "$subdirs" -eq 1 ]; then
      for d in "$srcdir/wayclip-core"/*/; do
        mv "$d"* "$srcdir/wayclip-core/" 2>/dev/null || true
      done
      find "$srcdir/wayclip-core" -mindepth 1 -maxdepth 1 -type d -exec rmdir {} \; 2>/dev/null || true
    fi
  fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/wayclip-cli" "$pkgdir/usr/bin/wayclip-cli"

  core_bin_dir="$srcdir/wayclip-core"
  for n in daemon trigger; do
    if [ -x "$core_bin_dir/$n" ]; then
      install -Dm755 "$core_bin_dir/$n" "$pkgdir/usr/bin/wayclip-$n"
    else
      found=$(find "$srcdir" -type f -name "$n" -perm -111 2>/dev/null | head -n1 || true)
      if [ -n "$found" ]; then
        install -Dm755 "$found" "$pkgdir/usr/bin/wayclip-$n"
      else
        msg "warning: core binary '$n' not found - skipping (build will still succeed if not required)."
      fi
    fi
  done

  if [ -f "assets/wayclip-daemon.service" ]; then
    sed -i 's|__WAYCLIP_DAEMON_PATH__|/usr/bin/wayclip-daemon|' "assets/wayclip-daemon.service"
    install -Dm644 "assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
  fi
}
