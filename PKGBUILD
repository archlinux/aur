# Maintainer: crl <crl18039102576@126.com>

pkgbase=python-cudf
pkgname=(python-cudf python-dask-cudf python-cudf-polars python-cudf-streaming)
pkgver=26.10.00
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/NVIDIA/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    cuda
    python
    libcudf
    python-pylibcudf
    python-cupy
    python-nvtx
    python-cuda
    python-pyarrow
    python-cachetools
    python-numba-cuda
)
makedepends=(cuda gcc python-setuptools cmake python-scikit-build-core python-rapids-build-backend ninja cython libcudf-streaming python-rapidsmpf)
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "missing-pkg.patch" "system-cccl.patch" "missing-pkg-streaming.patch")
sha256sums=('bfd7789bdea61ed92666ca059003fcb1b107cd1ba7dd241a1887e3c510d2d8da'
            '72618631b71f51c4d0773f6964bb9bfe3a92ba0ebe5351fd7baedb56f833fcfa'
            '1d05ed0fdd36bbf5d45017cab988dc43fd1016547c13948205d99d9f456aef03'
            '62846468452defffd2d268327e62db30e9f1c4c7a9dc102b551347747d31a2a1')


prepare() {
    cd "$srcdir/cudf-$pkgver"
    patch -p1 "python/cudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/cudf/udf_cpp/CMakeLists.txt" < "$srcdir/system-cccl.patch"
    patch -p1 "python/cudf_streaming/CMakeLists.txt" < "$srcdir/missing-pkg-streaming.patch"
}


build() {
    cd "$srcdir/cudf-$pkgver/python/cudf"
    export CCCL_DIR="/opt/cuda/lib/cmake"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/cudf-$pkgver/python/dask_cudf"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/cudf-$pkgver/python/cudf_polars"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/cudf-$pkgver/python/cudf_streaming"
    export CMAKE_CUDA_ARCHITECTURES='native'
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_python-cudf() {
    cd "$srcdir/cudf-$pkgver/python/cudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-dask-cudf() {
    depends+=(python-cudf python-dask-cuda)
    pkgdesc="A Python library providing a GPU backend for Dask DataFrames"
    cd "$srcdir/cudf-$pkgver/python/dask_cudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-cudf-polars() {
    depends+=(python-cudf python-polars python-rapidsmpf python-cudf-streaming python-kvikio python-nvidia-ml-py)
    pkgdesc="A Python library providing a GPU engine for Polars"
    cd "$srcdir/cudf-$pkgver/python/cudf_polars"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-cudf-streaming() {
    depends+=('libcudf-streaming' 'python-rapidsmpf')
    pkgdesc="cuDF Streaming - GPU-accelerated streaming data processing"
    cd "$srcdir/cudf-$pkgver/python/cudf_streaming"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
