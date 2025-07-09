# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=argc-git
pkgver=1.23.0.r0.gcfee786
pkgrel=1
pkgdesc="An elegant command-line argument parser (git)"
arch=('x86_64')
url="https://github.com/sigoden/argc"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
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
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir -p completions
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  local compgen="target/release/${pkgname%-git} --argc-completions"
  $compgen bash > "completions/${pkgname%-git}.bash"
  $compgen fish > "completions/${pkgname%-git}.fish"
  $compgen zsh  > "completions/${pkgname%-git}.zsh"
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
  install -Dm 644 "completions/${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/${pkgname%-git}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
}
