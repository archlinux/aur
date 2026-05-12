# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Peter Jackson <pete@peteonrails.com>

# Export the variable matching your GPU, then run makepkg:
#   CUDA_ARCH=120 makepkg -si
#
# Architecture      Compute Cap.  GPUs
# ─────────────────────────────────────────────────────────────────────────────
# 121            12.1          GB10 (DGX Spark)
# 120            12.0          GeForce RTX 5090/5080/5070/5060/5050,
#                                 RTX PRO 6000/5000/4500/4000/2000 Blackwell
# 103            10.3          GB300, B300 (data center)
# 100            10.0          GB200, B200 (data center)
# 90             9.0           H100, H200, GH200 (data center)
# 89             8.9           GeForce RTX 4090/4080/4070/4060/4050,
#                                 RTX 6000/5000/4500/4000 Ada, L4, L40, L40S
# 87             8.7           Jetson AGX Orin, Orin NX, Orin Nano
# 86             8.6           GeForce RTX 3090/3080/3070/3060/3050,
#                                 RTX A6000/A5000/A4000/A3000/A2000, A40, A10
# 80             8.0           A100, A30 (data center)
# 75             7.5           GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4
#
# Reference: https://developer.nvidia.com/cuda-gpus
_cuda_arch="${CUDA_ARCH:-}"

pkgname=voxtype-cuda
_pkgname=voxtype
pkgver=0.7.1
pkgrel=1
pkgdesc="Pure CUDA version of the push-to-talk voice-to-text tool"
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
    gtk4
    gtk4-layer-shell
)
optdepends=(
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'gtk4: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer'
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
validpgpkeys=('E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6')  # Peter Jackson <pete@peteonrails.com>
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6f2ed932696d112bd419a946e67d28a58c9151761f2cb60fa8e4b7f47bdec80')

prepare() {
    cd "$_pkgname-$pkgver"

    if [[ -z "$_cuda_arch" ]]; then
      cat <<EOF

ERROR: CUDA_ARCH is not set. You must specify your GPU architecture.
       Set it before running makepkg, for example:

       CUDA_ARCH=120 makepkg -si

  121  → GB10 (DGX Spark)
  120  → GeForce RTX 5090/5080/5070/5060/5050, RTX PRO Blackwell
  103  → GB300, B300 (data center)
  100  → GB200, B200 (data center)
  90   → H100, H200, GH200
  89   → GeForce RTX 4090/4080/4070/4060/4050, Ada, L4, L40S
  87   → Jetson AGX Orin, Orin NX, Orin Nano
  86   → GeForce RTX 3090/3080/3070/3060/3050, RTX A-series, A40
  80   → A100, A30 (data center)
  75   → GeForce RTX 2080/2070/2060, GTX 1650 Ti, T4

  See: https://developer.nvidia.com/cuda-gpus

EOF
      return 1
    fi

    # Respect XDG Base Directory Specification
    # Use existing toolchain/cache, but allow override via environment
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable

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

    # Remap build paths so binaries don't contain $srcdir references
    local _src="$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS="--remap-path-prefix=$_src/= --remap-path-prefix=${CARGO_HOME}/registry/src/=cargo/"
    export CFLAGS="-ffile-prefix-map=$_src/="
    export CXXFLAGS="-ffile-prefix-map=$_src/="

    # Use clang for C/C++ - avoids whisper.cpp build failures with newer gcc
    # (e.g. when [testing] repo is enabled)
    export PATH="/opt/cuda/bin:$PATH"
    export CC=clang
    export CXX=clang++

    export CUDAToolkit_ROOT=/opt/cuda
    echo "set(CMAKE_CUDA_ARCHITECTURES ${_cuda_arch})" > /tmp/voxtype-cuda-arch.cmake
    export CMAKE_TOOLCHAIN_FILE=/tmp/voxtype-cuda-arch.cmake

    # Build CUDA binary - Disable LTO to prevent linking hangs (Cargo.toml has lto=true)
    cargo build --frozen --release --features gpu-cuda \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-cuda

    # Build ONNX engines binary if onnxruntime is available
    export ORT_STRATEGY=system
    cargo clean
    cargo build --frozen --release \
        --features parakeet-load-dynamic,moonshine,sensevoice,paraformer,dolphin,omnilingual,cohere \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-onnx

    # Build OSD binaries: the launcher (voxtype-osd) plus both frontends.
    # The launcher has no GUI deps; each frontend is gated on its feature
    # so the cargo invocation needs both osd-gtk4 and osd-native enabled
    # to produce all three. These don't need engine features (the OSD
    # only consumes audio frames over IPC, not the transcribers).
    cargo clean
    cargo build --frozen --release \
        --bin voxtype-osd \
        --bin voxtype-osd-gtk4 \
        --bin voxtype-osd-native \
        --features osd-gtk4,osd-native \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype-osd voxtype-osd
    cp target/release/voxtype-osd-gtk4 voxtype-osd-gtk4
    cp target/release/voxtype-osd-native voxtype-osd-native
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

    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-cuda "$pkgdir/usr/bin/voxtype"

    # Install OSD binaries into /usr/lib/voxtype/, matching the daemon
    # variant layout. Only the launcher gets a /usr/bin symlink — users
    # invoke `voxtype-osd` and config picks the frontend at runtime.
    # The launcher resolves its real path via /proc/self/exe (which
    # follows the symlink) and probes its parent directory first, so it
    # finds /usr/lib/voxtype/voxtype-osd-{gtk4,native} without needing
    # them on PATH.
    install -Dm755 "voxtype-cuda" "$pkgdir/usr/lib/voxtype/voxtype-cuda"
    install -Dm755 "voxtype-onnx" "$pkgdir/usr/lib/voxtype/voxtype-onnx"
    install -Dm755 "voxtype-osd" "$pkgdir/usr/lib/voxtype/voxtype-osd"
    install -Dm755 "voxtype-osd-gtk4" "$pkgdir/usr/lib/voxtype/voxtype-osd-gtk4"
    #install -Dm755 "voxtype-osd-native" "$pkgdir/usr/lib/voxtype/voxtype-osd-native"
    ln -sf /usr/lib/voxtype/voxtype-osd "$pkgdir/usr/bin/voxtype-osd"

    # Desktop entry for the TUI configure command, surfaced in walker/rofi/fuzzel/etc.
    install -Dm755 "packaging/scripts/voxtype-configure-launcher" \
        "$pkgdir/usr/bin/voxtype-configure-launcher"
    install -Dm644 "packaging/voxtype-configure.desktop" \
        "$pkgdir/usr/share/applications/voxtype-configure.desktop"

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
