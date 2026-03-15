# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Peter Jackson <pete@peteonrails.com>

_cuda_arch=${CUDA_ARCH:-all-major}
# CUDA compute architecture target. Defaults to all-major for broadest compatibility.
# Highly recommended to override for smaller package size.
#
# Note this is possible without editing this file, e.g. CUDA_ARCH=86 makepkg -S ...
#
# Special values
#   all-major  -- SASS for every major arch + embedded PTX for forward JIT compat (recommended)
#   all        -- SASS for every major AND minor arch variant (larger binary, rarely needed)
#   native     -- detects local GPU at build time (CMake 3.24+ only; fails without a GPU present)
#
# Numeric values (no dot: 8.6 -> 86):
#   Pascal  (CUDA 8+):   60 GTX 1080/1070/1060  |  61 GTX 1050/Titan Xp/Tesla P40
#   Volta   (CUDA 9+):   70 Tesla V100/Titan V  |  72 Jetson AGX Xavier
#   Turing  (CUDA 10+):  75 RTX 2060/2070/2080/GTX 1660 Ti/Tesla T4
#   Ampere  (CUDA 11+):  80 A100  |  86 RTX 3060-3090/A2000-A6000  |  87 Jetson Orin
#   Ada     (CUDA 12+):  89 RTX 4060-4090/L4/L40
#   Hopper  (CUDA 12+):  90 H100
#   Blackwell(CUDA 12+): 100 B100/B200  |  120 RTX 5080/5090
#
# Full reference: https://developer.nvidia.com/cuda-gpus

pkgname=voxtype-cuda
_pkgname=voxtype
pkgver=0.6.3
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux. Nvidia/cuda backend version (not vulkan)"
arch=(x86_64)
url="https://voxtype.io"
provides=($_pkgname)
conflicts=($_pkgname)
license=(MIT)
depends=(
    alsa-lib
    cuda
    curl
    gcc-libs
    glibc
)
makedepends=(
    cargo
    clang
    cmake
    cuda
    git
    pkgconf
)
optdepends=(
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'libnotify: desktop notifications'
    'ollama: local AI summarization for meeting mode'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'wl-clipboard: clipboard support'
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
)
backup=(etc/voxtype/config.toml)
install=$pkgname.install
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e163f59911b68683d769ba8869860c5ca6467122a7a95aeb4c4f2fe0d33303d')

prepare() {
    cd "$_pkgname-$pkgver"

    # Respect XDG Base Directory Specification
    # Use existing toolchain/cache, but allow override via environment
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable
    export CC=clang
    export CXX=clang++

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    # Respect XDG Base Directory Specification
    # Use existing toolchain/cache, but allow override via environment
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"

    echo "=== BUILD ENVIRONMENT DEBUG ==="
    echo "cargo: $(which cargo)"
    cargo --version
    echo "rustc: $(which rustc)"
    rustc --version
    echo "clang: $(which clang)"
    clang --version | head -1
    echo "cmake: $(which cmake)"
    cmake --version | head -1
    echo "PATH=$PATH"
    echo "RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-unset}"
    echo "CARGO_HOME=$CARGO_HOME"
    echo "RUSTUP_HOME=$RUSTUP_HOME"
    echo "CFLAGS=$CFLAGS"
    echo "CXXFLAGS=$CXXFLAGS"
    echo "LDFLAGS=$LDFLAGS"
    env | grep -i rust || true
    echo "==============================="

    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    # Clear flags set by makepkg - they can interfere with whisper-rs/whisper.cpp build
    unset RUSTFLAGS
    unset DEBUG_RUSTFLAGS
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
    export CC=clang
    export CXX=clang++

    export PATH="/opt/cuda/bin:$PATH"
    export CUDAToolkit_ROOT=/opt/cuda
    echo "set(CMAKE_CUDA_ARCHITECTURES ${_cuda_arch})" > /tmp/voxtype-cuda-arch.cmake
    export CMAKE_TOOLCHAIN_FILE=/tmp/voxtype-cuda-arch.cmake

    # Build CUDA binary - Disable LTO to prevent linking hangs (Cargo.toml has lto=true)
    cargo build --frozen --release --features gpu-cuda \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-cuda
}

check() {
    cd "$_pkgname-$pkgver"

    # Respect XDG Base Directory Specification
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen
}

package() {
    cd "$_pkgname-$pkgver"

    # Install CUDA binary
    install -Dm755 "voxtype-cuda" "$pkgdir/usr/lib/voxtype/voxtype-cuda"

    # Symlink voxtype -> voxtype-cuda
    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-cuda "$pkgdir/usr/bin/voxtype"

    # Install default configuration
    install -Dm644 "config/default.toml" "$pkgdir/etc/voxtype/config.toml"

    # Install systemd user service
    install -Dm644 "packaging/systemd/voxtype.service" \
        "$pkgdir/usr/lib/systemd/user/voxtype.service"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "docs/INSTALL.md" "$pkgdir/usr/share/doc/$_pkgname/INSTALL.md"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # Install shell completions
    install -Dm644 "packaging/completions/voxtype.bash" \
        "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 "packaging/completions/voxtype.zsh" \
        "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 "packaging/completions/voxtype.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"

    # Install man pages (generated by build.rs)
    local man_dir
    man_dir=$(find target/release/build -name "man" -type d -path "*/voxtype-*/out/man" 2>/dev/null | head -1)
    if [[ -n "$man_dir" && -d "$man_dir" ]]; then
        install -d "$pkgdir/usr/share/man/man1"
        install -Dm644 "$man_dir"/*.1 "$pkgdir/usr/share/man/man1/"
    fi
}
