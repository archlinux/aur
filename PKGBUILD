# Maintainer: James Wylde <feruswylde@gmail.com>

_pkgname=hyprosd
pkgname=hyprosd-git
pkgver=0.2.0.r22.g425d4bb
pkgrel=1
pkgdesc='Hyprland-focused Wayland OSD daemon'
arch=('x86_64')
url='https://github.com/jameswylde/hyprosd'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'clang' 'git' 'pkgconf')
optdepends=(
  'wireplumber: volume querying via wpctl'
  'pulseaudio-utils: fallback volume querying via pactl'
  'brightnessctl: example brightness keybinds'
  'hyprland: intended compositor integration'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  local version
  version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -n1)"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
