# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux (pre-built binaries)"
arch=('x86_64')
url="https://voxtype.io"
license=('MIT')
depends=(
    'alsa-lib'
    'curl'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: clipboard support'
    'libnotify: desktop notifications'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'vulkan-icd-loader: GPU acceleration via Vulkan for Whisper (enable with: voxtype setup gpu --enable)'
    'cuda: GPU acceleration via CUDA for ONNX engines (NVIDIA GPUs)'
    'rocm-hip-runtime: GPU acceleration via ROCm for ONNX engines (AMD GPUs)'
    'ollama: local AI summarization for meeting mode'
)
provides=('voxtype')
conflicts=('voxtype')
backup=('etc/voxtype/config.toml')
install=voxtype-bin.install
_github="https://github.com/peteonrails/voxtype/releases/download/v$pkgver"
source=(
    # Whisper binaries
    "voxtype-$pkgver-avx2::$_github/voxtype-$pkgver-linux-x86_64-avx2"
    "voxtype-$pkgver-avx512::$_github/voxtype-$pkgver-linux-x86_64-avx512"
    "voxtype-$pkgver-vulkan::$_github/voxtype-$pkgver-linux-x86_64-vulkan"
    # ONNX binaries (all ONNX engines: Parakeet, Moonshine, SenseVoice, Paraformer, Dolphin, Omnilingual)
    "voxtype-$pkgver-onnx-avx2::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx2"
    "voxtype-$pkgver-onnx-avx512::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx512"
    "voxtype-$pkgver-onnx-cuda::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda"
    "voxtype-$pkgver-onnx-rocm::$_github/voxtype-$pkgver-linux-x86_64-onnx-rocm"
    # Config and support files
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/README.md"
)
sha256sums=(
    # Whisper binaries
    '5c3f33f1026eb3b7312ef2137fced30c03e17b1728978c9404f383619d8acee4'  # voxtype-avx2
    'bfa0b62ff29ca90b7efb9b61ace48f68ab316fa5f6d98bf87c8337b7ef08cf31'  # voxtype-avx512
    '5af469003a6ce4e8a24716757587730cec0431e6a2cf5f09fc7864a54241cc49'  # voxtype-vulkan
    # ONNX binaries
    'c769c06916077390a98e100d1023838daa44010084d0a8cf164bbf8f88d68248'  # voxtype-onnx-avx2
    '1c7e431f7bbd065252842fa33022ee3509674fc5c6ecaf3e2160398bf6af8c3f'  # voxtype-onnx-avx512
    'da48e793c209010cef211a36422856ced5bca4837f6ea00ca3c6054de10a6f0e'  # voxtype-onnx-cuda
    '7f2173b08470280d643d8ddfd4497d0b115484763ea4b751983200d2f6e1c194'  # voxtype-onnx-rocm
    # Config and support files
    'SKIP'  # config.toml
    'SKIP'  # voxtype.service
    'SKIP'  # voxtype.bash
    'SKIP'  # voxtype.zsh
    'SKIP'  # voxtype.fish
    'SKIP'  # LICENSE
    'SKIP'  # README.md
)

package() {
    # Install Whisper CPU binaries to /usr/lib/voxtype/
    install -Dm755 "$srcdir/voxtype-$pkgver-avx2" "$pkgdir/usr/lib/voxtype/voxtype-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-avx512" "$pkgdir/usr/lib/voxtype/voxtype-avx512"

    # Install Whisper Vulkan GPU binary
    install -Dm755 "$srcdir/voxtype-$pkgver-vulkan" "$pkgdir/usr/lib/voxtype/voxtype-vulkan"

    # Install ONNX binaries (all ONNX engines)
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx2" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx512" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx512"
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda" "$pkgdir/usr/lib/voxtype/voxtype-onnx-cuda"
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-rocm" "$pkgdir/usr/lib/voxtype/voxtype-onnx-rocm"

    # Create symlink based on CPU capabilities (updated in .install file)
    # Default to avx2 for safety
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-avx2 "$pkgdir/usr/bin/voxtype"

    # Install default configuration
    install -Dm644 "$srcdir/config-$pkgver.toml" "$pkgdir/etc/voxtype/config.toml"

    # Install systemd user service
    install -Dm644 "$srcdir/voxtype-$pkgver.service" "$pkgdir/usr/lib/systemd/user/voxtype.service"

    # Install documentation
    install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 "$srcdir/voxtype-$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"
}
