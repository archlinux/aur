# Maintainer: Gustav Sörnäs

pkgname=gluten-git
_pkgname=gluten
pkgver=0.1.0.r24.g65fe84d
pkgrel=1
pkgdesc="gitlab tui for viewing notifications"
arch=('x86_64')
url="https://gitlab.com/sornas/gluten.git"
license=('EUPL-1.2')
depends=('curl')
makedepends=('cargo' 'git' 'scdoc')
# conflicts=('gluten')
source=("$_pkgname::git+$url")
sha1sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | tr '-' '.'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  scdoc < gluten.1.scd > gluten.1
}

# check() {
#   cd "$_pkgname"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/gluten" "${pkgdir}/usr/bin/gluten"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 gluten.1 "$pkgdir/usr/share/man/man1/gluten.1"
}
