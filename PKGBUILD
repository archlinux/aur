# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=cuda-tile
pkgname=(
    'cuda-tile'
    'python-cuda-tile')
pkgver=13.1.3
pkgrel=1
pkgdesc='An MLIR-based intermediate representation and compiler infrastructure for CUDA kernel optimization'
arch=('x86_64')
url='https://github.com/NVIDIA/cuda-tile/'
license=('Apache-2.0 WITH LLVM-exception')
makedepends=(
    'cmake'
    'git'
    'nanobind'
    'pybind11'
    'python')
source=("https://github.com/NVIDIA/cuda-tile/archive/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
        "git+https://github.com/llvm/llvm-project.git")
sha256sums=('c1d51c44252db3d86883a9053b5f464b49e9ddd69b7fc8a7586c3c5f0f23f521'
            'SKIP')

prepare() {
    local _llvm_commit
    _llvm_commit="$(awk '/set\(LLVM_BUILD_COMMIT_HASH/ { sub(/\)/, ""); print $2 }' "${pkgbase}-${pkgver}/cmake/IncludeLLVM.cmake")"
    
    git -C llvm-project config --local advice.detachedHead false
    git -C llvm-project checkout "$_llvm_commit"
}

build() {
    # NOTE: does not accept 'None' build type
    cmake -B build -S "${pkgbase}-${pkgver}" \
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

package_cuda-tile() {
    depends=(
        'gcc-libs'
        'glibc')
    options=('!emptydirs')
    
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include/include"/cuda_tile{,-c} "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/lib/objects-Release"
    rm -r "${pkgdir}/usr/src"
    mv -f "${pkgdir}/usr/python_packages/cuda_tile" python-cuda-tile
}

package_python-cuda-tile() {
    pkgdesc='Python bindings for cuda-tile'
    depends=(
        "cuda-tile=${pkgver}"
        'gcc-libs'
        'glibc'
        'python'
        'python-numpy')
    
    local _sitepkgs
    _sitepkgs="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d -m755 "${pkgdir}${_sitepkgs}"
    mv python-cuda-tile "${pkgdir}${_sitepkgs}/cuda_tile"
    install -D -m644 "${pkgbase}-${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
