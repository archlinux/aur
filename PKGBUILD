# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=atuin-git
pkgver=0.8.0.r3.g7fa3e1c0
pkgrel=1
pkgdesc="Magical shell history (git)"
arch=('x86_64')
url="https://github.com/ellie/atuin"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  cargo fetch --locked
  mkdir completions/
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen
  for sh in 'bash' 'fish' 'zsh'; do
    "target/release/${pkgname%-git}" gen-completions -s "$sh" -o completions/
  done
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
  install -Dm 644 "completions/${pkgname%-git}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/_${pkgname%-git}" -t "${pkgdir}/usr/share/zsh/site-functions"
}
