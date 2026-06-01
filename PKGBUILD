# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lancedb
_pkgname=lancedb
pkgver=0.33.0
pkgrel=1
pkgdesc="Serverless, low-latency vector database for AI applications"
arch=('x86_64')
url="https://github.com/lancedb/lancedb"
license=('Apache-2.0')
depends=(
    'python'
    'python-deprecation'
    'python-numpy'
    'python-packaging'
    'python-pyarrow'
    'python-pydantic'
    'python-tqdm'
    'python-lance-namespace'
    'zstd'
    'lz4'
    'bzip2'
    'xz'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-maturin'
    'rust'
    'cmake'
    'protobuf'
    'pkgconf'
    'openssl'
)
optdepends=(
    'python-pylance: for to_lance() method to access underlying Lance dataset'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lancedb/lancedb/archive/refs/tags/python-v$pkgver.tar.gz")
sha256sums=('09eb1157f589b142d15da6bda462bb2c401cbd7f1a8347f4055d76e091b969dd')

prepare() {
    cd "lancedb-python-v$pkgver"
    # Use system Rust instead of rustup-managed toolchain
    rm -f rust-toolchain.toml
    # Remove fat LTO which causes rustc ICE and extremely slow builds
    # Also remove target-specific CPU flags to build for generic x86_64
    rm -f .cargo/config.toml
}

build() {
    cd "lancedb-python-v$pkgver/python"
    # Use system libraries instead of vendored copies
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export LZ4_SYS_USE_PKG_CONFIG=1
    python -m build --wheel --no-isolation
}

check() {
    cd "lancedb-python-v$pkgver/python"
    local _wheelfile=$(ls dist/*.whl | head -1)
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" "$_wheelfile"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/test-install$site_packages:$PYTHONPATH" python -c "
import lancedb
print(f'lancedb {lancedb.__version__} imported successfully')
"
}

package() {
    cd "lancedb-python-v$pkgver/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/lancedb-python-v$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
