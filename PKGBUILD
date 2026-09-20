# Maintainer: Lumina Nao <luminanao@duck.com>
# AUR AGENT: publish this file WHOLESALE (plus regenerated .SRCINFO).
# Do NOT bump pkgver in a stale AUR copy - that has shipped broken source
# refs, missing deps, and missing options three times. Verify after publish:
# llama-launcher/utils/check-aur-sync.sh must report OK for all packages.

pkgname=llama-hdd
pkgver=11
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
# Bundled ggml installs to the same paths as the standalone ggml/libggml
# packages (headers, /usr/lib/cmake/ggml, libggml*.so) - same as AUR llama.cpp.
conflicts=('llama.cpp' 'llama.cpp-cuda' 'llama.cpp-vulkan' 'llama.cpp-hip' 'libggml' 'ggml')
source=("${pkgname}::git+https://codeberg.org/LuminaNAO/llama-hdd.cpp.git#tag=v${pkgver}")
sha256sums=('SKIP')

# Backend selection: cpu, vulkan, cuda, rocm, metal (+ other for custom)
# Non-interactive: LLAMA_HDD_BACKEND=metal makepkg
_backend="${LLAMA_HDD_BACKEND:-}"
# CUDA toolkit root / nvcc path, resolved by _check_backend_deps (cuda backend).
_cuda_root=""
_cuda_nvcc=""

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

# Backend build deps are not in makedepends because the backend is chosen at
# build time; verify them up front so the build fails with a pacman hint
# instead of deep inside CMake.
_check_backend_deps() {
    local missing=()
    case "$_backend" in
        vulkan)
            [ -f /usr/include/vulkan/vulkan.h ] || missing+=(vulkan-headers)
            command -v glslc >/dev/null 2>&1 || missing+=(shaderc)
            command -v glslangValidator >/dev/null 2>&1 || missing+=(glslang)
            command -v spirv-as >/dev/null 2>&1 || missing+=(spirv-tools)
            [ -f /usr/lib/cmake/SPIRV-Headers/SPIRV-HeadersConfig.cmake ] || \
            [ -f /usr/share/cmake/SPIRV-Headers/SPIRV-HeadersConfig.cmake ] || \
            [ -f /usr/lib/cmake/SPIRV-Headers/spirv-headers-config.cmake ] || missing+=(spirv-headers)
            ;;
        cuda)
            # Probing that nvcc merely EXISTS is not enough. CMake's
            # FindCUDAToolkit searches only PATH and CUDAToolkit_ROOT; on Arch
            # nvcc lives in /opt/cuda/bin, which the cuda package adds to PATH
            # via /etc/profile.d/cuda.sh -- and that only applies to LOGIN
            # shells. makepkg inherits whatever shell invoked it, so straight
            # after `pacman -S cuda` the toolkit is installed but invisible, the
            # old check passed, and the build died inside CMake with
            #   Could not find `nvcc` executable in any searched paths,
            #   please set CUDAToolkit_ROOT
            # Source that profile (defining append_path, which normally comes
            # from /etc/profile, if the shell lacks it) so we also inherit
            # CUDA_PATH and NVCC_CCBIN -- the g++-15 host-compiler pin Arch sets
            # deliberately. Then resolve nvcc ourselves as a fallback.
            if [ -r /etc/profile.d/cuda.sh ]; then
                if ! declare -F append_path >/dev/null 2>&1; then
                    append_path() {
                        case ":${PATH}:" in
                            *":$1:"*) ;;
                            *) PATH="${PATH:+$PATH:}$1" ;;
                        esac
                    }
                fi
                . /etc/profile.d/cuda.sh || true
            fi

            local _nvcc="" _cand
            _nvcc="$(command -v nvcc 2>/dev/null || true)"
            if [ -z "$_nvcc" ]; then
                for _cand in "${CUDAToolkit_ROOT:-}" "${CUDA_PATH:-}" "${CUDA_HOME:-}" /opt/cuda /usr/local/cuda; do
                    if [ -n "$_cand" ] && [ -x "$_cand/bin/nvcc" ]; then
                        _nvcc="$_cand/bin/nvcc"
                        break
                    fi
                done
            fi

            if [ -n "$_nvcc" ]; then
                # <root>/bin/nvcc -> <root>; readlink so a /usr/bin symlink resolves
                _cuda_nvcc="$(readlink -f "$_nvcc")"
                _cuda_root="$(dirname "$(dirname "$_cuda_nvcc")")"
                if [ ! -d "$_cuda_root/include" ] && [ ! -d "$_cuda_root/targets" ]; then
                    echo "ERROR: found nvcc at $_cuda_nvcc but no headers under $_cuda_root." >&2
                    echo "The CUDA toolkit install looks incomplete." >&2
                    return 1
                fi
            else
                missing+=(cuda)
            fi
            ;;
        rocm)
            command -v hipcc >/dev/null 2>&1 || [ -d /opt/rocm ] || missing+=(rocm-hip-sdk)
            ;;
    esac
    if [ "${#missing[@]}" -gt 0 ]; then
        echo "ERROR: the '$_backend' backend needs packages that are not installed:" >&2
        echo "  sudo pacman -S --needed ${missing[*]}" >&2
        echo "Install them and rebuild, or pick another backend (LLAMA_HDD_BACKEND=cpu)." >&2
        return 1
    fi
}

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0 | sed 's/^v//'
}

build() {
    _select_backend
    _check_backend_deps || return 1

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
        # The embedded web UI provisions assets via npm (BUILD_UI) or an HF
        # network download (USE_PREBUILT_UI) at build time - non-deterministic,
        # AUR forbids network in build(), and the HF bucket can serve a bundle
        # that fails this fork's asset validation (missing loading.html).
        # Both OFF = clean no-UI fallback; the API is unaffected.
        -DLLAMA_BUILD_UI=OFF
        -DLLAMA_USE_PREBUILT_UI=OFF
    )

    case "$_backend" in
        cuda)
            cmake_args+=(-DGGML_CUDA=ON)
            # Two variables, two mechanisms -- setting only the root still
            # fails with "No CMAKE_CUDA_COMPILER could be found":
            #   CUDAToolkit_ROOT    -> find_package(CUDAToolkit) finds libs
            #   CMAKE_CUDA_COMPILER -> enable_language(CUDA) finds nvcc
            [ -n "$_cuda_root" ] && cmake_args+=(-DCUDAToolkit_ROOT="$_cuda_root")
            [ -n "$_cuda_nvcc" ] && cmake_args+=(-DCMAKE_CUDA_COMPILER="$_cuda_nvcc")
            # Honour Arch's host-compiler pin (NVCC_CCBIN=/usr/bin/g++-15)
            # rather than letting CMake pick the system default.
            [ -n "${NVCC_CCBIN:-}" ] && [ -x "${NVCC_CCBIN}" ] && \
                cmake_args+=(-DCMAKE_CUDA_HOST_COMPILER="$NVCC_CCBIN")
            ;;
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
