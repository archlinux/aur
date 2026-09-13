# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-apache-tvm-ffi
_pkgname=tvm-ffi
pkgver=0.1.13.post3
_srcver=${pkgver/.post/-post}
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
    'python-scikit-build-core'
    'python-setuptools-scm'
    'cython>=3.2.8'
    'cmake'
    'ninja'
    'git'
)
checkdepends=(
    'gtest'
    'python-ml-dtypes'
    'python-numpy'
    'python-packaging'
    'python-pytest'
    'python-pytest-xdist'
    'python-pytorch'
    'python-setuptools'
)
optdepends=(
    'ninja: build C++ extensions with tvm_ffi.cpp'
    'python-cuda-bindings: NVRTC compilation and CUDA driver integration'
    'python-ml-dtypes: extended machine-learning dtype interoperability'
    'python-numpy: NumPy tensor and DLPack interoperability'
    'python-pytest: tvm_ffi.testing helpers'
    'python-pytorch: PyTorch tensor and stream interoperability'
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/apache/$_pkgname/archive/refs/tags/v$_srcver.tar.gz"
    "dlpack::git+https://github.com/dmlc/dlpack.git#commit=84d107bf416c6bab9ae68ad285876600d230490d"
    "libbacktrace::git+https://github.com/ianlancetaylor/libbacktrace.git#commit=793921876c981ce49759114d7bb89bb89b2d3a2d"
    'use-system-gtest.patch'
)
sha256sums=('cfd76d9e9ddda8eb194dca1d97c96cfc90bd11fb7133ff7860e78b40051e6fb5'
            'SKIP'
            'SKIP'
            '382afb7a81168c122b4ae869d99a139d93919aa020dfb74ebc56f11c1bba1059')

prepare() {
    cd "$_pkgname-$_srcver"

    # Recreate the exact submodule state recorded by this release tag.
    rm -rf 3rdparty/dlpack 3rdparty/libbacktrace
    cp -r "$srcdir/dlpack" 3rdparty/dlpack
    cp -r "$srcdir/libbacktrace" 3rdparty/libbacktrace

    # The upstream C++ suite fetches GoogleTest during configuration.
    # Use Arch's packaged copy so check() stays fully offline.
    patch -Np1 -i "$srcdir/use-system-gtest.patch"
}

build() {
    cd "$_pkgname-$_srcver"

    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$_srcver"

    # Run the native test suite against the same bundled sources used by the
    # wheel, but with the packaged GoogleTest dependency.
    cmake -S . -B build-cpp-tests -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DTVM_FFI_BUILD_PYTHON_MODULE=OFF \
        -DTVM_FFI_BUILD_TESTS=ON
    cmake --build build-cpp-tests --target tvm_ffi_tests
    # The native binary links ASan itself. Run CTest as the real build user;
    # preloading ASan into CMake also instruments its discovery subprocesses
    # and breaks LeakSanitizer under the container's process restrictions.
    ctest --test-dir build-cpp-tests --output-on-failure

    # Exercise the complete Python suite against the actual built wheel.
    rm -rf "$srcdir/tvm-ffi-check"
    python -m installer --destdir="$srcdir/tvm-ffi-check" dist/*.whl
    local site_packages
    site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

    # Arch's glog headers require this consumer definition.  PyTorch's JIT
    # extension helper invokes CXX directly rather than inheriting the CMake
    # target definition from PyTorch, so route those optional integration tests
    # through a compiler wrapper.  The explicit pytest base also avoids uid
    # emulation mismatches in root-mapped build containers.
    install -Dm755 /dev/stdin "$srcdir/tvm-ffi-check-cxx" <<'SH'
#!/bin/sh
exec /usr/bin/c++ -DGLOG_USE_GLOG_EXPORT "$@"
SH
    CXX="$srcdir/tvm-ffi-check-cxx" \
    PYTHONPATH="$srcdir/tvm-ffi-check$site_packages" \
        pytest -v --basetemp="$srcdir/tvm-ffi-pytest" tests/python

    # Representative CPU workflow: marshal containers and callbacks through the
    # FFI, then perform a zero-copy NumPy/DLPack round trip.
    PYTHONPATH="$srcdir/tvm-ffi-check$site_packages" python - <<'PY'
import numpy as np
import tvm_ffi

values = tvm_ffi.convert([1, 2, 3])
assert list(values) == [1, 2, 3]

double = tvm_ffi.convert_func(lambda value: value * 2)
assert double(21) == 42

source = np.arange(6, dtype=np.int32).reshape(2, 3)
tensor = tvm_ffi.from_dlpack(source)
round_trip = np.from_dlpack(tensor)
assert np.array_equal(round_trip, source)
assert str(tensor.dtype) == "int32"
PY
}

package() {
    cd "$_pkgname-$_srcver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
