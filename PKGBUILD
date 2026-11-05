# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyvoy
pkgname=python-$_name
pkgver=1.4.0
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
source=("$_name::git+$url.git#tag=v$pkgver"
        "kosoku::git+https://github.com/curioswitch/kosoku.git")
sha256sums=('01a9141359fa98ae788e7cc1ee064736f1f96b340333b932ae3238367fa58b28'
            'SKIP')

prepare() {
  cd "$_name"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
  # Tests expect RemoteProtocolError from newer pyqwest, same as upstream fix in curioswitch/pyvoy#322
  sed -i 's/\bReadError\b/RemoteProtocolError/g' tests/test_kitchensink.py
  cd ../kosoku
  git checkout --quiet "$(git tag -l 'v*' --sort=-v:refname | head -1)"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' pyproject.toml
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
  cd ../kosoku
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "$srcdir"/kosoku/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
