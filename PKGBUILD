# Maintainer: Rodney Osodo <socials@rodneyosodo.com>

# CI updates pkgver and the checksums when upstream releases (see .github/workflows/release-packages.yml).

pkgname=dusk-menu
_pkgname=dusk
pkgver=0.1.4
pkgrel=1
pkgdesc='A sleek, customizable logout and power menu for Hyprland, Sway and Niri'
arch=(x86_64 aarch64)
url='https://github.com/rodneyosodo/dusk'
license=(MIT)
depends=(
  fontconfig
  glibc
  libgcc
  libxkbcommon
  systemd
  vulkan-driver
  vulkan-icd-loader
  wayland
)
makedepends=(pkgconf rust)
optdepends=('libnotify: notifications when an action fails')
conflicts=(dusk-menu-bin dusk-git)
# The release's source archive carries every crate in vendor/, so the build needs no network.
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-source.tar.gz")
sha256sums=('dd007b39e6a0ee714636a8ba0b24cf608ec7c781351249db9de83906b8068b0c')

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/dusk -t "$pkgdir/usr/bin/"
  install -Dm644 man/dusk.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 completions/dusk.bash "$pkgdir/usr/share/bash-completion/completions/dusk"
  install -Dm644 completions/dusk.zsh "$pkgdir/usr/share/zsh/site-functions/_dusk"
  install -Dm644 completions/dusk.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 README.md docs/THEMING.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
