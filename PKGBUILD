# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Darius Niminenn <root at dnim dot dev>
# Contributor: Sir-Photch <sir-photch@posteo.me>

pkgname=litellm
pkgver=1.106.6
pkgrel=1
pkgdesc='Library to easily interface with LLM API providers.'
arch=('x86_64' 'aarch64')
url='https://github.com/BerriAI/litellm'
license=('MIT')
depends=('python'
         'python-fastuuid'
         'python-filelock'
         'python-httpx'
         'python-h2'
         'python-openai'
         'python-dotenv'
         'python-pyyaml'
         'python-packaging'
         'python-importlib-metadata'
         'python-tiktoken'
         'python-tokenizers'
         'python-huggingface-hub'
         'python-click'
         'python-jinja'
         'python-aiohttp'
         'python-pydantic'
         'python-pydantic-settings'
         'python-jsonschema'
         'python-boto3'
         'python-certifi'
         'python-typing_extensions'
         'glibc'
         'libgcc')
makedepends=('python-maturin'
             'python-build'
             'python-installer')
optdepends=('gunicorn: proxy'
            'uvicorn: proxy'
            'python-granian: proxy'
            'python-uvloop: proxy'
            'python-fastapi: proxy'
            'python-starlette: proxy'
            'python-backoff: proxy'
            'python-pyyaml: proxy'
            'python-rq: proxy'
            'python-orjson: proxy'
            'python-hiredis: proxy'
            'python-apscheduler: proxy'
            'python-fastapi-sso: proxy'
            'python-pyjwt: proxy'
            'python-python-multipart: proxy'
            'python-cryptography: proxy'
            'python-pynacl: proxy'
            'python-websockets: proxy'
            'python-boto3: proxy'
            'python-azure-identity: proxy'
            'python-azure-storage-blob: proxy'
            'python-mcp: proxy'
            'python-httpx2: proxy'
            'python-pydantic: proxy'
            'python-litellm-proxy-extras: proxy'
            'python-litellm-enterprise: proxy'
            'python-restrictedpython: proxy'
            'python-rich: proxy'
            'python-inquirerpy: proxy'
            'python-tomlkit: proxy'
            'python-polars: proxy'
            'python-soundfile: proxy'
            'python-pyroscope-io: proxy'
            'python-expression: proxy'
            
            'python-rich: cli'
            'python-pyyaml: cli'
            'python-requests: cli'
            'python-inquirerpy: cli'
            'python-keyring: cli'
            'python-tomlkit: cli'
            
            'python-prisma: extra_proxy'
            'python-psycopg: extra_proxy'
            'python-azure-identity: extra_proxy'
            'python-azure-keyvault-secrets: extra_proxy'
            'python-google-cloud-kms: extra_proxy'
            'python-google-cloud-iam: extra_proxy'
            'python-resend: extra_proxy'
            'python-redisvl: extra_proxy'
            'python-a2a-sdk: extra_proxy'
            
            'python-numpydoc: utils'
            
            'python-diskcache: caching'

            'python-mcp: mcp'
            'python-httpx2: mcp'
            'python-pydantic: mcp'

            'python-saml: saml'
            
            'python-semantic-router: semantic-router'
            'python-aurelio-sdk: semantic-router'
            
            'python-mlflow: mlflow'
            
            'python-grpcio: grpc'

            'python-google-cloud-speech: stt-vertex-chirp'

            'python-nvidia-riva-client: stt-nvidia-riva'
            'python-soundfile: stt-nvidia-riva'
            'python-audioread: stt-nvidia-riva'
            'python-numpy: stt-nvidia-riva'
            
            'python-google-cloud-aiplatform: google'

            'python-aws-sdk-bedrock-runtime: bedrock-realtime'
            'python-smithy-http: bedrock-realtime'
            'python-awscrt: bedrock-realtime'
            
            'python-google-cloud-aiplatform: proxy-runtime'
            'python-google-cloud-speech: proxy-runtime'
            'python-google-genai: proxy-runtime'
            'python-anthropic: proxy-runtime'
            'python-google-auth: proxy-runtime'
            'python-requests: proxy-runtime'
            'python-grpcio: proxy-runtime'
            'python-prometheus-client: proxy-runtime'
            'python-langfuse: proxy-runtime'
            'python-opentelemetry-api: proxy-runtime'
            'python-opentelemetry-sdk: proxy-runtime'
            'python-opentelemetry-exporter-otlp: proxy-runtime'
            'python-opentelemetry-instrumentation-fastapi: proxy-runtime'
            'python-ddtrace: proxy-runtime'
            'python-sentry_sdk: proxy-runtime'
            'python-mangum: proxy-runtime'
            'python-azure-ai-contentsafety: proxy-runtime'
            'python-azure-storage-file-datalake: proxy-runtime'
            'python-pypdf: proxy-runtime'
            'python-llm-sandbox: proxy-runtime'
            'python-detect-secrets: proxy-runtime')
provides=("python-${pkgname}")
options=(!lto !strip)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64aca892cc25672da099162d2922c8933157b4bd4153a0273b2ec679bc4c3688')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/maturin==[0-9.]*/maturin/g' pyproject.toml
}

build() {
  cd "$pkgname-$pkgver"
  export PYO3_PYTHON=/usr/bin/python
  export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
  export CARGO_PROFILE_RELEASE_LTO=off
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 "README.md" "$pkgdir"/usr/share/doc/$pkgname/README.md
}
