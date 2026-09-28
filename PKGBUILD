# Maintainer: Ícar Nin Solana <icar.nin@protonmail.com>

pkgname=old-launcher-git
_name=old_launcher
pkgver=r13.d909de7
pkgrel=1
pkgdesc='Addon manager for World of Warcraft 3.3.5a clients'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/juxuanu/old_launcher'
license=('GPL-3.0-or-later')
# The window system and keyboard libraries are loaded at run time, for
# whichever session (Wayland or X11) the launcher starts in.
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'wayland'
)
makedepends=('cargo' 'git')
optdepends=(
  'vulkan-icd-loader: hardware-accelerated drawing, instead of software rendering'
  'xdg-desktop-portal: file pickers, with a backend such as xdg-desktop-portal-gtk'
  'xdg-utils: opening web pages and folders'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# makepkg's LTO turns ring's C code into GCC bitcode, which Rust's linker
# can't link. The release profile already does its own (Rust) LTO.
options=('!lto')
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package "$_name" --bin "$_name"
}

check() {
  cd "$_name"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --workspace
}

package() {
  cd "$_name"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_name"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "assets/$_name.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "assets/$_name.svg"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
