# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.4.11
pkgrel=2
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
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: clipboard support'
    'libnotify: desktop notifications'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'vulkan-icd-loader: GPU acceleration via Vulkan (enable with: voxtype setup gpu --enable)'
)
provides=('voxtype')
conflicts=('voxtype')
backup=('etc/voxtype/config.toml')
install=voxtype-bin.install
_github="https://github.com/peteonrails/voxtype/releases/download/v$pkgver"
source=(
    "voxtype-$pkgver-avx2::$_github/voxtype-$pkgver-linux-x86_64-avx2"
    "voxtype-$pkgver-avx512::$_github/voxtype-$pkgver-linux-x86_64-avx512"
    "voxtype-$pkgver-vulkan::$_github/voxtype-$pkgver-linux-x86_64-vulkan"
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/README.md"
)
sha256sums=(
    '0b15ef42486370bf7d2b6c5f71e1e9cd6b544e28afbfe10a08b3e47b700f6191'  # voxtype-avx2
    '6eb668fa56c34b643caac6b96c8c56ee39895c77edae572bf32bef9f434d15a9'  # voxtype-avx512
    '187a66c3b246c8fc3b5f2e55a28e8d9a4379cda4cbe6824aeb880b1ed3e9faf4'  # voxtype-vulkan
    'SKIP'  # config.toml
    'SKIP'  # voxtype.service
    'SKIP'  # voxtype.bash
    'SKIP'  # voxtype.zsh
    'SKIP'  # voxtype.fish
    'SKIP'  # LICENSE
    'SKIP'  # README.md
)

package() {
    # Install CPU binaries to /usr/lib/voxtype/
    install -Dm755 "$srcdir/voxtype-$pkgver-avx2" "$pkgdir/usr/lib/voxtype/voxtype-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-avx512" "$pkgdir/usr/lib/voxtype/voxtype-avx512"

    # Install Vulkan GPU binary
    install -Dm755 "$srcdir/voxtype-$pkgver-vulkan" "$pkgdir/usr/lib/voxtype/voxtype-vulkan"

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
