# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=connectrpc
pkgname=python-$_name
pkgver=0.13.0
pkgrel=1
pkgdesc='Server and client runtime library for Connect RPC.'
arch=('any')
url='https://github.com/connectrpc/connect-py'
license=('Apache-2.0')
depends=('python'
         'python-protobuf-py'
         'python-pyqwest'
         'python-typing_extensions')
makedepends=('python-uv-build'
             'python-build'
             'python-installer')
checkdepends=('python-flask'
              'python-starlette'
              'python-asgiref'
              'python-brotli'
              'python-hypercorn'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-timeout'
              'python-trio'
              'python-zstandard'
              'python-protobuf')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd9cc8c51efe27695a8a7041e79f18d8f38f06000833edc309280f1ca92e7ef5')

prepare() {
  cd "connect-py-$pkgver"
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.13.0,<0.14.0/uv_build/' pyproject.toml example/pyproject.toml protoc-gen-connectrpc/pyproject.toml
}

build() {
  cd "connect-py-$pkgver"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation example
  python -m build --wheel --no-isolation protoc-gen-connectrpc
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "connect-py-$pkgver"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer example/dist/*.whl
  test-env/bin/python -m installer protoc-gen-connectrpc/dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" test
}

package() {
  cd "connect-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
