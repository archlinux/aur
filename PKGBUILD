# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hf
pkgver=0.3.7
pkgrel=1
pkgdesc="Cross-platform hidden file library and utility"
arch=('x86_64')
url="https://github.com/sorairolake/hf"
license=('MIT' 'Apache-2.0' 'CC-BY-4.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9f326fe5bd05bcdc4ea705b256ad41b3093286f668bbe27a0b45995f71309acdb4b1c3e654ac1461b4f32ffdebc2e6f93a9eef8bd2ce99e25a69348dcb0fe3e1')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  mkdir completions
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release # --frozen
  local compgen="target/release/$pkgname --generate-completion"
  $compgen bash >"completions/$pkgname"
  $compgen fish >"completions/$pkgname.fish"
  $compgen zsh >"completions/_$pkgname"
}

check() {
  cd "$pkgname-$pkgver"
  cargo test # --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSES/MIT.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 LICENSES/CC-BY-4.0.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
