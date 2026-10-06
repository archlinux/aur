# Maintainer: Rutger Pronk <rutger.pronk11@gmail.com>
pkgname=tic-tac-toe-tui-git
_pkgname=tic-tac-toe-tui
pkgver=r38.dea67b9
pkgrel=1
pkgdesc='Tic Tac Toe TUI'
arch=('x86_64' 'aarch64')
url='https://github.com/Rutger505/tic-tac-toe-tui'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'git')
options=('!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
