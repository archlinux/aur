# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype
pkgver=0.7.3
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux (optimized for Wayland, works on X11)"
arch=('x86_64' 'aarch64')
url="https://voxtype.io"
license=('MIT')
depends=(
    'alsa-lib'
    'curl'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'cargo'
    'clang'
    'cmake'
    'git'
    'pkgconf'
    'shaderc'
    'vulkan-headers'
    'vulkan-icd-loader'
    'gtk4'              # build-time headers for the GTK4 OSD frontend
    'gtk4-layer-shell'  # gtk4-layer-shell-rs needs the system lib at build time
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
    'vulkan-icd-loader: GPU acceleration via Vulkan for Whisper'
    'onnxruntime: required for ONNX engines (rebuild with onnxruntime installed)'
    'cuda: GPU acceleration via CUDA 13 for ONNX engines (NVIDIA GPUs, requires driver 580+)'
    'cuda12.6: GPU acceleration via CUDA 12 for ONNX engines (older NVIDIA setups)'
    'rocm-hip-runtime: GPU acceleration via MIGraphX for ONNX engines (AMD GPUs)'
    'ollama: local AI summarization for meeting mode'
    'gtk4: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer'
)
backup=('etc/voxtype/config.toml')
install=voxtype.install
validpgpkeys=('E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6')  # Peter Jackson <pete@peteonrails.com>
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/peteonrails/voxtype/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc::https://github.com/peteonrails/voxtype/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
    '1a80d5d28136535d705bfcb4e4a0d07fef366ace148e1a5627bdf07185c0821a'  # source tarball
    'SKIP'  # source tarball signature
)

prepare() {
    cd "$pkgname-$pkgver"

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

    cd "$pkgname-$pkgver"
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
    export CC=clang
    export CXX=clang++

    # Limit parallelism to prevent cmake deadlocks during whisper-rs build
    export CMAKE_BUILD_PARALLEL_LEVEL=4
    export MAKEFLAGS="-j4"

    # Build native CPU binary (optimized for the user's machine)
    # Disable LTO to prevent linking hangs (Cargo.toml has lto=true)
    cargo build --frozen --release \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-native

    # Build Vulkan GPU binary (for GPU acceleration)
    cargo clean
    cargo build --frozen --release --features gpu-vulkan \
        --config 'profile.release.lto=false' \
        --config 'profile.release.codegen-units=8'
    cp target/release/voxtype voxtype-vulkan

    # Build ONNX engines binary if onnxruntime is available
    if pacman -Q onnxruntime &>/dev/null; then
        echo "=== Building ONNX engines binary (onnxruntime found) ==="
        export ORT_STRATEGY=system
        cargo clean
        cargo build --frozen --release \
            --features parakeet-load-dynamic,moonshine,sensevoice,paraformer,dolphin,omnilingual,cohere \
            --config 'profile.release.lto=false' \
            --config 'profile.release.codegen-units=8'
        cp target/release/voxtype voxtype-onnx
    else
        echo "=== Skipping ONNX engines (install onnxruntime and rebuild for Parakeet/SenseVoice/etc.) ==="
    fi

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
    cd "$pkgname-$pkgver"

    # Respect XDG Base Directory Specification
    export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
    export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
    export RUSTUP_TOOLCHAIN=stable

    # Skip examples — inspect_cohere_onnx requires the `cohere` feature for
    # the optional `ort` crate. Examples aren't part of the shipped package.
    cargo test --frozen --lib --bins --tests
}

package() {
    cd "$pkgname-$pkgver"

    # Install CPU binary to /usr/lib/voxtype/ (matches binary package layout)
    install -Dm755 "voxtype-native" "$pkgdir/usr/lib/voxtype/voxtype-native"

    # Install Vulkan GPU binary to /usr/lib/voxtype/
    install -Dm755 "voxtype-vulkan" "$pkgdir/usr/lib/voxtype/voxtype-vulkan"

    # Install ONNX engines binary if it was built
    if [[ -f "voxtype-onnx" ]]; then
        install -Dm755 "voxtype-onnx" "$pkgdir/usr/lib/voxtype/voxtype-onnx"
    fi

    # Create symlink at /usr/bin/voxtype -> /usr/lib/voxtype/voxtype-native
    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-native "$pkgdir/usr/bin/voxtype"

    # Install OSD binaries into /usr/lib/voxtype/, matching the daemon
    # variant layout. Only the launcher gets a /usr/bin symlink — users
    # invoke `voxtype-osd` and config picks the frontend at runtime.
    # The launcher resolves its real path via /proc/self/exe (which
    # follows the symlink) and probes its parent directory first, so it
    # finds /usr/lib/voxtype/voxtype-osd-{gtk4,native} without needing
    # them on PATH.
    install -Dm755 "voxtype-osd" "$pkgdir/usr/lib/voxtype/voxtype-osd"
    install -Dm755 "voxtype-osd-gtk4" "$pkgdir/usr/lib/voxtype/voxtype-osd-gtk4"
    install -Dm755 "voxtype-osd-native" "$pkgdir/usr/lib/voxtype/voxtype-osd-native"
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
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "docs/INSTALL.md" "$pkgdir/usr/share/doc/$pkgname/INSTALL.md"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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
