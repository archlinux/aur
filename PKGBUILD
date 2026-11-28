# Maintainer: Smoolak <smoolak@gmail.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=lancedb
pkgname=python-$_name
pkgver=0.41.0
pkgrel=2
pkgdesc='Serverless, low-latency vector database for AI applications'
arch=('x86_64' 'aarch64')
_repo='https://github.com/lancedb/lancedb'
url="$_repo/tree/main/python"
license=('Apache-2.0')
depends=('python'
         'python-deprecation'
         'python-numpy'
         'python-packaging'
         'python-pyarrow'
         'python-pydantic'
         'python-tqdm'
         'python-lance-namespace'
         'zstd'
         'libgcc'
         'glibc')
makedepends=('python-maturin'
             'python-build'
             'python-installer'
             'rust'
             'protobuf')
checkdepends=('python-aiohttp'
              'python-boto3'
              'python-pandas'
              'python-pytest'
              'python-pytest-mock'
              'python-pytest-asyncio'
              'python-duckdb'
              'python-pytz'
              'python-polars'
              'python-pylance'
              'python-requests'
              'python-datafusion'
              'python-opentelemetry-sdk'
              'python-opentelemetry-api'
              'python-pillow')
optdepends=('python-pylance: pylance'

            'python-opentelemetry-api: otel'

            'python-pytorch: clip'
            'python-pillow: clip'
            'python-open-clip-torch: clip'

            'python-pytorch: siglip'
            'python-pillow: siglip'
            'python-transformers: siglip'
            'python-sentencepiece: siglip'

            'python-requests: embeddings'
            'python-openai: embeddings'
            'python-sentence-transformers: embeddings'
            'python-pytorch: embeddings'
            'python-pillow: embeddings'
            'python-open-clip-torch: embeddings'
            'python-cohere: embeddings'
            'python-colpali-engine: embeddings'
            'python-huggingface-hub: embeddings'
            'python-instructorembedding: embeddings'
            'python-google-genai: embeddings'
            'python-boto3: embeddings'
            'aws-cli: embeddings'
            'python-botocore: embeddings'
            'python-ibm-watsonx-ai: embeddings'
            'python-ollama: embeddings'
            'python-sentencepiece: embeddings'

            'python-adlfs: azure')
options=('!debug' '!lto')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e2820bedee7556af2a1194488784a517622cb7c4ead366704e95ea874739358')

prepare() {
  cd "$_name-$pkgver"
  # Use the maturin version shipped by Arch
  sed -i '/^requires = /s/"maturin[<>=!~][^"]*"/"maturin"/' python/pyproject.toml
  # Build for the generic Arch target instead of forcing Haswell CPUs
  sed -i '/target-cpu=haswell/d' .cargo/config.toml
  # Use thin LTO for release builds, fat LTO of the extension runs out of memory on 16 GB builders
  sed -i '/^\[profile.release\]$/,/^\[/s/^lto = "fat"$/lto = "thin"/' .cargo/config.toml
}

build() {
  cd "$_name-$pkgver/python"
  export MATURIN_PEP517_ARGS='--features fp16kernels'
  export ZSTD_SYS_USE_PKG_CONFIG=1
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -m 'not slow and not s3_test'
  )
  cd "$_name-$pkgver/python"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" python/tests
}

package() {
  cd "$_name-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
