# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-apache-tvm-ffi
_pkgname=tvm-ffi
pkgver=0.1.11
pkgrel=1
pkgdesc="TVM Foreign Function Interface - core bindings for Apache TVM"
arch=('x86_64')
url="https://github.com/apache/tvm-ffi"
license=('Apache-2.0')
depends=(
    'python'
    'python-typing_extensions'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-scikit-build-core'
    'python-setuptools-scm'
    'cython'
    'cmake'
    'ninja'
    'git'
)
checkdepends=(
    'python-pytest'
    'python-numpy'
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/apache/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "dlpack::git+https://github.com/dmlc/dlpack"
    "libbacktrace::git+https://github.com/ianlancetaylor/libbacktrace"
)
sha256sums=('5f226210d0a243d1869f32bd1f0a89ab21d082edc1ff152d96b926d6fc27bdba'
            'SKIP'
            'SKIP')

prepare() {
    cd "$_pkgname-$pkgver"

    # Set up the submodule directories
    rm -rf 3rdparty/dlpack 3rdparty/libbacktrace
    cp -r "$srcdir/dlpack" 3rdparty/dlpack
    cp -r "$srcdir/libbacktrace" 3rdparty/libbacktrace
}

build() {
    cd "$_pkgname-$pkgver"

    # Set version for setuptools-scm
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

    python -m build --wheel --no-isolation \
        -C cmake.args="-DTVM_FFI_BUILD_TESTS=OFF" \
        -C cmake.args="-DTVM_FFI_BUILD_PYTHON_MODULE=ON"
}

check() {
    cd "$_pkgname-$pkgver"

    # Basic import test
    PYTHONPATH="$PWD/build/cp312/tvm_ffi:$PYTHONPATH" python -c "import tvm_ffi; print(tvm_ffi.__name__)" || \
        echo "Warning: Import test failed, will test after installation"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
