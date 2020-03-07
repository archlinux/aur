# Maintainer: Caleb Maclennnan <caleb@alerque.com>

# TODO:
# * upstream 0.0.0 released to crates.io but not tagged,
#   remove forced tag on ba1f37f when rpository gets tagged

pkgname=sear-git
pkgver=0.0.0.r38.g1b262d8
pkgrel=1
pkgdesc="Signed/Encrypted ARchive"
arch=('x86_64')
url="https://github.com/iqlusioninc/${pkgname%-git}"
license=('MIT' 'Apache')
makedepends=('cargo')
provides=("${pkgname%-git}")
conflicts=($provides)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git tag -f 0.0.0 ba1f37f 2>&1 >/dev/null ||:
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
