# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mistralai
pkgname=python-$_name
pkgver=2.7.2
pkgrel=1
pkgdesc="Python Client SDK for the Mistral AI API."
arch=('any')
url="https://github.com/mistralai/client-python"
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-dateutil' 'python-typing-inspection' 'python-opentelemetry-api' 'python-opentelemetry-semantic-conventions' 'python-jsonpath-python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pyyaml' 'python-msgpack' 'python-opentelemetry-instrumentation-httpx' 'python-opentelemetry-sdk' 'python-opentelemetry-exporter-otlp-proto-http' 'python-pytest' 'python-pytest-asyncio' 'python-mcp' 'python-griffe' 'python-authlib' 'python-websockets' 'python-zstandard' 'python-google-auth')
optdepends=('python-google-auth: gcp' 'python-requests: gcp'
            'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents'
            'python-websockets: realtime'
            'python-opentelemetry-sdk: telemetry' 'python-opentelemetry-exporter-otlp-proto-http: telemetry'
            'python-azure-storage-blob: workflow_payload_offloading_azure' 'python-azure-identity: workflow_payload_offloading_azure' 'python-aiohttp: workflow_payload_offloading_azure'
            'python-gcloud-aio-storage: workflow_payload_offloading_gcs'
            'python-aioboto3: workflow_payload_offloading_s3'
            'python-cryptography: workflow_payload_encryption'
            'python-msgpack: workflow_payload_compression' 'python-zstandard: workflow_payload_compression')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f2aa1bb0ad97e610f56bf57874a52cec4d63cafd86d1c553fe8b83a71f4ad50')

build() {
  cd "$srcdir"/client-python-$pkgver
  python -m build --wheel --no-isolation
}

check(){
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/client-python-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/client-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

