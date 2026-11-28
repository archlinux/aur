# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=datafusion
pkgname=python-$_name
pkgver=54.1.0
pkgrel=1
pkgdesc='Python bindings for Apache DataFusion, an extensible query engine using Apache Arrow'
arch=('x86_64' 'aarch64')
url='https://github.com/apache/datafusion-python'
license=('Apache-2.0')
depends=('python'
         'python-cloudpickle'
         'python-pyarrow'
         'zstd'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'rust'
             'protobuf'
             'git')
checkdepends=('python-arro3-core'
              'python-nanoarrow'
              'python-numpy'
              'python-pytest-asyncio'
              'python-pytest-timeout'
              'python-pytest')
options=('!lto')
source=("$_name::git+$url.git#tag=$pkgver"
        "git+https://github.com/apache/arrow-testing.git#commit=5bab2f264a23f5af68f69ea93d24ef1e8e77fc88"
        "git+https://github.com/apache/parquet-testing.git#commit=e13af117de7c4f0a4d9908ae3827b3ab119868f3")
sha256sums=('226a7208430a455aebd510a51e79dc0dc9269a3a629188ba41c9232485be7c09'
            '2bd54336f1a7c8dcef3bd73678d14e705df432b1decfb3369cdaed3e85b50d6c'
            '3d01d5a56e689507fadd04b5ea3d08b7467b89a0b4bdb045894bb9eef2875334')

prepare() {
  cd "$_name"
  # Remove stale build artifacts
  git clean -dfx
  git submodule init testing parquet
  git config submodule.testing.url "$srcdir"/arrow-testing
  git config submodule.parquet.url "$srcdir"/parquet-testing
  git -c protocol.file.allow=always submodule update testing parquet
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
}

build() {
  cd "$_name"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --import-mode=importlib
  )
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}"
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
