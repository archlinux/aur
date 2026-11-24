# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=transom-git
pkgver=0.1.0.r156.g4ea2cbf
pkgrel=1
pkgdesc="Sharp remote desktops over RDP (GTK 4, HiDPI-correct) (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/transom"
license=('GPL-3.0-or-later' 'Apache-2.0')
depends=(
  'freerdp'
  'gtk4>=4.16'
  'libadwaita>=1.6'
  'libsecret'
  'hicolor-icon-theme'
  'ffmpeg'
)
optdepends=(
  'libva-mesa-driver: hardware H.264 decoding on AMD (zero-copy video)'
  'intel-media-driver: hardware H.264 decoding on Intel (zero-copy video)'
  'vulkan-icd-loader: GTK''s Vulkan renderer, needed to show hardware-decoded video'
)
makedepends=(
  'git'
  'cargo'
  'clang'
)
# The release profile already strips; makepkg's LTO and debug split stay off.
options=('!lto' '!debug')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

# Builds HEAD: the version is Cargo.toml's, then HEAD's commit count and hash, so it
# needs no tag and still sorts above the last release.
pkgver() {
  cd "${pkgname}"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p transom
}

check() {
  cd "${pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p transom-view-core
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/transom "$pkgdir/usr/bin/transom"
  install -Dm644 data/io.github.jm2.Transom.desktop \
    "$pkgdir/usr/share/applications/io.github.jm2.Transom.desktop"
  install -Dm644 data/io.github.jm2.Transom.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.jm2.Transom.metainfo.xml"
  install -Dm644 data/io.github.jm2.Transom.mime.xml \
    "$pkgdir/usr/share/mime/packages/io.github.jm2.Transom.xml"
  for icon in data/icons/hicolor/*/apps/io.github.jm2.Transom.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/${icon#data/}"
  done
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 build-aux/packaging/RUST-CRATE-LICENSES.txt \
    "$pkgdir/usr/share/licenses/$pkgname/RUST-CRATE-LICENSES.txt"
}
