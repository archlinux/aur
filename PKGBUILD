# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai
pkgver=0.41.0
pkgrel=2
pkgdesc="Context optimization layer for LLM applications - cut token costs by 50-90%"
arch=('x86_64')
url="https://github.com/chopratejas/headroom"
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-tiktoken'
  'python-pydantic'
  'python-click'
  'python-rich'
  'python-opentelemetry-api'
  'python-yaml'
  'python-tomlkit'
  'python-truststore'
  'ast-grep'
  'litellm'
)
makedepends=('rust' 'maturin' 'python-installer')
# The abi3 wheel's stripped _core.abi3.so leaves a dangling build-id debug
# symlink (named after the cpython-314 .so that never gets installed).
options=('!debug')
optdepends=(
  'python-fastapi: required by headroom proxy and wrap'
  'uvicorn: required by headroom proxy and wrap'
  'python-httpx: required by headroom proxy and wrap'
  'python-h2: required by headroom proxy and wrap'
  'python-openai: required by headroom proxy and wrap'
  'python-orjson: required by headroom proxy and wrap'
  'python-mcp: required by headroom proxy and wrap'
  'python-magika: required by headroom proxy and wrap'
  'python-zstandard: required by headroom proxy and wrap'
  'python-websockets: required by headroom proxy and wrap'
  'python-onnxruntime: required by headroom proxy and wrap (any provider, e.g. python-onnxruntime-cpu)'
  'python-watchdog: live code-graph reindexing (--code-graph)'
  'python-sqlite-vec: vector index for --memory'
  'python-transformers: required by headroom proxy and wrap'
  'python-tree-sitter-language-pack: AST-based code compression'
  'python-numpy: relevance scoring, evals, and memory adapters'
  'python-datasets: evaluation and voice training datasets'
  'python-huggingface-hub: Kompress model downloads'
  'python-hnswlib: HNSW vector memory adapter'
)
source=("https://files.pythonhosted.org/packages/source/h/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('b24e6b33becfa767d7b82bce02b9ca06f05ce2a3daf1392f8e591947a9c5bf28')

build() {
  cd "${pkgname//-/_}-$pkgver"
  # ring 0.17.14 fails to link under Arch's default LTO settings (undefined
  # references to ring_core_0_17_14__* symbols); disable LTO for the C/C++
  # bits it pulls in via cc-rs.
  # PYO3_USE_ABI3_FORWARD_COMPATIBILITY: the bundled PyO3 0.22 supports up to
  # cp313, but Arch ships Python 3.14; this flag suppresses the cap check.
  CFLAGS+=" -fno-lto" CXXFLAGS+=" -fno-lto" \
    PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1 \
    maturin build --release --strip --interpreter python3
}

package() {
  cd "${pkgname//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" target/wheels/*.whl
}
