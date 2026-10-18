# Maintainer: Pink Pixel <admin@pinkpixel.dev>
pkgname=packrat
pkgver=1.0.0
pkgrel=1
pkgdesc="Browse, search, install, update and remove pacman, AUR and Flatpak packages, built with GPUI Kit"
arch=('x86_64')
url="https://github.com/pinkpixel-dev/packrat"
license=('Apache-2.0')
depends=(
  'curl'
  'fontconfig'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'pacman'
  'sudo'
  'vulkan-icd-loader'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=('cargo')
optdepends=(
  'pacman-contrib: check for repo updates (checkupdates)'
  'paru: install and update AUR packages'
  'yay: install and update AUR packages'
  'flatpak: list, install, update and remove Flatpaks'
)
# makepkg's LTO turns C code compiled by build scripts into GCC bitcode
# that Rust's linker can't read, so the link fails.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` after the v$pkgver tag is on GitHub to fill this in.
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/packrat "$pkgdir/usr/bin/packrat"
  install -Dm644 packaging/dev.pinkpixel.Packrat.desktop \
    "$pkgdir/usr/share/applications/dev.pinkpixel.Packrat.desktop"
  install -Dm644 packaging/dev.pinkpixel.Packrat.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev.pinkpixel.Packrat.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
