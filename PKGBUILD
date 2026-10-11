# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=pyvoy
pkgname=python-$_name
pkgver=1.3.0
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
             'python-wheel'
             'clang'
             'git')
checkdepends=('python-anyio'
              'python-pytest'
              'python-pytest-asyncio'
              'python-trio'
              'python-trustme'
              'python-websockets')
source=("$_name::git+$url.git#tag=v$pkgver"
        "kosoku::git+https://github.com/curioswitch/kosoku.git")
sha256sums=('6a4cbbb61306f23637fc72c5466192d9a41213c51bd5f75ab119d3d591171f4d'
            'SKIP')

prepare() {
  cd "$srcdir"/$_name
  # Tests expect RemoteProtocolError from newer pyqwest, same as upstream fix in curioswitch/pyvoy#322
  sed -i 's/\bReadError\b/RemoteProtocolError/g' tests/test_kitchensink.py
  cd "$srcdir"/kosoku
  git checkout --quiet "$(git tag -l 'v*' --sort=-v:refname | head -1)"
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
  cd "$srcdir"/kosoku
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
  test-env/bin/python -m installer "$srcdir"/kosoku/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
