# Maintainer: Jacob Burgess
pkgname=eddie-git
_pkgname=eddie
pkgver=r104.c5be7de
pkgrel=1
pkgdesc="The editor that watches the footage for you: a native Rust video editor with Meta's models built in"
arch=('x86_64')
url="https://github.com/BurgessTG/eddie"
license=('MIT' 'Apache-2.0')
depends=('ffmpeg' 'gtk3' 'glib2' 'alsa-lib' 'fontconfig' 'gcc-libs' 'glibc'
         'libxkbcommon' 'wayland' 'libx11' 'vulkan-icd-loader')
makedepends=('git' 'cargo' 'clang' 'cmake' 'pkgconf')
optdepends=('inter-font: the interface font Eddie is designed with'
            'xdg-utils: Open folder after an export')
provides=('eddie')
conflicts=('eddie')
options=('!lto' '!debug')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
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
  cd "$_pkgname"
  install -Dm755 target/release/eddie "$pkgdir/usr/bin/eddie"
  install -Dm644 packaging/eddie.desktop "$pkgdir/usr/share/applications/eddie.desktop"
  for size in 256 512; do
    install -Dm644 "packaging/eddie-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/eddie.png"
  done
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
