# Maintainer: crl <crl18039102576@126.com>

pkgbase=python-cudf
pkgname=(python-cudf python-dask-cudf)
pkgver=25.08.00
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/rapidsai/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    cuda
    python
    libcudf
    python-pylibcudf
    python-cupy
    python-nvtx
    python-pynvjitlink
    python-pyarrow
    python-numba-cuda)
makedepends=(cuda python-setuptools cmake python-scikit-build-core python-rapids-build-backend ninja cython)
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "missing-pkg.patch" "system-cccl.patch")
sha256sums=(
    '749e5d17b4a71eb5494b46dc5dbf5926957402eb736fded4d12496ef2e8f53d7'
    '72618631b71f51c4d0773f6964bb9bfe3a92ba0ebe5351fd7baedb56f833fcfa'
    '28b8feeb1365b7ef864881b35ebdb859ba151117ded6f34793c3d22e0bc693cd'
)


prepare() {
    cd "$srcdir/cudf-$pkgver"
    patch -p1 "python/cudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/cudf/udf_cpp/CMakeLists.txt" < "$srcdir/system-cccl.patch"
}


build() {
    cd "$srcdir/cudf-$pkgver/python/cudf"
    export CCCL_DIR="/opt/cuda/lib/cmake"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/cudf-$pkgver/python/dask_cudf"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_python-cudf() {
    cd "$srcdir/cudf-$pkgver/python/cudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-dask-cudf() {
    depends+=(python-cudf python-dask-cuda)
    cd "$srcdir/cudf-$pkgver/python/dask_cudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
