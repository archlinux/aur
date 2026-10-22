# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=docmancer
pkgname=$_pkgname-git
pkgver=r243.c5c76c6
pkgrel=2
pkgdesc="One local memory shared by every coding agent on your machine"
arch=('any')
url="https://github.com/docmancer/docmancer"
license=('MIT')
# follows upstream's Requires-Dist except pdfplumber and striprtf (not in the
# official repos or [xnf4-aur]); zstandard is also loaded at CLI startup
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
  'python-rfc8785'
  'python-keyring'
  'python-pynacl'
  'python-docx'
  'python-mcp'
  'python-starlette'
  'python-sse-starlette'
  'uvicorn'
  'python-zstandard'
  'python-tomli-w'
)
optdepends=(
  'python-pdfplumber: PDF table/layout extraction fallback'
  'python-striprtf: RTF ingestion'
  'python-fastembed: heavy ONNX embeddings provider'
  'python-qdrant-client: qdrant vector store backend'
  'python-playwright: browser extraction'
  'python-openai: OpenAI embeddings provider'
  'python-cohere: Cohere embeddings provider'
  'python-crawl4ai: crawl4ai extraction'
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
