# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-onnx-simplifier
_pkgname=onnx-simplifier
pkgver=0.6.4
pkgrel=2
pkgdesc='Simplify your ONNX model by removing redundant operators'
arch=('x86_64')
url='https://github.com/daquexian/onnx-simplifier'
license=('Apache-2.0')
depends=(
    'python'
    'python-onnx'
    'python-onnxruntime'
    'python-rich'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
    'pybind11'
    'protobuf'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
provides=('python-onnxsim')
source=("git+https://github.com/daquexian/$_pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$_pkgname"

    # Convert SSH URLs to HTTPS for submodules
    sed -i 's|git@github.com:|https://github.com/|g' .gitmodules
    git submodule sync

    # Init only the onnx-optimizer submodule. onnx-simplifier 0.6.x dropped its
    # vendored third_party/pybind11 submodule (the C++ extension now finds system
    # pybind11 via find_package); onnx-optimizer still carries onnx + pybind11 and
    # is initialised recursively below.
    git submodule update --init third_party/onnx-optimizer

    # Init onnx-optimizer's submodules
    cd third_party/onnx-optimizer
    sed -i 's|git@github.com:|https://github.com/|g' .gitmodules 2>/dev/null || true
    git submodule sync
    git submodule update --init --recursive

    cd "$srcdir/$_pkgname"

    # Write version file since we're building from git
    echo "$pkgver" > VERSION

    # Fix CMake minimum version in bundled onnx (CMake 4.x requires at least 3.5)
    sed -i 's/cmake_minimum_required(VERSION 3.1)/cmake_minimum_required(VERSION 3.5)/' \
        third_party/onnx-optimizer/third_party/onnx/CMakeLists.txt

    # Fix API incompatibility with ONNX 1.19+ (Dimension constructor is now explicit)
    sed -i 's/std::vector<Dimension> s = {1}/std::vector<Dimension> s(1)/g' \
        third_party/onnx-optimizer/onnxoptimizer/passes/fuse_add_bias_into_conv.h

    # pytest-runner is a test-only setup_requires (not packaged for Arch); the PEP517
    # --no-isolation build resolves build-requires from the system. setup.py adds it
    # via a conditional `setup_requires.append('pytest-runner')`, so DELETE the whole
    # line (stripping just the string leaves `.append()` -> TypeError at build time).
    sed -i '/pytest-runner/d' setup.py 2>/dev/null || true
    [ -f pyproject.toml ] && sed -i '/pytest-runner/d' pyproject.toml || true
}

build() {
    cd "$_pkgname"

    # Build onnxsim's vendored onnx C++ against its OWN BUNDLED protobuf, NOT the
    # system one (ONNX_OPT_USE_SYSTEM_PROTOBUF=OFF). onnxsim statically embeds the
    # onnx descriptors; sharing the system libprotobuf descriptor pool with
    # python-onnx (a hard depend that onnxsim imports at load) makes protobuf 35
    # ABORT the interpreter on the duplicate onnx/onnx-ml.proto registration —
    # SIGABRT on `import onnxsim` for every user. A separate static protobuf pool
    # sidesteps the collision (verified: import + simplify works, no crash).
    # CMake 4.x needs a minimum policy version of 3.5 for the older bundled submodules.
    export CMAKE_ARGS="-DONNXSIM_BUILTIN_ORT=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DONNX_OPT_USE_SYSTEM_PROTOBUF=OFF"

    # PEP517 build (setuptools backend) instead of the legacy
    # `python setup.py bdist_wheel`/`install`; the custom build_ext still drives
    # the CMake build of the onnxsim_cpp2py_export pybind11 module.
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname"
    local python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")

    # Test import
    PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version//./}:$PYTHONPATH" \
        python -c "import onnxsim; print('Import successful')" || echo "Import test skipped"
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
