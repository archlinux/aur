# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=huniq
conflicts=('huniq-git')
pkgver=2.7.0
pkgrel=1
pkgdesc="Filter out duplicates on the command line (git)"
arch=('x86_64')
url="https://github.com/koraa/huniq"
license=('BSD')
depends=('gcc-libs')
makedepends=('cargo' 'git')
_commit='1e4d1f23bbb88c34f7c128f7eb4a500e97eabf4b'
source=("$pkgname::git+https://github.com/koraa/huniq.git#commit=$_commit")
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  sed -n '/Copyright/,//p' readme.md > LICENSE
  cargo build --release --frozen
}

check() {
  cd "$pkgname"
  cargo test --frozen
}

package() {
  cd "$pkgname"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
