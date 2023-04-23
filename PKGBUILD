# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Rustem B. <rustemb@systemli.org>
# https://github.com/orhun/pkgbuilds

pkgname=sic-image-cli-git
_pkgname=sic
pkgver=0.22.1.r0.gcc8f1eb
pkgrel=1
pkgdesc="Accessible image processing and conversion from the terminal (git)"
arch=('x86_64')
url="https://github.com/foresterre/sic"
license=('MIT')
conflicts=("$_pkgname" "${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gcc-libs')
makedepends=('cargo' 'git' 'nasm')
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --match "v*" | sed 's/^.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$_pkgname"
  cargo build --release --frozen --all-features
  cargo run --example gen_completions
}

check() {
  cd "$_pkgname"
  cargo test --frozen
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "$_pkgname.bash" "${pkgdir}/usr/share/bash-completion/completions/$_pkgname"
  install -Dm 644 "$_pkgname.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "_$_pkgname" -t "${pkgdir}/usr/share/zsh/site-functions"
}
