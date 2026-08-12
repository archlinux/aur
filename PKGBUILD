# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=headroom-ai
pkgver=0.34.0
pkgrel=1
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
  'ast-grep'
  'litellm'
)
makedepends=('rust' 'maturin' 'python-installer')
# The abi3 wheel's stripped _core.abi3.so leaves a dangling build-id debug
# symlink (named after the cpython-314 .so that never gets installed).
options=('!debug')
optdepends=(
  'python-fastapi: proxy server support'
  'uvicorn: proxy server support'
  'python-httpx: proxy server with HTTP/2'
  'python-openai: OpenAI API format support'
  'python-tree-sitter-language-pack: AST-based code compression'
  'python-numpy: relevance scoring, evals, and memory adapters'
  'python-datasets: evaluation and voice training datasets'
  'python-huggingface-hub: Kompress model downloads'
  'python-transformers: HuggingFace tokenizers and Kompress compression'
  'python-hnswlib: HNSW vector memory adapter'
)
source=("https://files.pythonhosted.org/packages/source/h/$pkgname/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('188e81eb1b9497e8518fe491a9fcd79f2e15f5e20f8c5053d63ae09cd63c49fb')

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
