# Maintainer: crl <crl18039102576@126.com>

pkgbase=python-cudf
pkgname=(python-cudf python-dask-cudf python-cudf-polars)
pkgver=26.08.00
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
    python-cuda
    python-pyarrow
    python-cachetools
    python-numba-cuda
)
makedepends=(cuda gcc python-setuptools cmake python-scikit-build-core python-rapids-build-backend ninja cython)
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "missing-pkg.patch" "system-cccl.patch")
sha256sums=('949b2821660bfdd68409c024ada47132776a14cdc09f642c9efc0b4ac0ea2998'
            '72618631b71f51c4d0773f6964bb9bfe3a92ba0ebe5351fd7baedb56f833fcfa'
            '1d05ed0fdd36bbf5d45017cab988dc43fd1016547c13948205d99d9f456aef03')


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

    cd "$srcdir/cudf-$pkgver/python/cudf_polars"
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
    depends+=(python-cudf python-polars)
    pkgdesc="A Python library providing a GPU engine for Polars"
    cd "$srcdir/cudf-$pkgver/python/cudf_polars"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
