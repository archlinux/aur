# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=jcodemunch-mcp
_pkgname=jcodemunch_mcp
pkgver=1.108.317
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
sha256sums=('80563ed16e473c1e4a29df81a6936b5794cf8a4fa7685a0cda3d107b9061ff93'
            'e02de7f798b232c1e373066d83d8fa0c801c539bf25cc423b2b2383080f17e1c')

prepare() {
  cd "$_pkgname-$pkgver"
  # Normalize upstream source and patch so applying it is independent of the
  # archive's line-ending style. Upstream has shipped both CRLF and LF here.
  sed -i 's/\r$//' src/jcodemunch_mcp/cli/init.py
  sed -i 's/\r$//' "$srcdir/use-installed-binary.patch"

  # `jcodemunch-mcp init` otherwise writes MCP/`claude mcp add` configs that
  # launch the server via `uvx jcodemunch-mcp`. uvx isn't a dependency (and may
  # be absent), and even when present it fetches a separate copy from PyPI
  # instead of this installed package. Point the configs at the installed binary.
  patch -Np1 -i "$srcdir/use-installed-binary.patch"

  # Post-condition, not paranoia: upstream keeps ADDING clients (1.108.315 added
  # a VS Code writer), and each new one arrives hardcoded to uvx. The patch can
  # only fix the sites that existed when it was written, and a new site is
  # invisible -- the build stays green and the bad config only shows up on a
  # user's machine. Assert that no launch site survives, so that lands here.
  local leftover
  leftover=$(grep -n '"uvx"' src/jcodemunch_mcp/cli/init.py || true)
  if [[ -n $leftover ]]; then
    echo "==> ERROR: unpatched uvx launch site(s) in init.py:" >&2
    echo "$leftover" >&2
    echo "==> Update use-installed-binary.patch to cover them." >&2
    return 1
  fi
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
