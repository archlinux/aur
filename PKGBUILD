# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-tritonclient
pkgver=2.72.0
pkgrel=1
_commit=77e666d5235234d9ed61fa82165adbaf216dc0d8
pkgdesc='Python client libraries for NVIDIA Triton Inference Server (HTTP/gRPC)'
arch=('any')
url='https://github.com/triton-inference-server/client'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-numpy>=1.19.1'
  'python-rapidjson>=0.9.1'
  'python-urllib3>=2.0.7'
  'python-ml-dtypes<0.7'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-grpcio-tools'
  'git'
)
checkdepends=(
  'python-aiohttp'
  'python-geventhttpclient'
  'python-greenlet'
  'python-grpcio'
  'python-protobuf'
  'python-packaging'
  'python-pytest'
)
optdepends=(
  'python-aiohttp: asynchronous HTTP client (upstream supports versions below 4)'
  'python-geventhttpclient: synchronous HTTP client (version 2.3.3 or newer)'
  'python-greenlet: synchronous HTTP client'
  'python-grpcio: gRPC client (version 1.81.1 or newer)'
  'python-protobuf: gRPC client'
  'python-packaging: gRPC client'
  'python-cuda: CUDA shared-memory utilities'
  'python-setuptools: CUDA shared-memory utilities'
)
source=("git+https://github.com/triton-inference-server/client.git#commit=${_commit}"
        'tritonclient-workflow.py')
sha256sums=('SKIP'
            'd3fa1c1c07c8319ed87d4fc5cb95d33f351244e40f0dfa3227b75102efd55ad1')

pkgver() {
  echo "$pkgver"
}

prepare() {
  cd client/src/python/library
  # Exercise these Arch versions in check(): BF16 serialization, locally
  # generated gRPC stubs, and 100 actual HTTP request/teardown cycles. The
  # latter specifically guards the teardown regression behind the greenlet pin.
  sed -i 's/ml_dtypes<=0.5.4/ml_dtypes<0.7/' requirements/requirements.txt
  sed -i 's/greenlet<3.4.0/greenlet<3.6/' requirements/requirements_http.txt
  sed -i 's/protobuf>=6.30.0,<7.0/protobuf>=6.30.0,<8.0/' requirements/requirements_grpc.txt
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

  # Avoid installing the upstream test suite as a generic top-level "tests"
  # package and its duplicate license as /usr/LICENSE.txt.
  sed -i \
    -e 's/packages=find_packages()/packages=find_packages(exclude=("tests", "tests.*"))/' \
    -e '/^    data_files=data_files,$/d' \
    setup.py
}

build() {
  cd client/src/python/library
  export VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd client/src/python/library
  local _site_packages
  local _test_root="${srcdir}/test-install"
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  rm -rf "${_test_root}"
  trap 'rm -rf "${_test_root}"' RETURN
  python -m installer --destdir="${_test_root}" dist/*.whl

  cd "${srcdir}"
  PYTHONPATH="${_test_root}${_site_packages}" \
    python -m pytest -q --import-mode=importlib \
      client/src/python/library/tests/test_shared_memory.py \
      client/src/python/library/tests/test_inference_server_client.py

  TRITONCLIENT_EXPECTED_VERSION="${pkgver}" \
  TRITONCLIENT_STAGED_ROOT="${_test_root}" \
  PYTHONPATH="${_test_root}${_site_packages}" \
    python - <<'PY'
import asyncio
import os
from importlib.metadata import version
from pathlib import Path

import ml_dtypes
import numpy as np
import tritonclient
from tritonclient.grpc import (
    InferInput as GrpcInferInput,
    InferenceServerClient as GrpcClient,
    service_pb2,
)
from tritonclient.grpc.aio import InferenceServerClient as AsyncGrpcClient
from tritonclient.http import (
    InferInput as HttpInferInput,
    InferenceServerClient as HttpClient,
)
from tritonclient.http.aio import InferenceServerClient as AsyncHttpClient

staged_root = Path(os.environ["TRITONCLIENT_STAGED_ROOT"]).resolve()
assert Path(tritonclient.__file__).resolve().is_relative_to(staged_root)
assert version("tritonclient") == os.environ["TRITONCLIENT_EXPECTED_VERSION"]

tensor = np.array([1.0, 2.0], dtype=ml_dtypes.bfloat16)
http_input = HttpInferInput("INPUT0", [2], "BF16")
http_input.set_data_from_numpy(tensor)
assert http_input._get_binary_data() == tensor.tobytes()

grpc_input = GrpcInferInput("INPUT0", [2], "BF16")
grpc_input.set_data_from_numpy(tensor)
assert grpc_input._get_content() == tensor.tobytes()

request = service_pb2.ModelInferRequest(model_name="offline-smoke")
request.inputs.add(name="INPUT0", datatype="BF16", shape=[2])
round_trip = service_pb2.ModelInferRequest.FromString(request.SerializeToString())
assert round_trip.model_name == "offline-smoke"

for _ in range(25):
    with HttpClient("localhost:8000"):
        pass
with GrpcClient("localhost:8001"):
    pass


async def async_client_smoke():
    http_client = AsyncHttpClient("localhost:8000")
    await http_client.close()
    grpc_client = AsyncGrpcClient("localhost:8001")
    await grpc_client.close()


asyncio.run(async_client_smoke())
PY
  PYTHONPATH="${_test_root}${_site_packages}" \
    python "$srcdir/tritonclient-workflow.py"
}

package() {
  cd client/src/python/library
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/client/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
