# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-public-api-git
pkgver=0.27.3.r4.g10e912b
pkgrel=1
pkgdesc="List and diff the public API of Rust library crates (git)"
arch=('x86_64')
url="https://github.com/Enselic/cargo-public-api"
license=('MIT')
depends=('gcc-libs')
depends=('libgit2')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  local compgen="target/release/${pkgname%-git} completions"
  $compgen bash > "completions/${pkgname%-git}"
  $compgen fish > "completions/${pkgname%-git}.fish"
  $compgen zsh  > "completions/_${pkgname%-git}"
}

# tests require nightly
#check() {
#  cd "${pkgname%-git}"
#  cargo test --frozen --bins
#}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/${pkgname%-git}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions/"
}
