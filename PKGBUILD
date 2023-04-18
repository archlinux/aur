# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hwatch-git
pkgver=0.3.10.r0.g1267168
pkgrel=1
pkgdesc="A modern alternative to the watch command (git)"
arch=('x86_64')
url="https://github.com/blacknon/hwatch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completion/bash/${pkgname%-git}-completion.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "completion/fish/${pkgname%-git}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completion/zsh/_${pkgname%-git}" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm 644 "man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
}
