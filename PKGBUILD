# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=docmancer
pkgname=$_pkgname-git
pkgver=r243.c5c76c6
pkgrel=1
pkgdesc="Fetch docs, embed locally, expose to AI agents via skills"
arch=('any')
url="https://github.com/docmancer/docmancer"
license=('MIT')
depends=(
  'python>=3.11'
  'python-pydantic'
  'python-pydantic-settings'
  'python-httpx'
  'python-click'
  'python-yaml'
  'python-filelock'
  'python-trafilatura'
  'python-markdownify'
  'python-w3lib'
  'python-ultimate-sitemap-parser'
  'python-beautifulsoup4'
  'python-jsonschema'
  'python-sqlite-vec'
  'python-model2vec'
  'python-charset-normalizer'
  'python-pypdf'
  # cli/__main__.py transitively imports docmancer.cloud at startup, which
  # needs these three even when cloud sync is never used
  'python-rfc8785'
  'python-keyring'
  'python-pynacl'
)
# striprtf (RTF loader) is unpackaged on Arch; the loader degrades gracefully without it.
optdepends=(
  'python-pdfplumber: PDF table/layout extraction fallback'
  'python-docx: DOCX ingestion'
  'python-mcp: MCP server (docmancer mcp; pulls starlette + sse-starlette)'
  'python-fastembed: heavy ONNX embeddings provider'
  'python-qdrant-client: qdrant vector store backend'
  'python-playwright: browser extraction'
  'python-datasets: benchmark datasets'
  'python-openai: OpenAI benchmark provider'
  'python-anthropic: Anthropic benchmark provider'
  'python-google-genai: Gemini benchmark provider'
)
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/docmancer/docmancer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  # --no-isolation: build against Arch's hatchling instead of downloading one at
  # build time. Upstream pins hatchling<1.27 (metadata conservatism); the wheel
  # builds and installs correctly with current hatchling, so skip the dep check.
  # Upstream's requires-python <3.14 cap is likewise metadata-only: the package
  # runs on Arch's 3.14 (exercised end-to-end: index, embed, hybrid query).
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
