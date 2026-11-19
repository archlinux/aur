# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=tvpipe
pkgver=0.2.0
pkgrel=2
pkgdesc="Low-latency video and audio mirroring to AirPlay, Google Cast and browsers"
arch=('x86_64' 'aarch64')
url="https://github.com/mitsuhiko/tvpipe"
license=('Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo')
checkdepends=('ffmpeg')
optdepends=(
  'ffmpeg: transcoding media and capturing audio/video devices'
  'chromium: screen capture and web page sharing'
  'firefox: alternative browser for web page sharing'
  'xdg-utils: opening preview and share pages in the default browser'
)
# ring's C/assembly objects are linked by Rust, not GCC's LTO linker.
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('328f8ee10256cf46f717ca826e0cd4ab1431572810412e9c3b160954627cdc2c')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features -p tvpipe-cli
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-features --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/tvpipe "$pkgdir/usr/bin/tvpipe"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSES/*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
