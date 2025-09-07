# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=${PKG_VER}
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb')
makedepends=('rust' 'cargo' 'clang' 'git')
_core_ver="${CORE_TAG_FULL}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz"
        "wayclip-core.tar.gz::https://github.com/Wayclip/core/releases/download/${_core_ver}/wayclip-${_core_ver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP' 'SKIP')

prepare() {
  echo ">>> [prepare] contents of \$srcdir before anything:"
  ls -l "$srcdir"

  if [ -d "$srcdir/cli-$pkgver" ]; then
    mv "$srcdir/cli-$pkgver" "$srcdir/$pkgname-$pkgver"
  elif [ -d "$srcdir/wayclip-cli-$pkgver" ]; then
    mv "$srcdir/wayclip-cli-$pkgver" "$srcdir/$pkgname-$pkgver"
  fi

  mkdir -p "$srcdir/wayclip-core"
  if [ -f "$srcdir/wayclip-core.tar.gz" ]; then
    echo ">>> [prepare] extracting wayclip-core.tar.gz"
    bsdtar -xvf "$srcdir/wayclip-core.tar.gz" -C "$srcdir/wayclip-core"
  else
    echo ">>> [prepare] looking for fallback core archive..."
    core_archive=$(ls "$srcdir"/wayclip-*-x86_64-unknown-linux-gnu.tar.gz 2>/dev/null | head -n1 || true)
    echo ">>> [prepare] found fallback core archive: $core_archive"
    [ -n "$core_archive" ] && bsdtar -xvf "$core_archive" -C "$srcdir/wayclip-core"
  fi

  echo ">>> [prepare] contents of wayclip-core after extraction:"
  ls -lR "$srcdir/wayclip-core"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/wayclip-cli" "$pkgdir/usr/bin/wayclip-cli"

  core_bin_dir="$srcdir/wayclip-core"
  echo ">>> [package] checking for core binaries inside $core_bin_dir"
  ls -lR "$core_bin_dir" || true

  for n in daemon trigger; do
    echo ">>> [package] searching for $n..."
    if [ -x "$core_bin_dir/$n" ]; then
      echo ">>> [package] found $n directly"
      install -Dm755 "$core_bin_dir/$n" "$pkgdir/usr/bin/wayclip-$n"
    else
      found=$(find "$srcdir/wayclip-core" -type f -name "$n" -perm -111 2>/dev/null | head -n1 || true)
      if [ -n "$found" ]; then
        echo ">>> [package] found $n at $found"
        install -Dm755 "$found" "$pkgdir/usr/bin/wayclip-$n"
      else
        echo ">>> [package] ERROR: did not find $n!"
      fi
    fi
  done

  if [ -f "assets/wayclip-daemon.service" ]; then
    sed -i 's|__WAYCLIP_DAEMON_PATH__|/usr/bin/wayclip-daemon|' "assets/wayclip-daemon.service"
    install -Dm644 "assets/wayclip-daemon.service" "$pkgdir/usr/lib/systemd/user/wayclip-daemon.service"
  fi
}
