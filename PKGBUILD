# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=asak
pkgver=0.3.5
pkgrel=2
pkgdesc="A cross-platform audio recording/playback tool"
arch=('x86_64')
url="https://github.com/chaosprint/asak"
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'jack2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4e5b7b26f671887af1b0c582333d4c26b75d52dfb8f4e661195a8f839becf669b2603fe82550e4bfb157dfea1e93255400b1dcb0b13f2284eb3339f4fad90eba')

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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "target/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm 644 "target/completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm 644 "target/completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "target/completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
}
