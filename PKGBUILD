# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyvoy
pkgname=python-$_name
pkgver=1.5.0
pkgrel=1
pkgdesc='A Python application server implemented in Envoy.'
arch=('x86_64' 'aarch64')
url='https://github.com/curioswitch/pyvoy'
license=('MIT')
depends=('python'
         'python-envoy-server'
         'python-find_libpython'
         'python-pyqwest'
         'python-yaml'
         'python-uvloop'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'clang'
             'git')
checkdepends=('python-anyio'
              'python-opentelemetry-instrumentation-asgi'
              'python-opentelemetry-proto'
              'python-opentelemetry-sdk'
              'python-pytest'
              'python-pytest-asyncio'
              'python-trio'
              'python-trustme'
              'python-websockets')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "kosoku::git+https://github.com/curioswitch/kosoku.git")
sha256sums=('d0e8dbbf37f0b1584c35ad952963dd2b1687eb02a3cbafe01a7e9cf4ccb1a60b'
            'SKIP')

prepare() {
  cd "$_name-$pkgver"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
  cd "$srcdir"/kosoku
  git checkout --quiet "$(git tag -l 'v*' --sort=-v:refname | head -1)"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
  cd "$srcdir"/kosoku
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
  test-env/bin/python -m installer "$srcdir"/kosoku/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
