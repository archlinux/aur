# Maintainer: Riccardo Romoli <romoliriccardo.rr@gmail.com>
pkgname=whispy
pkgver=0.3.0
pkgrel=1
pkgdesc="System-wide push-to-talk dictation for Hyprland/Omarchy, Wayland and X11, powered by whisper.cpp"
arch=('x86_64')
url="https://github.com/Ceereals/whispy"
license=('MIT')
depends=('pipewire' 'wl-clipboard' 'ydotool' 'libnotify' 'vulkan-icd-loader')
makedepends=('rust' 'cargo' 'git')
optdepends=('quickshell: dictation pill overlay UI (Wayland layer-shell)'
            'cmake: build whisper.cpp via whispy-daemon setup'
            'vulkan-headers: build whisper.cpp with Vulkan backend'
            'spirv-headers: compile SPIR-V shaders for Vulkan backend'
            'wtype: type-mode injection on Wayland'
            'xdotool: type-mode injection and window-class detection on X11'
            'xclip: clipboard paste mode on X11'
            'xsel: clipboard paste mode on X11 (xclip alternative)')
options=('!lto')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31c6989456c4b715b7654b13d8fca295cfb760b072ed7738e737eda0e6708520')

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

  # ydotoold + pill user units (enabled by `setup`) so paste injection and the
  # standalone Quickshell overlay work without manual steps.
  install -Dm644 systemd/ydotoold.service \
    "$pkgdir/usr/lib/systemd/user/ydotoold.service"
  install -Dm644 systemd/whispy-pill.service \
    "$pkgdir/usr/lib/systemd/user/whispy-pill.service"

  # Quickshell pill module + standalone shell (installed into ~/.config by `setup`).
  install -Dm644 -t "$pkgdir/usr/share/whispy/quickshell" \
    ui/quickshell/Tokens.qml ui/quickshell/Pill.qml \
    ui/quickshell/PillPanel.qml ui/quickshell/qmldir ui/quickshell/shell.qml

  # Reference config (the daemon embeds these same defaults).
  install -Dm644 -t "$pkgdir/usr/share/whispy/config" \
    config/default.toml config/hallucinations.toml

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
