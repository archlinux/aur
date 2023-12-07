# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=dra-git
pkgver=0.5.0.r0.g72fb61d
pkgrel=1
pkgdesc="A command line tool to download assets from GitHub releases (git)"
arch=('x86_64')
url="https://github.com/devmatteini/dra"
license=('MIT')
depends=('xz' 'zlib' 'bzip2')
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
  mkdir -p completions
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  local _completion="target/release/${pkgname%-git} completion"
  $_completion bash > "completions/${pkgname%-git}"
  $_completion fish > "completions/${pkgname%-git}.fish"
  $_completion zsh  > "completions/_${pkgname%-git}"
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen --bins
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/${pkgname%-git}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions/"
}
