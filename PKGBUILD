# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=grpcio-reflection
pkgname=python-$_name
pkgver=1.84.0
pkgrel=1
pkgdesc='Standard Protobuf Reflection Service for gRPC.'
arch=('any')
_repo='https://github.com/grpc/grpc'
url="$_repo/tree/master/src/python/${_name//-/_}"
license=('Apache-2.0')
depends=('python'
         'python-protobuf'
         'python-grpcio')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-grpcio-tools')
checkdepends=('python-coverage'
              'python-pytest')
source=("grpc-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17a4d25717f4871eb71cfdf191f7491f66a59c8ebc782ab53d52fcbfc478959f')

build() {
  cd "grpc-$pkgver"
  python src/python/${_name//-/_}/setup.py preprocess build_package_protos
  python -m build --wheel --no-isolation src/python/${_name//-/_}
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "grpc-$pkgver"
  python -m grpc_tools.protoc -I. --python_out=. src/proto/grpc/testing/empty.proto src/proto/grpc/testing/messages.proto src/proto/grpc/testing/test.proto src/proto/grpc/testing/proto2/empty2.proto src/proto/grpc/testing/proto2/empty2_extensions.proto
  cd src/python/grpcio_tests
  PYTHONPATH="$srcdir/grpc-$pkgver:$PWD:$srcdir/grpc-$pkgver/src/python/${_name//-/_}" pytest "${pytest_options[@]}" tests/reflection tests_aio/reflection
}

package() {
  cd "grpc-$pkgver"
  python -m installer --destdir="$pkgdir" src/python/${_name//-/_}/dist/*.whl
}
