# Maintainer: Daan Hessen <daanh2002@gmail.com>

pkgname=lumend-git
_pkgname=lumend
pkgver=0.1.0
pkgrel=1
pkgdesc="Adaptive screen brightness for Wayland laptops without a light sensor"
arch=('x86_64' 'aarch64')
url="https://github.com/DaanHessen/lumend"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=(
  'hyprland: window, fullscreen, idle and screen content signals'
  'hyprsunset: night light awareness'
  'iwd: network signal'
  'networkmanager: network signal'
)
options=('!lto')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=()
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.g%s" \
    "$(grep -m1 '^version' Cargo.toml | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" dist/lumend.service
  install -Dm0644 dist/config.toml "$pkgdir/usr/share/doc/$_pkgname/config.toml"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md docs/*.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
