# Maintainer: Riccardo Romoli <romoliriccardo.rr@gmail.com>
pkgname=whispy
pkgver=0.4.0
pkgrel=1
pkgdesc="System-wide push-to-talk dictation for Hyprland/Omarchy, Wayland and X11, powered by whisper.cpp"
arch=('x86_64')
url="https://github.com/Ceereals/whispy"
license=('MIT')
# `whispy-daemon setup` builds whisper.cpp on first run; with vulkan-icd-loader
# present it builds the Vulkan backend, which needs cmake, glslc (shaderc) and the
# Vulkan + SPIR-V headers, so those are hard dependencies.
depends=('pipewire' 'wl-clipboard' 'ydotool' 'libnotify' 'vulkan-icd-loader'
         'git' 'cmake' 'shaderc' 'vulkan-headers' 'spirv-headers')
makedepends=('rust' 'cargo' 'git')
optdepends=('quickshell: dictation pill overlay UI (Wayland layer-shell)'
            'wtype: type-mode injection on Wayland'
            'xdotool: type-mode injection and window-class detection on X11'
            'xclip: clipboard paste mode on X11'
            'xsel: clipboard paste mode on X11 (xclip alternative)')
options=('!lto')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddd3b3589737f2857d77d96188f5be729466c165fad7d89dce4d1f10767fbe67')

# whisper.cpp (Vulkan) and the ggml model are NOT shipped in this package — they
# are too large / hardware-specific. `whispy-daemon setup` bootstraps them on
# first run (see post_install).

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  # Distro makepkg.conf files can put -flto into CFLAGS even with !lto. ring's C
  # objects then hold only LTO bitcode, and rustc's (non-LTO) link of the binary
  # fails with undefined ring_core_* symbols. The last -f(no-)lto flag wins, so
  # this keeps every other flag (hardening included) and only turns LTO off.
  export CFLAGS="$CFLAGS -fno-lto" CXXFLAGS="$CXXFLAGS -fno-lto"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export CFLAGS="$CFLAGS -fno-lto" CXXFLAGS="$CXXFLAGS -fno-lto"  # see build()
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
