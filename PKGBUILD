# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=connectrpc
pkgname=python-$_name
pkgver=0.12.1
pkgrel=1
pkgdesc='Server and client runtime library for Connect RPC.'
arch=('any')
url='https://github.com/connectrpc/connect-py'
license=('Apache-2.0')
depends=('python'
         'python-protobuf-py'
         'python-pyqwest')
makedepends=('python-uv-build'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-flask'
              'python-starlette'
              'python-brotli'
              'python-grpcio'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-timeout'
              'python-pyvoy'
              'python-zstandard'
              'python-protobuf')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('bb8c564ac18b24e0c3c209b52e702c0c916f53958756d6dde8723faf7490e9c5')

prepare() {
  cd "$srcdir"/$_name
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.12.0,<0.13.0/uv_build/' pyproject.toml example/pyproject.toml
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation example
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer example/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" test
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
