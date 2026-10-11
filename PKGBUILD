# Maintainer: Xuelin Yang <xuelin@adamanteye.cc>
pkgname=zotero-mcp-server
_srcname=zotero_mcp_server
pkgver=0.14.1
pkgrel=1
pkgdesc="A Model Context Protocol server for Zotero"
arch=('any')
url='https://github.com/54yyyu/zotero-mcp'
license=('MIT' 'AGPL-3.0-or-later')
depends=(
	'python>=3.10'
	'python-bibtexparser1>=1.4'
	'python-dotenv>=1.0.0'
	'python-fastmcp-slim>=2.14.0'
	# FastMCP 4 requires MCP 2; keep compatibility with Arch's MCP 1 SDK.
	'python-fastmcp-slim<4'
	'python-httpx>=0.27'
	'python-markdown-it-py>=2.2'
	'python-markdownify>=1.2'
	'python-pdf-inspector=0.2.6'
	'python-pydantic>=2.0.0'
	'python-pyzotero>=1.14.0'
	'python-requests>=2.28.0'
	'python-unidecode>=1.3.0'
)
makedepends=(
	'python-build'
	'python-hatchling'
	'python-installer'
	'python-wheel'
)
optdepends=(
	'zotero: local Zotero desktop library access'
	'python-chromadb: semantic search vector database support'
	'python-sentence-transformers: local semantic embeddings'
	'python-openai: OpenAI semantic embeddings'
	'python-google-genai: Gemini semantic embeddings'
	'python-tiktoken: semantic search token counting'
	'python-pymupdf: PDF outline extraction'
	'python-ebooklib: EPUB annotation support'
)
# The release sdist includes the built Zotero Agent plugin omitted from git tags.
source=("https://files.pythonhosted.org/packages/source/z/${pkgname}/${_srcname}-${pkgver}.tar.gz")
sha256sums=('556fd517459a287eb5438020fe0c9ad2837ac6db7f646346c64e14854d1fa2d5')

build() {
	cd "$_srcname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcname-$pkgver"
	python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 plugin/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.plugin"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 docs/getting-started.md "$pkgdir/usr/share/doc/$pkgname/getting-started.md"
}
