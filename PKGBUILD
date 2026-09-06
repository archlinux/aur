# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Peter Jackson <pete@peteonrails.com>

# optional optimization, uncomment and set to your hardware
#_cpu="x86-64-v4"
#export CFLAGS+=" -march=$_cpu -O3"
#export CXXFLAGS+=" -march=$_cpu -O3"

# Export the variable matching your GPU, then run makepkg:
#   CUDA_ARCH=120 makepkg -s --nocheck
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
_cuda_arch="${CUDA_ARCH:-75;86;89;120}"

pkgname=voxtype-cuda
_pkgname=voxtype
pkgver=1.0.1
pkgrel=2
pkgdesc="Pure CUDA version of the push-to-talk voice-to-text tool"
arch=(x86_64)
url="https://voxtype.io"
license=(MIT)
provides=($_pkgname)
conflicts=($_pkgname)
depends=(
    alsa-lib
    cuda
    curl
    gcc-libs
    glibc
    gtk4
    gtk4-layer-shell
    nvidia-utils
)
makedepends=(
    cargo
    clang
    cmake
    git
    pkgconf
)
optdepends=(
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'libnotify: desktop notifications'
    'onnxruntime-cuda: required for ONNX engines'
    'onnxruntime-opt-cuda: required for ONNX engines (with CUDA and AVX2 CPU optimizations)'
    'ollama: local AI summarization for meeting mode'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'quickshell: OSD frontend for [osd] frontend = "quickshell"'
    'vulkan-icd-loader: required by the native (wgpu) OSD frontend'
    'wl-clipboard: clipboard support'
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
)
backup=(etc/voxtype/config.toml)
install=$pkgname.install
validpgpkeys=('9CCF7915B750CAE8B095ED1AA3FC9F33FD209279')
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz"
  "$_pkgname-$pkgver.tar.gz.asc::https://github.com/peteonrails/voxtype/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz.asc"
)
sha256sums=('a4d0a256167f58ce90153077da82620794422f5172c918625d480ff9ffca625e'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"

    if [[ -z "${CUDA_ARCH:-}" ]]; then
      cat <<EOF

NOTE: CUDA_ARCH is not set, so this builds for the default set: $_cuda_arch
      That compiles kernels for GPUs you almost certainly do not own and
      multiplies the nvcc time. To build for yours only, interrupt now and
      set it, for example:

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

    # Clear flags set by makepkg — they interfere with whisper-rs/whisper.cpp
    unset RUSTFLAGS DEBUG_RUSTFLAGS CFLAGS CXXFLAGS LDFLAGS

    # Remap build paths so binaries don't contain $srcdir references
    local _src="$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS="--remap-path-prefix=$_src/= --remap-path-prefix=${CARGO_HOME}/registry/src/=cargo/"
    export CFLAGS="-ffile-prefix-map=$_src/="
    export CXXFLAGS="-ffile-prefix-map=$_src/="

    # Use clang - avoids whisper.cpp build failures with newer gcc
    export PATH="/opt/cuda/bin:$PATH"
    export CC=clang
    export CXX=clang++

    export CUDAToolkit_ROOT=/opt/cuda
    # whisper-rs-sys never sets CMAKE_CUDA_ARCHITECTURES, and ggml only picks
    # its own default list when the variable is not already defined, so a
    # toolchain file is enough to pin the arch. cmake-rs reads this env var.
    echo "set(CMAKE_CUDA_ARCHITECTURES ${_cuda_arch})" > "$srcdir/cuda-arch.cmake"
    export CMAKE_TOOLCHAIN_FILE="$srcdir/cuda-arch.cmake"

    # Build CUDA binary - Disable LTO to prevent linking hangs (Cargo.toml has lto=true)
    cargo clean
    cargo build --frozen --release --features gpu-cuda \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-cuda

    # The *-cuda engine features enable the onnx-cuda-enabled marker, which is
    # what src/transcribe/onnx_ep.rs gates CUDA EP registration on. Without
    # them these engines run on CPU no matter which onnxruntime is installed.
    # onnx-load-dynamic (ort/load-dynamic) makes ort dlopen the system
    # libonnxruntime.so instead of linking it, and its ort-sys/disable-linking
    # is also what stops ort-sys from downloading prebuilt binaries during the
    # build (parakeet-rs pulls ort's default features, which include
    # download-binaries).
    cargo clean
    cargo build --frozen --release \
        --features onnx-load-dynamic,parakeet-load-dynamic,parakeet-cuda,moonshine-cuda,sensevoice-cuda,paraformer-cuda,dolphin-cuda,omnilingual-cuda,cohere-cuda \
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
        --bin voxtype-osd-quickshell \
        --bin voxtype-audio-bridge \
        --features osd-gtk4,osd-native \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype-osd voxtype-osd
    cp target/release/voxtype-osd-gtk4 voxtype-osd-gtk4
    cp target/release/voxtype-osd-native voxtype-osd-native
    cp target/release/voxtype-osd-quickshell voxtype-osd-quickshell
    cp target/release/voxtype-audio-bridge voxtype-audio-bridge
}

check() {
    cd "$_pkgname-$pkgver"

    # Respect XDG Base Directory Specification
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable

    # Skip examples — inspect_cohere_onnx requires the `cohere` feature for
    # the optional `ort` crate. Examples aren't part of the shipped package.
    cargo test --frozen --lib --bins --tests
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
    install -Dm755 "voxtype-osd-native" "$pkgdir/usr/lib/voxtype/voxtype-osd-native"
    install -Dm755 "voxtype-osd-quickshell" "$pkgdir/usr/lib/voxtype/voxtype-osd-quickshell"
    ln -sf /usr/lib/voxtype/voxtype-osd "$pkgdir/usr/bin/voxtype-osd"

    # voxtype-audio-bridge: NDJSON sidecar streaming audio levels over a
    # UNIX socket to the Quickshell OSD. Installed to /usr/bin so the
    # quickshell launcher can exec it by basename.
    install -Dm755 "voxtype-audio-bridge" "$pkgdir/usr/bin/voxtype-audio-bridge"

    # Quickshell QML tree. voxtype-osd-quickshell probes
    # /usr/share/voxtype/quickshell/ for shell.qml after user/runtime paths,
    # so shipping these files lets users opt in via
    # [osd] frontend = "quickshell" without copying anything by hand.
    # The voxtype-shared/ subdir holds a QML module registered via qmldir.
    install -Dm644 "quickshell/shell.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/shell.qml"
    install -Dm644 "quickshell/OsdSurface.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/OsdSurface.qml"
    install -Dm644 "quickshell/EnginePicker.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/EnginePicker.qml"
    install -Dm644 "quickshell/MeetingControls.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/MeetingControls.qml"
    install -Dm644 "quickshell/voxtype-shared/Theme.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/Theme.qml"
    install -Dm644 "quickshell/voxtype-shared/StateReader.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/StateReader.qml"
    install -Dm644 "quickshell/voxtype-shared/AudioBridge.qml" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/AudioBridge.qml"
    install -Dm644 "quickshell/voxtype-shared/qmldir" \
        "$pkgdir/usr/share/voxtype/quickshell/voxtype-shared/qmldir"

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
