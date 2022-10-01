# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=uwuifyy-git
pkgver=0.3.0.r13.g34d894d
pkgrel=1
pkgdesc="A command line tool to uwu'ify your text (git)"
arch=('x86_64')
url="https://github.com/sgoudham/uwuifyy"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}"
        "$pkgname-cargo-lock.patch::${url}/commit/65a4c84b683708b38a231325b507c130564dee06.patch")
sha512sums=('SKIP'
            'dfdbef6d32d581250bb3fab8fca16c69d38fb1fc6358b68ada066e73b4318605d9ef97ef2e6654e29890ce5f908235017cb02cfb0760247f5edb5666d178b9d7')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/$pkgname-cargo-lock.patch"
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
