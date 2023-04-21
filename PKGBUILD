# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=release-plz-git
pkgver=0.3.1.r0.g2767ff2
pkgrel=1
pkgdesc="Release Rust packages without using the command line (git)"
arch=('x86_64')
url="https://github.com/MarcoIeni/release-plz"
license=('MIT' 'Apache')
depends=('gcc-libs' 'curl')
makedepends=('cargo' 'git')
optdepends=('cargo-semver-checks: check for API breaking changes')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --match "${pkgname%-git}-v*" | sed 's/^.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  mkdir completions
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  local compgen="target/release/${pkgname%-git} generate-completions"
  $compgen bash > "completions/${pkgname%-git}"
  $compgen fish > "completions/${pkgname%-git}.fish"
  $compgen zsh  > "completions/_${pkgname%-git}"
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/${pkgname%-git}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions/"
}
