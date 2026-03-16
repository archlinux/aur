# Maintainer: Nils Pukropp <nils@narl.io>
pkgname=mould-git
_pkgname=mould
pkgver=0.2.1.r17.g93c5c30
pkgrel=1
pkgdesc="A modern TUI tool for interactively generating and editing configuration files from templates"
arch=('x86_64' 'aarch64')
url="https://git.narl.io/nvrl/mould-rs"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Try to get the version from Cargo.toml and append git commit count and hash
  local _ver=$(grep '^version =' Cargo.toml | head -n1 | cut -d '"' -f 2)
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
