# Contributor: Andrew Gallant <jamslam@gmail.com>
# Maintainer: Andrew Gallant
pkgname=ripgrep
pkgver=0.1.15
pkgrel=1
pkgdesc="A search tool that combines the usability of The Silver Searcher with the raw speed of grep."
arch=('i686' 'x86_64')
url="https://github.com/BurntSushi/ripgrep"
license=('UNLICENSE')
makedepends=('cargo')
source=("https://github.com/BurntSushi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ced856378c4ca625e4798ccae85418badd22e099fc324bcb162df51824808622')

build() {
  cd "$pkgname-$pkgver"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run nightly \
      cargo build --release --features simd-accel
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release --features simd-accel
  else
    cargo build --release
  fi
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rg" "$pkgdir/usr/bin/rg"
  install -Dm644 "doc/rg.1" "$pkgdir/usr/share/man/man1/rg.1"
  install -Dm644 "README-NEW.md" "$pkgdir/usr/share/doc/ripgrep/README.md"
  install -Dm644 "COPYING" "$pkgdir/usr/share/doc/ripgrep/COPYING"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/doc/ripgrep/LICENSE-MIT"
  install -Dm644 "UNLICENSE" "$pkgdir/usr/share/doc/ripgrep/UNLICENSE"
}
