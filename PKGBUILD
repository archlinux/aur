# Maintainer: Riccardo Romoli <romoliriccardo.rr@gmail.com>
pkgname=whispy
pkgver=0.5.0
pkgrel=1
pkgdesc="System-wide push-to-talk dictation for Hyprland/Omarchy, Wayland and X11, powered by Parakeet or whisper.cpp"
arch=('x86_64')
url="https://github.com/Ceereals/whispy"
license=('MIT')
# whispy-stt (the Parakeet engine) is built here with the Vulkan backend, and
# `whispy-daemon setup` builds whisper.cpp (Vulkan) when the whisper engine is
# chosen: both need cmake, glslc (shaderc) and the Vulkan + SPIR-V headers.
depends=('pipewire' 'wl-clipboard' 'ydotool' 'libnotify' 'vulkan-icd-loader'
         'git' 'cmake' 'shaderc' 'vulkan-headers' 'spirv-headers')
makedepends=('rust' 'cargo' 'git' 'gcc')
optdepends=('quickshell: dictation pill overlay UI (Wayland layer-shell)'
            'wtype: type-mode injection on Wayland'
            'xdotool: type-mode injection and window-class detection on X11'
            'xclip: clipboard paste mode on X11'
            'xsel: clipboard paste mode on X11 (xclip alternative)')
options=('!lto')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b53f8ab55f8beeec44a8f81194c9d0691899c3447d4f111fae6d96294c3f7983')

# The speech models are NOT shipped in this package (too large); neither is
# whisper.cpp (built per machine). `whispy-daemon setup` downloads the model for
# the configured engine (and builds whisper.cpp if that's the engine) on first
# run (see post_install).

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
  cargo build --frozen --release --workspace --exclude whispy-stt
  # whispy-stt with the Vulkan backend (it falls back to CPU at runtime when no
  # GPU is usable). The repo's .cargo/config.toml turns off transcribe.cpp's
  # system-BLAS probe, which can pick a libblas without cblas and fail the link.
  cargo build --frozen --release -p whispy-stt --features vulkan
}

check() {
  cd "$pkgname-$pkgver"
  export CFLAGS="$CFLAGS -fno-lto" CXXFLAGS="$CXXFLAGS -fno-lto"  # see build()
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --workspace --exclude whispy-stt
  cargo test --frozen --release -p whispy-stt --features vulkan
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/whispy-daemon "$pkgdir/usr/bin/whispy-daemon"
  install -Dm755 target/release/whispy-client "$pkgdir/usr/bin/whispy-client"
  # Found by the daemon next to itself (stt.engine = "parakeet").
  install -Dm755 target/release/whispy-stt "$pkgdir/usr/bin/whispy-stt"

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
