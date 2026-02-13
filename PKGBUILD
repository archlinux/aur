# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust
_binaryname=sonicrust
pkgver=0.1.2
pkgrel=1
pkgdesc="A rust base TUI subsonic client"
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
makedepends=('rust' 'gcc' 'cmake' 'clang' 'chafa' 'alsa-lib' 'glibc' 'rust-bindgen' 'gcc-libs' 'pkgconfig')
depends=('chafa' 'alsa-lib' 'glibc' 'gcc-libs')
provides=('_binaryname')
options=(!strip)
conflicts=('sonicrust-bin' 'sonicrust-git')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
# Force native toolchain
  export CC=gcc
  export CXX=g++
  export HOST_CC=gcc
  export HOST_CXX=g++

  # AWS-LC build configuration
  export AWS_LC_SYS_CMAKE_BUILDER=1
  export AWS_LC_SYS_STATIC=1

  # Override Rust's linker selection
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=gcc

  # Clean any cached cross-compile artifacts
  cargo clean
  cargo build --release
}
package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create desktop file
cat > "$pkgdir"/usr/share/applications/"$_binaryname".desktop << EOF
[Desktop Entry]
Name=Sonicrust
Comment=${pkgdesc}
Exec=/usr/bin/"$_binaryname" %u
Terminal=true
Type=Application
Icon=${_binaryname}
Categories=AudioVideo;Audio;Player;ConsoleOnly
Keywords=music;player
EOF
}
