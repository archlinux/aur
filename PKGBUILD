# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=('python-mpi4jax' 'python-mpi4jax-cuda' 'python-mpi4jax-sycl')
_pkgname=${pkgname#python-}
pkgver=0.7.1
pkgrel=1
pkgdesc='Zero-copy MPI communication of JAX arrays'
arch=('x86_64')
url='https://github.com/mpi4jax/mpi4jax'
license=('Apache-2.0')
groups=('jax')
depends=('python-jax' 'python-numpy' 'python-mpi4py')
makedepends=(
    'cython'
    'intel-oneapi-dpcpp-cpp'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'rsync')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'mpi4jax.diff')
sha256sums=('3d66b84072065b5ef811ca132354d5e6f6302117236569afa96ce8be7ac6f2bc'
            'SKIP')

prepare() {
    patch -d "$_pkgname-$pkgver" -p1 -i../mpi4jax.diff
    rsync -a --delete "$_pkgname-$pkgver/" "$_pkgname-$pkgver-cuda/"
    rsync -a --delete "$_pkgname-$pkgver/" "$_pkgname-$pkgver-sycl/"
}

build() {
    # Build plain CPU-only extension.
    python -m build -nvw $_pkgname-$pkgver

    # Build CUDA extension.
    env ENABLE_CUDA=true CUDA_PATH=/opt/cuda \
        python -m build -nvw $_pkgname-$pkgver-cuda

    # Build OpenCL extension (Intel OCL).
    env ENABLE_SYCL=true CMPLR_ROOT=/opt/intel/oneapi/compiler/latest \
        python -m build -nvw $_pkgname-$pkgver-sycl
}

_package_python() {
    pushd $1
    install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --compile-bytecode=1 --destdir=$pkgdir \
        dist/$_pkgname-$pkgver-*.whl
    popd
}

package_python-mpi4jax() {
    pkgdesc="${pkgdesc}"
    provides=('python-mpi4jax')
    conflicts=('python-mpi4jax')

    _package_python $_pkgname-$pkgver
}

package_python-mpi4jax-cuda() {
    pkgdesc="${pkgdesc} (with CUDA)"
    depends+=('cuda')
    provides=('python-mpi4jax')
    conflicts=('python-mpi4jax')

    _package_python $_pkgname-$pkgver-cuda
}

package_python-mpi4jax-sycl() {
    pkgdesc="${pkgdesc} (with SYCL)"
    depends+=('intel-oneapi-compiler-dpcpp-cpp-runtime-libs')
    provides=('python-mpi4jax')
    conflicts=('python-mpi4jax')

    _package_python $_pkgname-$pkgver-sycl
}
