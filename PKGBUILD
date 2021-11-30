# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cocogitto
pkgver=4.0.1
pkgrel=1
pkgdesc="Set of CLI tools for the conventional commit and semver specifications"
arch=('x86_64')
url="https://github.com/cocogitto/cocogitto"
license=('MIT')
depends=('git' 'gcc-libs' 'zlib')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b08efea6ccfc28509771ca6ecacdecafcfd79187caa82cc65cde6f44fceedf8c21ee67dee5526b2f30a9dfdda30efbd101eaeec8494a8e121489335d69d1a626')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir completions/
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
  target/release/coco --completion bash > "completions/coco.bash"
  target/release/coco --completion fish > "completions/coco.fish"
  target/release/coco --completion zsh > "completions/_coco"
  target/release/cog generate-completions bash > "completions/cog.bash"
  target/release/cog generate-completions fish > "completions/cog.fish"
  target/release/cog generate-completions zsh > "completions/_cog"
}

#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/coco" -t "$pkgdir/usr/bin"
  install -Dm 755 "target/release/cog" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  for bin in 'cog' 'coco'; do
    install -Dm 644 "completions/$bin.bash" "${pkgdir}/usr/share/bash-completion/completions/$bin"
    install -Dm 644 "completions/$bin.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/_$bin" -t "${pkgdir}/usr/share/zsh/site-functions"
  done
}
