# Maintainer: Riza Mohammad <rizamohammad.work@gmail.com>
pkgname=trix-player
pkgver=0.3.0
pkgrel=1
pkgdesc="A beautiful, keyboard-driven terminal music player for Linux."
arch=('x86_64')
url="https://github.com/RIZAmohammadkhan/TerminalMusicPlayer"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
options=('!lto')
# Downloads the source tarball from your GitHub Release tags
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('832cb9402296abbca4e7beed5bd1e90dd18c399e68dab1f0802132db5d2c37ad')

prepare() {
  # GitHub source archives extract to "RepoName-Version"
  cd "TerminalMusicPlayer-$pkgver"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  
  # Fetch dependencies ahead of time
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "TerminalMusicPlayer-$pkgver"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  # Speed up builds for users installing from AUR.
  # (Your upstream release build can still keep LTO enabled.)
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
  
  # Build the binary
  cargo build --frozen --release --bin trix
}

# check() {
#   cd "TerminalMusicPlayer-$pkgver"
#
#   export RUSTUP_TOOLCHAIN=stable
#   export CARGO_TARGET_DIR="$srcdir/target"
#
#   # Tests can add significant install time; enable if you want extra assurance.
#   cargo test --frozen
# }

package() {
  cd "TerminalMusicPlayer-$pkgver"
  
  # Install the binary
  install -Dm755 "$srcdir/target/release/trix" "$pkgdir/usr/bin/trix"
  
  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install Readme
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
