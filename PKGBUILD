# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=transom
pkgver=0.1.0
pkgrel=1
pkgdesc="Sharp remote desktops over RDP (GTK 4, HiDPI-correct)"
arch=('x86_64' 'aarch64')
url="https://github.com/jm2/transom"
license=('GPL-3.0-or-later' 'Apache-2.0')
options=('!lto' '!debug')
depends=('glibc' 'libgcc' 'glib2' 'pango' 'graphene' 'freerdp>=3.15' 'gtk4>=4.16' 'libadwaita>=1.6'
         'libsecret' 'ffmpeg' 'hicolor-icon-theme')
optdepends=('libva-mesa-driver: hardware H.264 decoding on AMD (zero-copy video)'
            'intel-media-driver: hardware H.264 decoding on Intel (zero-copy video)'
            'vulkan-icd-loader: GTK''s Vulkan renderer, needed to show hardware-decoded video')
makedepends=('cargo' 'clang' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ecdaf9a66faae074fb6028ab443bd42e5059a475e58e46106ddb44ccf5053dff')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo build --frozen --release -p transom
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
  cargo test --frozen --release -p transom-view-core
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/transom "$pkgdir/usr/bin/transom"
  install -Dm644 data/io.github.jm2.Transom.desktop "$pkgdir/usr/share/applications/io.github.jm2.Transom.desktop"
  install -Dm644 data/io.github.jm2.Transom.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.jm2.Transom.metainfo.xml"
  install -Dm644 data/io.github.jm2.Transom.mime.xml "$pkgdir/usr/share/mime/packages/io.github.jm2.Transom.xml"
  for icon in data/icons/hicolor/*/apps/io.github.jm2.Transom.*; do
    install -Dm644 "$icon" "$pkgdir/usr/share/${icon#data/}"
  done
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 build-aux/packaging/RUST-CRATE-LICENSES.txt \
    "$pkgdir/usr/share/licenses/$pkgname/RUST-CRATE-LICENSES.txt"
}
