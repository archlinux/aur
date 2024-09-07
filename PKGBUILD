# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=rmpc
pkgver=0.4.0
pkgrel=1
pkgdesc='A beautiful and configurable TUI client for MPD'
url='https://mierak.github.io/rmpc/'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
depends=('gcc-libs')
optdepends=(
  'yt-dlp: for youtube playback'
  'ffmpeg: for youtube playback'
  'python-mutagen: for youtube playback'
  'ueberzugpp: for alternative album art method')
makedepends=('cargo')
conflicts=('rmpc-bin' 'rmpc-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mierak/rmpc/archive/v$pkgver.tar.gz")
sha256sums=('075f2e20cce69c557faf106294a19d57b89a3c66469bbe902b2934c3f5c6130a')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  # shell completions
  install -Dm 644 "target/completions/$pkgname.bash" \
    -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "target/completions/$pkgname.fish" \
    -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "target/completions/_$pkgname" \
    -t "$pkgdir/usr/share/zsh/site-functions/"

  # docs
  install -Dm 644 "target/man/$pkgname.1" "$pkgdir/usr/share/man/man1/rmpc.1"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
