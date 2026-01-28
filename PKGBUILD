# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.5.1
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
    '6db960ba0f8d8981f60f4309d402d23de79ea46140ff6bab429ff073888b1434'  # voxtype-avx2
    '61d4749c31d0c20ccc012d73e84f9bad9c63b1d0a286e770d97ee82c7ada2340'  # voxtype-avx512
    'c61cb5dba01fda88736756092932ebd79519dc7f9f0644b7b6c5c92d275e039f'  # voxtype-vulkan
    # Parakeet binaries
    'b5bfda477515f61d179c8331fb309c2f1f2c620f0310d2fbbb137b115ecdf6b7'  # voxtype-parakeet-avx2
    '645997a2392601cf86224500d62a2b4619f6aec97e1f86daf1eb5c074b0f654b'  # voxtype-parakeet-avx512
    'f2fda77c41006a4f34fde286a604925cc8c26fecc4083221a7fed965fee51840'  # voxtype-parakeet-cuda
    'ba28c7ca1fe50e131931d9bf97f098b66d50cc30e74ba62eaa109363e375230d'  # voxtype-parakeet-rocm
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
