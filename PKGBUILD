# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=pomo95-git
_pkgname=pomo95
pkgver=r6.b7a47f9 # Placeholder, pkgver() will generate the real one
pkgrel=1
pkgdesc="Another Pomodoro application"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/trougnouf/pomo95"
license=('MIT')
# Added dependencies for desktop integration
depends=('alsa-lib' 'libxkbcommon' 'wayland' 'libnotify' 'vulkan-icd-loader' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  
  # Install the binary
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  
  # Install the icon
  install -Dm644 "assets/Moon-hills-near_side.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  
  # Install the desktop file
  install -Dm644 "assets/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  
  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
