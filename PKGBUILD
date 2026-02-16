# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.5.6
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
    'cuda: GPU acceleration via CUDA for Parakeet (NVIDIA GPUs)'
    'rocm-hip-runtime: GPU acceleration via ROCm for Parakeet (AMD GPUs)'
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
    # Parakeet binaries
    "voxtype-$pkgver-parakeet-avx2::$_github/voxtype-$pkgver-linux-x86_64-parakeet-avx2"
    "voxtype-$pkgver-parakeet-avx512::$_github/voxtype-$pkgver-linux-x86_64-parakeet-avx512"
    "voxtype-$pkgver-parakeet-cuda::$_github/voxtype-$pkgver-linux-x86_64-parakeet-cuda"
    "voxtype-$pkgver-parakeet-rocm::$_github/voxtype-$pkgver-linux-x86_64-parakeet-rocm"
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
    'e381dba000b9965251398a7a7b362fd39821e82af2cb78e0f9a2c0c01aa5f3a3'  # voxtype-avx2
    '033667acf0d7e3e4e4f8e55c85d20da5e97ce1e36c13d36e31055e0b2e6bf537'  # voxtype-avx512
    '980632fca880579dc841299f4b7055ede6d9b21229e8f5f8a41bdb474ea92608'  # voxtype-vulkan
    # Parakeet binaries
    '974c87f1879ffd02e83afebea1008bcfd6563a5ff7969cd808a44a44f809ca30'  # voxtype-parakeet-avx2
    '506fd4809563062b9e15129ecc307fc52b47504f4c3988dfcefd39b3d14e9a21'  # voxtype-parakeet-avx512
    'd091d50b4d530dfb4bef8caf1040db3b6e14e6637f665a045cb225167230e1ef'  # voxtype-parakeet-cuda
    'de5884fa4a997c0128647534c4d3cbc247512a8358b8dbf8e28f7c9ea5aa58c3'  # voxtype-parakeet-rocm
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

    # Install Parakeet binaries
    install -Dm755 "$srcdir/voxtype-$pkgver-parakeet-avx2" "$pkgdir/usr/lib/voxtype/voxtype-parakeet-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-parakeet-avx512" "$pkgdir/usr/lib/voxtype/voxtype-parakeet-avx512"
    install -Dm755 "$srcdir/voxtype-$pkgver-parakeet-cuda" "$pkgdir/usr/lib/voxtype/voxtype-parakeet-cuda"
    install -Dm755 "$srcdir/voxtype-$pkgver-parakeet-rocm" "$pkgdir/usr/lib/voxtype/voxtype-parakeet-rocm"

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
