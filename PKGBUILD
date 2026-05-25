# Maintainer: UMCEKO <umutcevdetkocak@gmail.com>

pkgname=chatmixd-git
_pkgname=chatmixd
pkgver=0.2.0.r3.ge5aba36
pkgrel=1
pkgdesc="SteelSeries ChatMix daemon for Linux (hardened fork of linuxmix)"
arch=('x86_64')
url="https://github.com/UMCEKO/chatmixd"
license=('MIT')
depends=('pipewire-pulse')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname" 'linuxmix' 'linuxmix-git')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$_pkgname"
  local _v
  _v=$(awk -F'"' '/^version[[:space:]]*=/{print $2; exit}' Cargo.toml)
  printf "%s.r%s.g%s" "$_v" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --offline
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/chatmixd     "$pkgdir/usr/bin/chatmixd"
  install -Dm644 dist/chatmixd.service       "$pkgdir/usr/lib/systemd/user/chatmixd.service"
  install -Dm644 dist/99-chatmixd.rules      "$pkgdir/usr/lib/udev/rules.d/99-chatmixd.rules"
  install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                   "$pkgdir/usr/share/doc/$pkgname/README.md"
}
