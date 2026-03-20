# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Peter Jackson <pete@peteonrails.com>

_cuda_arch=${CUDA_ARCH:-all-major}
# CUDA compute architecture. Set to your GPU's compute capability (drop the dot: 8.6 → 86).
# Can be overridden without editing: _cuda_arch=86 makepkg -S
#
# Numeric values:
#    60 — Pascal:    GTX 1080/1070/1060
#    61 — Pascal:    GTX 1050/Titan Xp/Tesla P40
#    70 — Volta:     Tesla V100/Titan V
#    72 — Volta:     Jetson AGX Xavier
#    75 — Turing:    RTX 2060/2070/2080/GTX 1650 Ti/GTX 1660 Ti/Tesla T4/Titan RTX
#    80 — Ampere:    A100
#    86 — Ampere:    RTX 3050/3050 Ti/3060/3060 Ti/3070/3070 Ti/3080/3080 Ti/3090/3090 Ti/A2000-A6000
#    87 — Ampere:    Jetson Orin
#    89 — Ada:       RTX 4050/4060/4060 Ti/4070/4070 Ti/4080/4090/L4/L40/L40S
#    90 — Hopper:    GH200/H100/H200
#   100 — Blackwell: GB200/B200
#   103 — Blackwell: GB300/B300
#   120 — Blackwell: RTX 5050/5060/5060 Ti/5070/5070 Ti/5080/5090
#   121 — Blackwell: GB10 (DGX Spark)
#
# Special values:
#   all-major — SASS for every major arch + embedded PTX for forward JIT compat
#   all       — SASS for every major and minor arch variant
#
# Full reference: https://developer.nvidia.com/cuda-gpus

pkgname=voxtype-cuda
_pkgname=voxtype
pkgver=0.6.4
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
    clang21
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
sha256sums=('c58dc7dbf17e23f16c3ea11fa5480d38f8d5e16a584c49c791c9bc1e14b4a33e')

prepare() {
    cd "$_pkgname-$pkgver"

    # Respect XDG Base Directory Specification
    # Use existing toolchain/cache, but allow override via environment
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable
    export PATH="/usr/lib/llvm21/bin:$PATH"
    export CC=clang-21
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
    echo "clang: $(which clang-21)"
    clang-21 --version | head -1
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

    # Remap build paths so binaries don't contain $srcdir references
    local _src="$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS="--remap-path-prefix=$_src/= --remap-path-prefix=${CARGO_HOME}/registry/src/=cargo/"
    export CFLAGS="-ffile-prefix-map=$_src/="
    export CXXFLAGS="-ffile-prefix-map=$_src/="

    # Use clang for C/C++ - avoids whisper.cpp build failures with newer gcc
    # (e.g. when [testing] repo is enabled)
    export PATH="/usr/lib/llvm21/bin:/opt/cuda/bin:$PATH"
    export LIBCLANG_PATH=/usr/lib/llvm21/lib
    export CC=clang-21
    export CXX=clang++

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

    install -Dm755 "voxtype-cuda" "$pkgdir/usr/lib/voxtype/voxtype-cuda"

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
