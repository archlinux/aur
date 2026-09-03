# Maintainer: Bitty Maintainers <maintainers@bitty-terminal.dev>
pkgname=bitty
pkgver=0.0.19
pkgrel=1
pkgdesc="Bitty pre-alpha terminal workspace minimal correct terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/bitty-terminal/bitty"
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'freetype2')
makedepends=('cargo' 'pkgconf')
optdepends=('noto-fonts: fallback font')
provides=('bitty')
conflicts=('bitty-nightly' 'bitty-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitty-terminal/bitty/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked -p bitty-app
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --locked --workspace --all-targets || true
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bitty-app" "$pkgdir/usr/bin/bitty"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  if [ -f terminfo/bitty.terminfo ]; then
    install -Dm644 terminfo/bitty.terminfo "$pkgdir/usr/share/terminfo/b/bitty"
  fi
}
