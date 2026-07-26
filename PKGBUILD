# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=jcodemunch-mcp
_pkgname=jcodemunch_mcp
pkgver=1.108.184
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
source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname::1}/$pkgname/$_pkgname-$pkgver.tar.gz"
  use-installed-binary.patch
)
sha256sums=('a1291ad0aade1a8634eed9bf5e175c4e15ad705c9f74a29c710a409b22fede9d'
            'be3cfbcec8e4008d967ac9d5ebf7015c5eb7739381d5fe2976060961be6fbef0')

prepare() {
  cd "$_pkgname-$pkgver"
  # `jcodemunch-mcp init` otherwise writes MCP/`claude mcp add` configs that
  # launch the server via `uvx jcodemunch-mcp`. uvx isn't a dependency (and may
  # be absent), and even when present it fetches a separate copy from PyPI
  # instead of this installed package. Point the configs at the installed binary.
  patch -Np1 -i "$srcdir/use-installed-binary.patch"
}

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
