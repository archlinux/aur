# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=menyoki-git
pkgver=1.7.0.r0.gf8b4ebe
pkgrel=1
pkgdesc="Screen{shot,cast} and perform ImageOps on the command line (git)"
arch=('x86_64')
url="https://github.com/orhun/menyoki"
license=('GPL3')
depends=('gcc-libs' 'libxrandr' 'libsixel')
makedepends=('cargo' 'git')
optdepends=('slop: area selection support')
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
}

build() {
  cd "${pkgname%-git}"
  cargo build --release --frozen --features sixel
}

check() {
  cd "${pkgname%-git}"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "man/${pkgname%-git}.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "man/${pkgname%-git}.conf.5" -t "$pkgdir/usr/share/man/man5"
  install -Dm 644 "completions/${pkgname%-git}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  install -Dm 644 "completions/${pkgname%-git}.fish" -t "${pkgdir}/usr/share/fish/completions"
  install -Dm 644 "completions/${pkgname%-git}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}"
}
