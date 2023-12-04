# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=serial-monitor-git
pkgver=r35.7797564
pkgrel=2
pkgdesc="Cross-platform command line serial terminal program (git)"
arch=('x86_64')
url="https://github.com/dhylands/serial-monitor"
license=('MIT')
depends=('gcc-libs' 'systemd-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-serial-version.patch::$url/commit/db0470db30531188d1385e989b332ebae0410ffa.patch")
sha256sums=('SKIP'
            '5adc912c8d40f89cee5ed9fea5a2e7011e6fbd17178eba16d7b5485d0c90def6')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/$pkgname-serial-version.patch"
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
}
