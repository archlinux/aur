# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=cuda-tile-git
pkgname=(
    'cuda-tile-git'
    'python-cuda-tile-git'
)
pkgver=r3.802d937
pkgrel=1
pkgdesc='An MLIR-based intermediate representation and compiler infrastructure for CUDA kernel optimization (git version)'
arch=('x86_64')
url='https://github.com/NVIDIA/cuda-tile/'
license=('Apache-2.0 WITH LLVM-exception')
makedepends=(
    'cmake'
    'git'
    'nanobind'
    'pybind11'
    'python')
source=('git+https://github.com/NVIDIA/cuda-tile.git'
        "git+https://github.com/llvm/llvm-project.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    local _llvm_commit
    _llvm_commit="$(awk '/set\(LLVM_BUILD_COMMIT_HASH/ { sub(/\)/, ""); print $2 }' cuda-tile/cmake/IncludeLLVM.cmake)"
    
    git -C llvm-project config --local advice.detachedHead false
    git -C llvm-project checkout "$_llvm_commit"
}

pkgver() {
    ( set -o pipefail
        git -C cuda-tile describe --long --abbrev='7' 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf 'r%s.%s' "$(git -C cuda-tile rev-list --count HEAD)" "$(git -C cuda-tile rev-parse --short='7' HEAD)"
    )
}

build() {
    # NOTE: does not accept 'None' build type
    cmake -B build -S cuda-tile \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCUDA_TILE_ENABLE_BINDINGS_PYTHON:BOOL='ON' \
        -DCUDA_TILE_ENABLE_TESTING:BOOL='ON' \
        -DCUDA_TILE_USE_LLVM_SOURCE_DIR:PATH="${srcdir}/llvm-project" \
        -Wno-dev
    cmake --build build
}

# https://github.com/NVIDIA/cuda-tile/issues/2
#check() {
#    cmake --build build --target check-cuda-tile
#}

package_cuda-tile-git() {
    depends=(
        'gcc-libs'
        'glibc')
    provides=('cuda-tile')
    conflicts=('cuda-tile')
    options=('!emptydirs')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 cuda-tile/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include/include"/cuda_tile{,-c} "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/lib/objects-Release"
    rm -r "${pkgdir}/usr/src"
    mv -f "${pkgdir}/usr/python_packages/cuda_tile" python-cuda-tile
}

package_python-cuda-tile-git() {
    pkgdesc='Python bindings for cuda-tile (git version)'
    depends=(
        "cuda-tile-git=${pkgver}"
        'gcc-libs'
        'glibc'
        'python'
        'python-numpy')
    provides=('python-cuda-tile')
    conflicts=('python-cuda-tile')
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d -m755 "${pkgdir}${_sitepkgs}"
    mv python-cuda-tile "${pkgdir}${_sitepkgs}/cuda_tile"
    install -D -m644 cuda-tile/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
