# Maintainer: Bitty Maintainers <maintainers@bitty-terminal.dev>
pkgname=bitty
pkgver=0.0.20
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
  # Bounded smoke only: the freshly built binary must report the packaged
  # version. The full `cargo test --workspace --all-targets` matrix is not
  # run here: it compiles every test target of the 16-crate workspace, is
  # disk-bound (rustc codegen ICE on a full disk), and `|| true` masked its
  # exit status anyway. Project CI owns the full test matrix.
  test "$(./target/release/bitty --version)" = "$pkgver"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/bitty" "$pkgdir/usr/bin/bitty"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 packaging/bitty.desktop "$pkgdir/usr/share/applications/bitty.desktop"
  for size in 16 32 64 128 256 512; do
    install -Dm644 "packaging/icons/hicolor/${size}x${size}/apps/bitty.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/bitty.png"
  done
  install -Dm644 packaging/icons/hicolor/scalable/apps/bitty.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bitty.svg"
  if [ -f terminfo/bitty.terminfo ]; then
    install -Dm644 terminfo/bitty.terminfo "$pkgdir/usr/share/terminfo/b/bitty"
  fi
}
