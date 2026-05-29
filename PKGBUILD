# Maintainer: Riccardo Romoli <romoliriccardo.rr@gmail.com>
pkgname=whispy
pkgver=0.1.0
pkgrel=1
pkgdesc="System-wide push-to-talk dictation for Hyprland (Wayland), powered by whisper.cpp (Vulkan)"
arch=('x86_64')
url="https://github.com/Ceereals/whispy"
license=('MIT')
depends=('pipewire' 'wl-clipboard' 'ydotool' 'libnotify' 'vulkan-icd-loader')
makedepends=('rust' 'cargo' 'git')
optdepends=('quickshell: dictation pill overlay UI')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb942c03ed462c14c8108c259898ce004c1fa1baf9fd2ec32ad6f204c4673977')

# whisper.cpp (Vulkan) and the ggml model are NOT shipped in this package — they
# are too large / hardware-specific. `whispy-daemon setup` bootstraps them on
# first run (see post_install).

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/whispy-daemon "$pkgdir/usr/bin/whispy-daemon"
  install -Dm755 target/release/whispy-client "$pkgdir/usr/bin/whispy-client"

  # systemd user unit, repointed at the packaged binary.
  install -Dm644 systemd/whispy-daemon.service \
    "$pkgdir/usr/lib/systemd/user/whispy-daemon.service"
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/whispy-daemon|' \
    "$pkgdir/usr/lib/systemd/user/whispy-daemon.service"

  # Quickshell pill module (installed into ~/.config by `setup --quickshell`).
  install -Dm644 -t "$pkgdir/usr/share/whispy/quickshell" \
    ui/quickshell/Tokens.qml ui/quickshell/Pill.qml \
    ui/quickshell/PillPanel.qml ui/quickshell/qmldir

  # Reference config (the daemon embeds these same defaults).
  install -Dm644 -t "$pkgdir/usr/share/whispy/config" \
    config/default.toml config/hallucinations.toml

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
