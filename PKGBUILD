# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=qiskit-fermions
pkgname=python-${_pkgname}
pkgver=0.4.1
pkgrel=1
pkgdesc="A toolkit for working with fermionic systems"
arch=(x86_64)
url=https://github.com/Qiskit/qiskit-fermions
license=(Apache-2.0)
depends=(
    python-qiskit
    python-scipy
    python-stevedore
    python-typing_extensions
)
optdepends=(
    'python-ffsim: required for ansatz gates of the circuit library'
    'python-pyomo: support for optimization modeling'
)
makedepends=(
    cargo
    clang
    cmake
    git
    python-build
    python-installer
    python-setuptools
    python-setuptools-rust
)
checkdepends=(
    python-sybil
    python-highspy
    python-pylatexenc
    python-pytest-subtests
    python-rustworkx
)
provides=(libqiskit_fermions_cext.so)
source=($_pkgname::git+https://github.com/Qiskit/$_pkgname#tag=$pkgver)
b2sums=('976843ba2520b53b268fcd232eaab4ae5fb242d1dbd5bdb9ccd83071d7f79cbcac304866b758187c4d5f70aa8c058d5ed84403aeecb44d7b8b061e4f75331f76')

prepare() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd $_pkgname
    # C library
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export QISKIT_LIB=/usr/lib/libqiskit.so
    export QISKIT_INCLUDE=/usr/include
    cargo rustc --frozen --release --all-features -p qiskit-fermions-cext --lib --crate-type cdylib
    # C tests
    local cmake_options=(
        -B build
        -S tests/c
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CARGO_LIB_DIR="$PWD/target/release"
        -D QISKIT_FERMIONS_INCLUDE_PATH="$PWD/target"
    )
    cmake "${cmake_options[@]}"
    # Python wheel
    python -m build --wheel --no-isolation
}

check() {
    cd $_pkgname
    # Rust/C tests
    cargo test -p qiskit-fermions-core --no-default-features --features cext
    # Python tests
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -o addopts="" tests/python
}

package() {
    cd $_pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 target/release/libqiskit_fermions_cext.so "$pkgdir"/usr/lib/libqiskit_fermions_cext.so
    install -Dm644 target/qiskit_fermions.h "$pkgdir"/usr/include/qiskit_fermions.h
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
