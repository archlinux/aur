# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyqwest
pkgname=python-$_name
pkgver=0.11.0
pkgrel=1
pkgdesc='A modern, high-performance HTTP client for Python and Rust.'
arch=('x86_64' 'aarch64')
url='https://github.com/curioswitch/pyqwest'
license=('MIT')
depends=('python'
         'python-opentelemetry-api'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-uv-build'
             'python-build'
             'python-installer'
             'python-wheel'
             'clang'
             'git')
checkdepends=('python-aiohttp'
              'python-anyio'
              'python-asgiref'
              'python-brotli'
              'python-httpx'
              'python-h2'
              'python-niquests'
              'python-opentelemetry-test-utils'
              'python-outcome'
              'python-pytest'
              'python-pytest-benchmark'
              'python-pytest-order'
              'python-sniffio'
              'python-trio'
              'python-trustme'
              'python-uvloop'
              'python-zstd'
              'python-envoy-server'
              'python-find_libpython'
              'python-yaml')
options=(!lto)
source=("$_name::git+$url.git#tag=v$pkgver"
        "pyvoy::git+https://github.com/curioswitch/pyvoy.git")
sha256sums=('b7df9e262e221fbe3b7893b7184c263b9bf0d8858d3de88534f601fdbc503dc4'
            'SKIP')

prepare() {
  cd "$srcdir"/pyvoy
  git checkout --quiet "$(git tag -l 'v*' --sort=-v:refname | head -1)"
}

build() {
  cd "$srcdir"/$_name
  RUSTFLAGS="$RUSTFLAGS --cfg reqwest_unstable --cfg tokio_unstable" python -m build --wheel --no-isolation
  cd "$srcdir"/pyvoy
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "$srcdir"/pyvoy/dist/*.whl
  cp test-env/lib/python3*/site-packages/$_name/_$_name.*.so $_name/
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
