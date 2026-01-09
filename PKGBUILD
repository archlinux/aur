# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=pomo95-git
_pkgname=pomo95
pkgver=r2.fc77269 # This is a placeholder, pkgver() will generate the real one
pkgrel=1
pkgdesc="Another Pomodoro application"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/trougnouf/pomo95"
license=('MIT')
depends=('alsa-lib' 'libxkbcommon' 'wayland' 'libnotify' 'vulkan-icd-loader')
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
  # Fetch dependencies and generate Cargo.lock. No --locked here.
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  # Build using the lock file generated in prepare(). --locked ensures reproducibility.
  cargo build --release --locked
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
