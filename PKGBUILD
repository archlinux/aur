# Maintainer: konyogony <dev@wayclip.com>
pkgname=wayclip-cli
pkgver=0.1.85
pkgrel=1
pkgdesc="The CLI interface for Wayclip, an instant replay tool built for the Linux community."
arch=('x86_64')
url="https://github.com/Wayclip/cli"
license=('MIT')
depends=('pipewire' 'wayland' 'alsa-lib' 'ffmpeg' 'gstreamer' 'gst-plugins-base' 'dbus' 'libxcb' 'jq')
makedepends=('rust' 'cargo' 'curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wayclip/cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"
  echo "Fetching the latest core release information from GitHub..."
  
  local core_api_url="https://api.github.com/repos/Wayclip/core/releases/latest"
  local core_release_data=$(curl -s "$core_api_url")
  _core_ver=$(echo "$core_release_data" | jq -r '.tag_name')
  
  local asset_name="wayclip-$_core_ver-x86_64-unknown-linux-gnu.tar.gz"
  local core_download_url=$(echo "$core_release_data" | jq -r --arg name "$asset_name" '.assets[] | select(.name == $name) | .browser_download_url')

  if [ -z "$_core_ver" ] || [ "$_core_ver" == "null" ] || [ -z "$core_download_url" ] || [ "$core_download_url" == "null" ]; then
    echo "::error::Could not determine the latest core release tag or download URL."
    exit 1
  fi
  
  echo "Downloading core binaries version ${_core_ver} from ${core_download_url}..."
  curl -L -o "wayclip-core-binaries.tar.gz" "$core_download_url"
  
  tar -xzf "wayclip-core-binaries.tar.gz"
}

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
