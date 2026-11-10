# Maintainer: Nguyen Hong Hiep <syaorancode@gmail.com>

pkgname=jotty-git
_pkgname=jotty
pkgver=2.1.0.r0.g0b30e06
pkgrel=1
pkgdesc='An opinionated, Wayland-native terminal emulator that supports both CPU and GPU renderer'
arch=('x86_64' 'aarch64')
url='https://github.com/justanoobcoder/jotty'
license=('MIT')
depends=('gcc-libs' 'glibc' 'wayland' 'libxkbcommon' 'libglvnd' 'fontconfig' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'ncurses')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  tic -x -o target/terminfo extra/jotty.terminfo
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/jotty -t "$pkgdir/usr/bin"
  install -Dm644 target/terminfo/j/jotty -t "$pkgdir/usr/share/terminfo/j"
  install -Dm644 extra/jotty.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 extra/jotty.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md docs/*.md docs/config.example.toml -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE THIRD-PARTY-LICENSES -t "$pkgdir/usr/share/licenses/$pkgname"
}
