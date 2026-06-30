pkgname=usage-git
pkgver=0
pkgrel=1
pkgdesc="A specification for CLIs (development version)"
arch=('x86_64')
url="https://github.com/jdx/usage"
license=('MIT')

options=('!debug')

depends=('gcc-libs')
makedepends=('cargo' 'git' 'rust')

provides=('usage')
conflicts=('usage')

source=("git+https://github.com/jdx/usage.git")
sha256sums=('SKIP')

pkgver() {
  cd usage
  git describe --long --tags --abbrev=7 |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd usage
  cargo fetch --locked
}

build() {
  cd usage
  cargo build --release --locked
}

package() {
  cd usage

  install -Dm755 target/release/usage \
    "$pkgdir/usr/bin/usage"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 *.md \
    -t "$pkgdir/usr/share/doc/$pkgname"
}
