# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=jcodemunch-mcp
_pkgname=jcodemunch_mcp
pkgver=1.108.82
pkgrel=1
pkgdesc="Token-efficient MCP server for source code exploration via tree-sitter AST parsing"
arch=(any)
url="https://github.com/jgravelle/jcodemunch-mcp"
license=('LicenseRef-jcodemunch-dual-use')
depends=(
  python
  python-mcp
  python-httpx
  python-pathspec
  python-tree-sitter-language-pack
  python-yaml
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  'python-tiktoken: accurate token counting (falls back to a heuristic otherwise)'
  'python-anthropic: Anthropic Claude summaries (anthropic extra)'
  'python-openai: OpenAI / Groq / MiniMax / Zhipu summaries (openai/groq extras)'
  'python-google-generativeai: Gemini summaries (gemini extra)'
  'uvicorn: HTTP/SSE transport (http extra)'
  'python-starlette: HTTP/SSE transport (http extra)'
  'python-anyio: HTTP/SSE transport (http extra)'
  'python-watchfiles: file-watching / incremental reindex (watch extra)'
  'python-sentence-transformers: semantic search (semantic extra)'
  'python-keyring: secure API-key storage (keyring extra)'
  'python-rich: rich terminal output (bench extra)'
  'python-jinja: benchmark report rendering (bench extra)'
  'python-pillow: image input for groq-explain extra'
  'python-numpy: voice features (groq-voice extra)'
  'python-sounddevice: voice features (groq-voice extra)'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8b9f6eee2f65a40f8a472d19b7ae5779aeeca72e38a00ec0f0c657f8d71e542f')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  PYTHONPATH="$PWD/tmp_install/$site_packages" \
    PATH="$PWD/tmp_install/usr/bin:$PATH" \
    jcodemunch-mcp --help >/dev/null
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
