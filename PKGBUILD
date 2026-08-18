# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-$_name
pkgver=0.20.0
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
depends=('python' 'python-openai' 'python-pydantic' 'python-griffelib' 'python-typing_extensions' 'python-requests' 'python-websockets' 'python-mcp')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-xdist' 'python-inline-snapshot' 'python-graphviz' 'python-fastapi' 'python-aiosqlite' 'python-cryptography' 'python-fakeredis'  'python-pymongo' 'litellm' 'python-sqlalchemy' 'python-docker' 'python-runloop_api_client')
optdepends=('python-numpy: voice' 'python-websockets: voice'
            'python-graphviz: viz'
            'litellm: litellm'
            'python-any-llm-sdk: any-llm'
            'python-websockets: realtime'
            'python-sqlalchemy: sqlalchemy' 'python-asyncpg: sqlalchemy'
            'python-cryptography: encrypt'
            'python-redis: redis'
            'python-dapr: dapr' 'python-grpcio: dapr'
            'python-pymongo: mongodb'
            'python-docker: docker'
            'python-blaxel: blaxel' 'python-aiohttp: blaxel'
            'python-daytona: daytona'
            'python-aiohttp: cloudflare'
            'python-e2b: e2b' 'python-e2b-code-interpreter: e2b'
            'python-modal: modal'
            'python-runloop_api_client: runloop'
            'python-vercel: vercel'
            'python-boto3: s3'
            'python-temporalio: temporal' 'python-textual: temporal')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d26ef0a56a1f6bc8edb05a53bfb3aa27ec2f18da1b0c83ea6431626f9d9931d')

build() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-python-$pkgver
  local wheel
  wheel=$(ls dist/*.whl)
  bsdtar -xf "$wheel" -C src '*.dist-info/*'
  PYTHONPATH=$PWD/src OPENAI_API_KEY=fake-for-tests pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
