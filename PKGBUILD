# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openai-agents
pkgname=python-$_name
pkgver=0.24.0
pkgrel=1
pkgdesc="OpenAI Agents SDK."
arch=('any')
url='https://github.com/openai/openai-agents-python'
license=('MIT')
depends=('python'
         'python-openai'
         'python-pydantic'
         'python-griffelib'
         'python-typing_extensions'
         'python-requests'
         'python-websockets'
         'python-mcp'
         'python-httpx2'
         'python-pyjwt'
         'python-python-multipart'
         'python-starlette'
         'python-urllib3')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock'
              'python-pytest-xdist'
              'mkdocs'
              'python-pymdown-extensions'
              'python-inline-snapshot'
              'python-graphviz'
              'python-fastapi'
              'python-aiosqlite'
              'python-cryptography'
              'python-fakeredis'
              'python-dapr'
              'python-aiohttp'
              'python-protobuf'
              'python-grpcio'
              'python-pymongo'
              'python-twilio'
              'python-numpy'
              'litellm'
              'python-filelock'
              'python-sqlalchemy'
              'python-greenlet'
              'python-redis'
              'python-docker'
              'python-e2b'
              'python-h2'
              'python-pygments'
              'python-runloop_api_client'
              'python-vercel-sandbox'
              'python-cbor2'
              'git')
optdepends=('python-numpy: voice'
            'python-websockets: voice'

            'python-graphviz: viz'

            'litellm: litellm'
            'python-aiohttp: litellm'
            'python-filelock: litellm'

            'python-any-llm-sdk: any-llm'
            'python-pygments: any-llm'

            'python-websockets: realtime'

            'python-sqlalchemy: sqlalchemy'
            'python-greenlet: sqlalchemy'
            'python-asyncpg: sqlalchemy'

            'python-cryptography: encrypt'

            'python-redis: redis'

            'python-dapr: dapr'
            'python-grpcio: dapr'
            'python-aiohttp: dapr'
            'python-protobuf: dapr'

            'python-pymongo: mongodb'

            'python-docker: docker'

            'python-blaxel: blaxel'
            'python-aiohttp: blaxel'

            'python-daytona: daytona'
            'python-aiohttp: daytona'
            'python-protobuf: daytona'

            'python-aiohttp: cloudflare'

            'python-e2b: e2b'
            'python-e2b-code-interpreter: e2b'
            'python-h2: e2b'
            'python-protobuf: e2b'
            'python-pygments: e2b'

            'python-modal: modal'
            'python-aiohttp: modal'
            'python-cbor2: modal'
            'python-h2: modal'
            'python-protobuf: modal'
            'python-pygments: modal'

            'python-runloop_api_client: runloop'

            'python-vercel-sandbox: vercel'
            'python-cbor2: vercel'

            'python-boto3: s3'

            'python-temporalio: temporal'
            'python-textual: temporal'
            'python-protobuf: temporal'
            'python-pygments: temporal')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'worker-os.patch')
sha256sums=('ac86357b9453d84a20565f2e80ba29df441e37a2f12a1b1c18d0be51109748de'
            '747579a1b48742e083e716991c7cc4d9c9d15cb0ea86b0dbb5c32361be38c150')

prepare() {
  cd "$_name-python-$pkgver"
  # pytest 9.2 builds test ids from string parameters, which calls the overridden __len__
  sed -i 's|_BlockedMessageStringSubclass("custom")\]|pytest.param(_BlockedMessageStringSubclass("custom"), id="string-subclass")]|' tests/test_run_config.py
  # Give the worker tests their own copy of os, as pytest 9.2's output capture calls the os.fstat they replace
  patch -Np1 -i ../worker-os.patch
}

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-python-$pkgver"
  local wheel
  wheel=$(ls dist/*.whl)
  bsdtar -xf "$wheel" -C src '*.dist-info/*'
  PYTHONPATH=$PWD/src OPENAI_API_KEY=fake-for-tests pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
