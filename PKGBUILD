# Maintainer: Hornfisk <hornfisk@users.noreply.github.com>
pkgname=niner
pkgver=0.7.7
pkgrel=2
pkgdesc="Three-layer synthesized kick drum plugin (VST3, CLAP, Standalone)"
arch=('x86_64')
url="https://github.com/hyperfocusdsp/niner"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'libxcb' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'freetype2' 'fontconfig' 'alsa-lib' 'gtk3')
makedepends=('cargo' 'pkgconf')
optdepends=(
  'pipewire-jack: low-latency standalone audio backend'
)
provides=('niner-vst3' 'niner-clap' 'niner-standalone' 'slammer')
replaces=('slammer')
conflicts=('slammer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hyperfocusdsp/niner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4efa9d9e4531cd0017f896617ef2b59eb6ee14134ea9f1e2a7be42038cf3f849')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo xtask bundle niner --release
  cargo build --release --frozen --bin niner-standalone
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
  cp -r target/bundled/niner.vst3 "$pkgdir/usr/lib/vst3/"

  # CLAP plugin
  install -Dm644 target/bundled/niner.clap "$pkgdir/usr/lib/clap/niner.clap"

  # Standalone binary
  install -Dm755 target/release/niner-standalone "$pkgdir/usr/bin/niner-standalone"

  # Desktop launcher shim — auto-detects BeatStep MIDI and the running
  # PipeWire sample-rate / quantum, then execs niner-standalone.
  install -Dm755 tools/niner-launch.sh "$pkgdir/usr/bin/niner-launch"

  # .desktop entry — render the template against /usr/bin so it shows up
  # in app menus / rofi.
  install -dm755 "$pkgdir/usr/share/applications"
  sed 's|__BIN_DIR__|/usr/bin|g' tools/niner.desktop.template \
    > "$pkgdir/usr/share/applications/niner.desktop"
  chmod 644 "$pkgdir/usr/share/applications/niner.desktop"

  # Hicolor icons — `Icon=niner` resolves through these. The
  # hicolor-icon-theme package's post-transaction hook refreshes the
  # cache automatically; no manual update needed here.
  for sz in 16 32 48 128 256 512 1024; do
    src="assets/icon/niner-${sz}.png"
    [ -f "$src" ] || continue
    install -Dm644 "$src" "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/niner.png"
  done

  # License + readme
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
