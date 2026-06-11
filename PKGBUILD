# Maintainer: crl <crl18039102576@126.com>

pkgbase=rmm
pkgname=(rmm python-rmm)
pkgver=26.06.00
pkgrel=1
pkgdesc="RAPIDS Memory Manager"
url="https://github.com/rapidsai/rmm"
arch=('x86_64')
license=('Apache-2.0')
depends=('libgcc' 'libstdc++' 'cuda' 'nvtx3' 'rapids-logger')
makedepends=('cmake' 'gcc' 'ninja' 'cython' 'python-build' 'python-installer' 'python-wheel' 'python-rapids-build-backend')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "system-lib.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '62f0927d30f560f21aa2b1fd833096b48568e38ee18052b6a8300790519116fd'
    '61ea872a61846518804b698842d4d9b01f09847cc9b58480337173b5b6d8a509'
    '1c5d8c1f36bea1934d778124c8fb79a27e4f1b8e408e18a8afc7d5309acdac58'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
    patch -p1 python/rmm/CMakeLists.txt < "$srcdir/missing-pkg.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CXXFLAGS="$CXXFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DRMM_NVTX=ON \
        -G Ninja
    cmake --build build

    cd python/rmm
    export rmm_DIR="$srcdir/$pkgname-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_rmm() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-rmm() {
    depends+=('python-cuda' 'rmm')
    cd "$srcdir/$pkgbase-$pkgver/python/rmm"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
