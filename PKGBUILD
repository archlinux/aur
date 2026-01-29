# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.5.2
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
    '0337fa50e65f44640b0ff6d34305b5ba57e2d6fbff3464f9a75993ebb0f1be36'  # voxtype-avx2
    'b1b110f21dd02ce955f772cdf70310a3d56e2bf225ce08032c32f8a240ac11f0'  # voxtype-avx512
    '26f146022748865a5c5a396ec86cc8b9a97d7032a85d4f5d4e2a67d13ce54fd3'  # voxtype-vulkan
    # Parakeet binaries
    'f61c72b733a283da8ea4e3ae90726cd9e5438da52b84e8db04a0c319ca5d40df'  # voxtype-parakeet-avx2
    'c8b24d93d6d26a9f6435ef76f0a4058601614974a42b2a26b1f12e93014bae23'  # voxtype-parakeet-avx512
    '460ce12e0f8c682137127cb6add5087fc03ec246634aba63223bc3e53e09b4be'  # voxtype-parakeet-cuda
    '80d953949f1b9a3260ab8db683ee127da9be0552081908d03580cae15db9dd2d'  # voxtype-parakeet-rocm
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
