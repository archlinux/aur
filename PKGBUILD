# Maintainer: polarours <polarours@github.com>
pkgname=hyprfetch-git
pkgver=0.2.1.r4.gfda8293
pkgrel=1
pkgdesc="Hyprland-native fetch utility for system, session, and rice state"
arch=("x86_64" "aarch64")
url="https://github.com/polarours/hyprfetch"
license=("GPL-3.0-only")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "git")
optdepends=(
    "hyprland: runtime Hyprland session data"
    "pipewire: audio backend detection"
    "pulseaudio: audio backend detection"
    "iw: WiFi SSID, signal and link speed for drivers without the wireless sysfs files"
    "wireless_tools: WiFi details as a fallback when iw is missing"
)
source=("hyprfetch::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/hyprfetch"
  local version
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/hyprfetch"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/hyprfetch"
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  cd "$srcdir/hyprfetch"
  install -Dm755 "target/$CARCH-unknown-linux-gnu/release/hyprfetch" "$pkgdir/usr/bin/hyprfetch"
  install -Dm644 contrib/hyprfetch.1 "$pkgdir/usr/share/man/man1/hyprfetch.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/hyprfetch/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprfetch/LICENSE"
}
