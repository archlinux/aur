# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyqwest
pkgname=python-$_name
pkgver=0.14.0
pkgrel=1
pkgdesc='A modern, high-performance HTTP client for Python and Rust.'
arch=('x86_64' 'aarch64')
url='https://github.com/curioswitch/pyqwest'
license=('MIT')
depends=('python'
         'python-opentelemetry-api'
         'zstd'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'clang'
             'git')
checkdepends=('python-aiohttp'
              'python-aiodns'
              'python-anyio'
              'python-asgiref'
              'python-brotli'
              'python-httpx'
              'python-h2'
              'python-opentelemetry-test-utils'
              'python-outcome'
              'python-pytest'
              'python-pytest-benchmark'
              'python-pytest-order'
              'python-sniffio'
              'python-trio'
              'python-trustme'
              'python-uvloop'
              'python-envoy-server'
              'python-find_libpython'
              'python-yaml')
options=(!lto)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "pyvoy::git+https://github.com/curioswitch/pyvoy.git")
sha256sums=('b3b5d35a05420d05f1c1cff97a0e357929d73a90dd9219dfc7bad976f4ee4e07'
            'SKIP')

prepare() {
  cd "$_name-$pkgver"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
  # Use the standard library compression.zstd module instead of python-zstd
  sed -i 's/^import zstd\b.*/from compression import zstd/' tests/apps/asgi/kitchensink.py tests/apps/wsgi/kitchensink.py
  cd "$srcdir"/pyvoy
  git checkout --quiet "$(git tag -l 'v*' --sort=-v:refname | head -1)"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  RUSTFLAGS="$RUSTFLAGS --cfg reqwest_unstable --cfg tokio_unstable" python -m build --wheel --no-isolation
  cd "$srcdir"/pyvoy
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "$srcdir"/pyvoy/dist/*.whl
  cp test-env/lib/python3*/site-packages/$_name/_$_name.*.so $_name/
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
