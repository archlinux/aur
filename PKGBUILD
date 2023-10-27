# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kmon-git
pkgver=1.6.4.r0.g3ed516f
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor (git)"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('gcc-libs' 'libxcb')
makedepends=('rust' 'python' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm 644 "target/man/${pkgname%-git}.8" -t "$pkgdir/usr/share/man/man8"
  install -Dm 644 "target/completions/${pkgname%-git}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "target/completions/${pkgname%-git}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 644 "target/completions/_${pkgname%-git}" -t "${pkgdir}/usr/share/zsh/site-functions"
}
