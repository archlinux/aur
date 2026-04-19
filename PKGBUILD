# Maintainer: Hornfisk <hornfisk@users.noreply.github.com>
pkgname=squelchbox
pkgver=0.2.0
pkgrel=1
pkgdesc='TB-303-style acid bassline synthesizer plugin (VST3/CLAP/standalone)'
arch=('x86_64')
url='https://github.com/Hornfisk/squelchbox'
license=('GPL-3.0-or-later')
depends=(
  'libx11'
  'libxcb'
  'xcb-util'
  'xcb-util-wm'
  'xcb-util-keysyms'
  'libxcursor'
  'libxkbcommon'
  'mesa'
  'alsa-lib'
  'jack2'
)
makedepends=(
  'rust'
  'cargo'
  'pkg-config'
  'cmake'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Hornfisk/squelchbox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('933f4adfa55c90c969b73d4cf03764bb24e30f8d292bab9b29e1d30f55660b58')
options=('!lto')  # project uses its own LTO settings in Cargo.toml

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xtask bundle squelchbox --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release
}

package() {
  cd "${pkgname}-${pkgver}"

  # VST3
  install -d "${pkgdir}/usr/lib/vst3/squelchbox.vst3/Contents/x86_64-linux"
  install -Dm755 target/bundled/squelchbox.vst3/Contents/x86_64-linux/*.so \
    "${pkgdir}/usr/lib/vst3/squelchbox.vst3/Contents/x86_64-linux/"

  # CLAP
  install -Dm755 target/bundled/squelchbox.clap \
    "${pkgdir}/usr/lib/clap/squelchbox.clap"

  # Standalone
  install -Dm755 target/release/squelchbox-standalone \
    "${pkgdir}/usr/bin/squelchbox"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
