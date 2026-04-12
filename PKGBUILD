# Maintainer: Hornfisk <hornfisk@users.noreply.github.com>
pkgname=slammer
pkgver=0.4.0
pkgrel=1
pkgdesc="Three-layer synthesized kick drum plugin (VST3, CLAP, Standalone)"
arch=('x86_64')
url="https://github.com/Hornfisk/slammer"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'freetype2' 'fontconfig' 'alsa-lib' 'gtk3')
makedepends=('cargo' 'pkgconf')
optdepends=(
  'pipewire-jack: low-latency standalone audio backend'
)
provides=('slammer-vst3' 'slammer-clap' 'slammer-standalone')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hornfisk/slammer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xtask bundle slammer --release
  cargo build --release --frozen --bin slammer-standalone
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --frozen --lib
}

package() {
  cd "$pkgname-$pkgver"

  # VST3 bundle
  install -dm755 "$pkgdir/usr/lib/vst3"
  cp -r target/bundled/slammer.vst3 "$pkgdir/usr/lib/vst3/"

  # CLAP plugin
  install -Dm644 target/bundled/slammer.clap "$pkgdir/usr/lib/clap/slammer.clap"

  # Standalone binary
  install -Dm755 target/release/slammer-standalone "$pkgdir/usr/bin/slammer-standalone"

  # License + readme
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
