# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=connectrpc
pkgname=python-$_name
pkgver=0.12.1
pkgrel=2
pkgdesc='Server and client runtime library for Connect RPC.'
arch=('any')
url='https://github.com/connectrpc/connect-py'
license=('Apache-2.0')
depends=('python'
         'python-protobuf-py'
         'python-pyqwest')
makedepends=('python-uv-build'
             'python-build'
             'python-installer')
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
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acc4373a5c26d8fd150a2bc97d408e6573e9179c34c22c88eb60f9d41ec2c167')

prepare() {
  cd "connect-py-$pkgver"
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.12.0,<0.13.0/uv_build/' pyproject.toml example/pyproject.toml
  # Import the well-known type modules from protobuf.wkt.google.protobuf, protobuf-py 0.7.0 no longer re-exports them from protobuf.wkt
  sed -i 's/^from protobuf\.wkt import \(([[:space:]]*$\|[a-z_]*_pb\)/from protobuf.wkt.google.protobuf import \1/' src/$_name/_codec.py src/$_name/_gen/google/rpc/status_pb.py test/$_name/example/haberdasher_pb.py
}

build() {
  cd "connect-py-$pkgver"
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation example
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
  test-env/bin/python -P -m pytest "${pytest_options[@]}" test
}

package() {
  cd "connect-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
