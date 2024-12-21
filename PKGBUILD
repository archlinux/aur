# Maintainer: Valentin Obst <aur@vpao.de>
pkgname=btf2json
pkgver=0.1.0
pkgrel=1
pkgdesc="Generate Volatility3 profiles from BTF."
arch=('x86_64')
url="https://github.com/vobst/$pkgname"
license=('MIT')
depends=('gcc-libs'
         'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3fea7fe83b4b65b012fe2e12faac300274fa20a9a1925bcbcd0847713c7d17b9c9711e325787875ba3bf78eb8bac4419a549a83a2456a4c029a07dc32cf5cf28')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.md"
}
