# Maintainer: Lumina Nao <luminanao@duck.com>

pkgname=llama-hdd
pkgver=5
pkgrel=1
pkgdesc="LLM inference in C/C++ with disk-backed prompt-checkpoint persistence (llama.cpp soft-fork)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/LuminaNAO/llama-hdd.cpp"
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc' 'openmp')
makedepends=('cmake' 'git' 'python')
optdepends=(
    'cuda: NVIDIA GPU acceleration (build with LLAMA_HDD_BACKEND=cuda)'
    'rocm-hip-sdk: AMD GPU acceleration (build with LLAMA_HDD_BACKEND=rocm)'
    'vulkan-icd-loader: Vulkan GPU acceleration (build with LLAMA_HDD_BACKEND=vulkan)'
    'llama-launcher: launcher with --hdd-cache mode that drives this fork'\''s sidecar feature'
 )
provides=('llama.cpp' "llama.cpp=${pkgver}")
conflicts=('llama.cpp' 'llama.cpp-cuda' 'llama.cpp-vulkan' 'llama.cpp-hip')
source=("${pkgname}::git+https://codeberg.org/LuminaNAO/llama-hdd.cpp.git#tag=v${pkgver}")
sha256sums=('SKIP')

# Backend selection: cpu, vulkan, cuda, rocm, metal (+ other for custom)
# Non-interactive: LLAMA_HDD_BACKEND=metal makepkg
_backend="${LLAMA_HDD_BACKEND:-}"

_detect_backend() {
    if command -v nvidia-smi >/dev/null 2>&1; then
        echo cuda
    elif command -v rocminfo >/dev/null 2>&1; then
        echo rocm
    elif [[ "$(uname)" == "Darwin" ]]; then
        echo metal
    elif command -v vulkaninfo >/dev/null 2>&1; then
        echo vulkan
    else
        echo cpu
    fi
}

_select_backend() {
    [ -n "$_backend" ] && return 0
    if ! { : </dev/tty; } 2>/dev/null; then
        echo "ERROR: no backend selected and no terminal to ask on."
        echo "Set LLAMA_HDD_BACKEND to: cpu, vulkan, cuda, rocm, metal, or custom (e.g. sycl). Example:"
        echo "  LLAMA_HDD_BACKEND=sycl paru -S llama-hdd"
        return 1
    fi
    local suggested choice
    suggested="$(_detect_backend)"
    {
        echo ""
        echo "llama-hdd backend:"
        echo "  1) cpu     - no GPU acceleration"
        echo "  2) vulkan  - any modern GPU"
        echo "  3) cuda    - NVIDIA (requires cuda)"
        echo "  4) rocm    - AMD (requires rocm-hip-sdk)"
        echo "  5) metal   - Apple Silicon / macOS (requires Metal)"
        echo "  6) other   - type custom backend (e.g. sycl, custom)"
        printf "Select backend [1-6 or name, Enter=%s (detected), auto-continues in 120s]: " "$suggested"
    } >/dev/tty
    # Timeout guards unattended runs (paru/yay build queues): fall back to
    # the detected backend instead of hanging the install forever.
    if ! read -r -t 120 choice </dev/tty; then
        choice=""
        echo "" >/dev/tty
        echo "No input after 120s; using detected backend: $suggested" >/dev/tty
    fi
    case "$choice" in
        1) _backend=cpu ;;
        2) _backend=vulkan ;;
        3) _backend=cuda ;;
        4) _backend=rocm ;;
        5) _backend=metal ;;
        6)
            {
                printf "Enter custom backend (e.g. sycl): " >/dev/tty
                read -r custom_backend </dev/tty
                [ -z "$custom_backend" ] && { echo "Empty backend; aborting." >/dev/tty; return 1; }
                _backend="$custom_backend"
            }
            ;;
        "") _backend="$suggested" ;;
        cpu|vulkan|cuda|rocm|metal) _backend="$choice" ;;
        *) echo "Invalid choice: $choice" >/dev/tty; return 1 ;;
    esac
    echo "Building llama-hdd with backend: $_backend" >/dev/tty
}

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
    _select_backend

    cd "$pkgname"

    local cmake_args=(
        -B build
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        -DBUILD_SHARED_LIBS=ON
        -DLLAMA_CURL=ON
        -DLLAMA_BUILD_TESTS=OFF
        -DLLAMA_BUILD_EXAMPLES=ON
        -DLLAMA_BUILD_SERVER=ON
    )

    case "$_backend" in
        cuda)    cmake_args+=(-DGGML_CUDA=ON) ;;
        rocm)    cmake_args+=(-DGGML_HIP=ON -DAMDGPU_TARGETS="${AMDGPU_TARGETS:-gfx1100;gfx1151}") ;;
        vulkan)  cmake_args+=(-DGGML_VULKAN=ON) ;;
        cpu)     ;;
        metal)   cmake_args+=(-DGGML_METAL=ON) ;;
        other|*)
            # For unknown/custom backends: map to -DGGML_<BACKEND>=ON
            # e.g. sycl → -DGGML_SYCL=ON (uppercase).
            upper="$(echo "$_backend" | tr '[:lower:]' '[:upper:]')"
            cmake_args+=("-DGGML_${upper}=ON")
            ;;
    esac

    cmake "${cmake_args[@]}"
    cmake --build build --config Release -j"$(nproc)"
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
