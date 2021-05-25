# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=diary-git
pkgver=r24.d9bfeac
pkgrel=1
pkgdesc="Encrypted memories -- a journal program with local encryption support"
arch=('x86_64')
url="https://github.com/actuday6418/diary"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "$pkgname"
  cargo test --release --locked --target-dir=target
}

package() {
  cd "$pkgname"
  install -Dvm 755 target/release/diary -t "$pkgdir/usr/bin/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
