# Maintainer: Hunter Grey <grey@huntergrey.cn>

pkgname=neovibe-git
pkgver=r5.855492d
pkgrel=1
pkgdesc="Lightweight IDE embedding Neovide/Neovim in a GTK4 shell with an AI agent panel (pre-alpha, feasibility-validation stage)"
arch=('x86_64')
url="https://github.com/HunterGrey-cyber/neovibe"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'neovim')
makedepends=('git' 'cargo')
provides=('neovibe')
conflicts=('neovibe')
source=("$pkgname::git+https://github.com/HunterGrey-cyber/neovibe.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --manifest-path poc/Cargo.toml -p shell_composed
}

package() {
  cd "$pkgname"
  install -Dm755 poc/target/release/shell_composed "$pkgdir/usr/bin/neovibe"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
