# Maintainer: crl <crl18039102576@126.com>

pkgbase=rmm
pkgname=(rmm python-rmm)
pkgver=26.02.00
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
    "fix-cudf-compile.patch"
)
sha256sums=(
    'f7460ec9f177d79e8a709b7011cd11392059bcbd906336f4f5b90ef2b5547683'
    'ad3569a92322a8878c0e9a1e33e3fabcef773b427706c42e586b3104cea3c13d'
    '1c5d8c1f36bea1934d778124c8fb79a27e4f1b8e408e18a8afc7d5309acdac58'
    '0b71882e21fea70b03f7975b312f1cbfe7bdc8c52749b6303c897f264e32a4a9'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
    patch -p1 python/rmm/CMakeLists.txt < "$srcdir/missing-pkg.patch"
    patch -p1 cpp/include/rmm/device_uvector.hpp < "$srcdir/fix-cudf-compile.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
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
