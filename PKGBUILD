# Maintainer: Marat Bakeev <hawara[at]gmail[dot]com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=jcodemunch-mcp
_pkgname=jcodemunch_mcp
pkgver=1.108.402
pkgrel=1
pkgdesc="Token-efficient MCP server for source code exploration via tree-sitter AST parsing"
arch=(x86_64 aarch64)
url="https://github.com/jgravelle/jcodemunch-mcp"
license=('LicenseRef-jcodemunch-dual-use' 'MIT')
depends=(
  python
  python-anyio
  python-httpx-sse
  python-jsonschema
  python-pydantic-settings
  python-pyjwt
  python-cryptography
  python-python-multipart
  python-sse-starlette
  python-starlette
  python-typing_extensions
  python-typing-inspection
  uvicorn
  python-httpx
  python-pathspec
  'python-tree-sitter-language-pack>=0.7.0'
  'python-tree-sitter-language-pack<1.0.0'
  python-yaml
)
makedepends=(
  python-build
  python-hatchling
  python-setuptools
  python-uv-dynamic-versioning
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
  mcp-1.30.0.tar.gz::https://files.pythonhosted.org/packages/source/m/mcp/mcp-1.30.0.tar.gz
  tree-sitter-0.25.2.tar.gz::https://files.pythonhosted.org/packages/source/t/tree-sitter/tree-sitter-0.25.2.tar.gz
  tree_sitter_fsharp-0.3.12.tar.gz::https://files.pythonhosted.org/packages/source/t/tree-sitter-fsharp/tree_sitter_fsharp-0.3.12.tar.gz
  check-installed.py
)
sha256sums=('0fab1ad0696ee8e77a4035b7b79557d870adc039b3dbf383441a26c5f867147f'
            'e02de7f798b232c1e373066d83d8fa0c801c539bf25cc423b2b2383080f17e1c'
            '445414625fce5c295faa505bb11bacece661ab6f4028d57c935db57820b7a3e4'
            'fe43c158555da46723b28b52e058ad444195afd1db3ca7720c59a254544e9c20'
            '07759fd4837b226f800cf26ecaf6a58f51365c2cacacf69db4094ff146eac8bd'
            '3fadb2cb1f262169d0f5b2bea3250b6c927d12c863a1e2e7850c50f26e4a7a50')

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

  # The upstream SDK and parser ceilings conflict with the system's newer
  # versions. Load the privately installed compatible copies for all entry
  # points, including `python -m jcodemunch_mcp`.
  sed -i '1a\
import sys as _sys\nfrom pathlib import Path as _Path\n_sys.path.insert(0, str(_Path(__file__).resolve().parents[3] / "jcodemunch-mcp/vendor"))' src/jcodemunch_mcp/__init__.py

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
  local source
  for source in mcp-1.30.0 tree-sitter-0.25.2 tree_sitter_fsharp-0.3.12 "$_pkgname-$pkgver"; do
    (cd "$srcdir/$source" && python -m build --wheel --no-isolation)
  done
}

# Install the supported SDK and parser bindings privately; do not replace the
# system's python-mcp or python-tree-sitter used by other applications.
_install_to() {
  local dest=$1 source site_packages
  site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  python -m installer --destdir="$dest" "$srcdir/$_pkgname-$pkgver"/dist/*.whl
  for source in mcp-1.30.0 tree-sitter-0.25.2 tree_sitter_fsharp-0.3.12; do
    python -m installer --destdir="$dest/private-stage" "$srcdir/$source"/dist/*.whl
  done
  install -d "$dest/usr/lib/jcodemunch-mcp/vendor"
  cp -a "$dest/private-stage/$site_packages/." "$dest/usr/lib/jcodemunch-mcp/vendor/"
  rm -rf "$dest/private-stage"
}

check() {
  local site_packages
  site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  _install_to "$srcdir/test-install"
  PYTHONPATH="$srcdir/test-install/$site_packages" \
    "$srcdir/test-install/usr/bin/jcodemunch-mcp" --help >/dev/null
  PYTHONPATH="$srcdir/test-install/$site_packages" \
    JCODEMUNCH_TEST_BINARY="$srcdir/test-install/usr/bin/jcodemunch-mcp" \
    python "$srcdir/check-installed.py"
}

package() {
  _install_to "$pkgdir"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  local source
  for source in mcp-1.30.0 tree-sitter-0.25.2 tree_sitter_fsharp-0.3.12; do
    install -Dm644 "$srcdir/$source/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/$source/LICENSE"
  done
}
# vim:set ts=2 sw=2 et:
