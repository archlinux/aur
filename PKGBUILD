# Maintainer: Smoolak <smoolak@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pylance
pkgname=python-$_name
pkgver=14.0.3
pkgrel=2
pkgdesc='Python wrapper for the Lance columnar data format'
arch=('x86_64' 'aarch64')
_repo='https://github.com/lance-format/lance'
url="$_repo/tree/main/python"
license=('Apache-2.0')
depends=('python'
         'python-pyarrow'
         'python-numpy'
         'python-lance-namespace'
         'zstd'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'rust'
             'protobuf')
checkdepends=('python-boto3'
              'python-datasets'
              'python-duckdb'
              'python-ml-dtypes'
              'python-pillow'
              'python-pandas'
              'python-polars'
              'python-psutil'
              'python-pytest'
              'python-pytest-xdist'
              'python-tqdm'
              'python-datafusion'
              'python-opentelemetry-sdk'
              'python-opentelemetry-api')
optdepends=('python-opentelemetry-api: otel'
            'python-opentelemetry-sdk: otel'

            'python-pytorch: torch'

            'python-geoarrow-rust-core: geo'
            'python-geoarrow-rust-io: geo')
options=('!debug' '!lto')
source=("${_name#py}-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b04f172dd509f7f266d0adc3725874a5e8baf1a504440df5eb0da33f4bc11618')

prepare() {
  cd "${_name#py}-$pkgver"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' python/pyproject.toml
  # Build for the generic Arch target instead of forcing Haswell CPUs
  sed -i '/target-cpu=haswell/d' .cargo/config.toml python/.cargo/config.toml
  # Give the index build enough rows to still be running when the progress callback raises, optimized builds finish 1500 rows within one 100 ms callback interval
  sed -i 's/"vector_progress_post_commit_error", 1500, 128/"vector_progress_post_commit_error", 150_000, 128/' python/python/tests/test_vector_index.py
  # Measure anonymous memory in the leak test, total RSS also counts the extension's file-backed pages that some kernels map in large chunks on first use
  sed -i 's/return psutil.Process(os.getpid()).memory_info().rss$/mi = psutil.Process(os.getpid()).memory_info(); return mi.rss - mi.shared/' python/python/tests/test_memory_leaks.py
}

build() {
  cd "${_name#py}-$pkgver/python"
  export MATURIN_PEP517_ARGS='--features fp16kernels'
  export ZSTD_SYS_USE_PKG_CONFIG=1
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "${_name#py}-$pkgver/python"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" python/tests
}

package() {
  cd "${_name#py}-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
