# Maintainer: crl <crl18039102576@126.com>

pkgbase=nvforest
pkgname=(nvforest python-nvforest)
pkgver=26.06.00
pkgrel=1
pkgdesc="Highly optimized and lightweight library for decision tree inference on NVIDIA GPUs and CPUs"
url="https://github.com/rapidsai/nvforest"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'rapidjson' 'treelite')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '8687aba83ae745ddfbea57b124721a52b93fed0a4bd333a97cfef45aad5ea3fc'
    '40da5ccbfc63f26c38bdebf0b8d08d0fdaef3bccefb3b1d372d43e8918124e62'
    '7c19730ce7fecf8570829f33815eeda7bf1d1f211fec48dd11ee0df9fb42cd8b'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/nvforest/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_NVFOREST_TESTS=OFF \
        -G Ninja
    cmake --build build

    cd "$srcdir/$pkgbase-$pkgver/python/nvforest"
    export nvforest_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_nvforest() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-nvforest() {
    depends+=('python' 'python-pylibraft' 'python-treelite' 'nvforest' 'python-cuda-bindings')
    cd "$srcdir/$pkgbase-$pkgver/python/nvforest"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
