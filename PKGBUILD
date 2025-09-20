pkgname=symm
pkgver=0.7.1
pkgrel=1
pkgdesc="Simple dotfiles manager"
arch=('x86_64')
url="https://github.com/tednaaa/symm"
license=("GPL3")
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  # Install shell completions
  install -Dm644 "completions/symm.bash" "$pkgdir/usr/share/bash-completion/completions/symm"
  install -Dm644 "completions/symm.fish" "$pkgdir/usr/share/fish/vendor_completions.d/symm.fish"
  install -Dm644 "completions/_symm" "$pkgdir/usr/share/zsh/site-functions/_symm"
}
