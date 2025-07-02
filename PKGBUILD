# Maintainer: crl <crl18039102576@126.com>

pkgbase=python-cudf
pkgname=(python-cudf python-dask-cudf)
pkgver=25.06.00
pkgrel=2
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/rapidsai/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'python' 'libcudf' 'python-pylibcudf' 'python-cupy' 'python-nvtx' 'python-pynvjitlink' 'python-pyarrow')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "missing-pkg.patch")
sha256sums=(
    '4fdcac02be1e0022643a1cd2afa9bae6091bb7d7525cdf0edb9d481bca737fa2'
    '72618631b71f51c4d0773f6964bb9bfe3a92ba0ebe5351fd7baedb56f833fcfa'
)


prepare() {
    cd "$srcdir/cudf-$pkgver"
    patch -p1 "python/cudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
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
