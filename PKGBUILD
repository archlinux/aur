# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.5.5
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
    '6cc5f2a7b6d1d7a74d1722545394507b599b00d9aefb68877ada5cd8a2c756be'  # voxtype-avx2
    '8721044e2bdafa9ab33c52123a92f5f3bdfa300967710f8cd06133f3d5e40078'  # voxtype-avx512
    'dce09bc586a026001c064708a1caeb0ac91e7bbdeeab969708e5293041c02096'  # voxtype-vulkan
    # Parakeet binaries
    'a34bc8b32ebdb0ffed57b32eabedde5d8fe77e91c2faea2e22e70070bf3d92a3'  # voxtype-parakeet-avx2
    '0a4144fcc1e76a3abeb464401460f9f7aa35712a7c0496b3550e4940ede085ba'  # voxtype-parakeet-avx512
    'a6a432a1538c23d1434df75bb731f55cbdfdbc6eab172377c7133a0f29bb90f2'  # voxtype-parakeet-cuda
    '0745a3e4c4490e785e13b2494d020bd28c97076688c2ba6e003615512fd69374'  # voxtype-parakeet-rocm
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
