# Maintainer: Lumina Nao <luminanao@duck.com>

pkgname=llama-hdd
pkgver=b9554.hdd
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
source=("${pkgname}::git+https://codeberg.org/LuminaNAO/llama-hdd.cpp.git#tag=${pkgver}")
sha256sums=('SKIP')

# Backend selection: cpu (default), vulkan, cuda, rocm
# Override with: LLAMA_HDD_BACKEND=vulkan makepkg
_backend="${LLAMA_HDD_BACKEND:-cpu}"

pkgver() {
    cd "$pkgname"
    # b<NNNN>.r<commits-since-tag>
    git describe --tags --abbrev=0 | sed 's/^b/b/' \
        | awk -v n="$(git rev-list --count HEAD ^"$(git describe --tags --abbrev=0)")" '{print $1 ".r" n}'
}

build() {
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
        *) echo "Unknown LLAMA_HDD_BACKEND=$_backend (cpu|vulkan|cuda|rocm)"; return 1 ;;
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
