# Maintainer: PoDiax <pd@pdx.ovh>
pkgname=waycord-git
_pkgname=waycord
pkgver=0.1.2.r0.b2792d4
pkgrel=1
pkgdesc="Lightweight Discord voice overlay for Linux"
arch=('x86_64')
url="https://github.com/podiax/waycord"
license=('MIT')
options=('!lto')
depends=('libx11' 'fontconfig' 'hicolor-icon-theme')
makedepends=('cargo' 'git')
provides=('waycord')
conflicts=('waycord')
source=("git+https://github.com/podiax/waycord.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  cargo build --frozen --release --bin waycord
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --bin waycord
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/waycord" "$pkgdir/usr/bin/waycord"
  install -Dm644 "assets/waycord.desktop" "$pkgdir/usr/share/applications/waycord.desktop"
  install -Dm644 "assets/waycord.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/waycord.svg"
  install -Dm644 "assets/waycord.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/waycord.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
