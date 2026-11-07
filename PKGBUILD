# Maintainer: Jacob Burgess
pkgname=eddie
pkgver=0.1.0
pkgrel=1
pkgdesc="The editor that watches the footage for you: a native Rust video editor with Meta's models built in"
arch=('x86_64')
url="https://github.com/BurgessTG/eddie"
license=('MIT' 'Apache-2.0')
depends=('ffmpeg' 'gtk3' 'glib2' 'alsa-lib' 'fontconfig' 'gcc-libs' 'glibc'
         'libxkbcommon' 'wayland' 'libx11' 'vulkan-icd-loader')
makedepends=('cargo' 'clang' 'cmake' 'pkgconf')
optdepends=('inter-font: the interface font Eddie is designed with'
            'xdg-utils: Open folder after an export')
conflicts=('eddie-git')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed0047b0b1d97172b5151abb236592bcd97bc85d60cde63b5a19202ccc645b20')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Keep build paths out of the binary (makepkg flags this).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  # whisper.cpp and QuickJS embed __FILE__ paths.
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/build"
  export CXXFLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=/build"
  cargo build --frozen --release -p openreel-app --bin eddie
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/eddie "$pkgdir/usr/bin/eddie"
  install -Dm644 packaging/eddie.desktop "$pkgdir/usr/share/applications/eddie.desktop"
  for size in 256 512; do
    install -Dm644 "packaging/eddie-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/eddie.png"
  done
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
