# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-ouroboros-ai
_name=${pkgname#python-}
pkgver=0.50.0
pkgrel=1
pkgdesc="Specification-first workflow engine for AI coding agents"
arch=('any')
url="https://github.com/Q00/ouroboros"
license=('MIT')
depends=(
  'python'
  'python-aiosqlite'
  'python-anyio'
  'python-click'
  'python-jsonschema'
  'python-prompt_toolkit'
  'python-pydantic'
  'python-yaml'
  'python-rich'
  'python-sqlalchemy'
  'python-structlog'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
)
optdepends=(
  'python-anthropic: Claude integration (recommended if using Claude Code)'
  'python-claude-agent-sdk: Claude agent SDK (recommended if using Claude Code)'
  'python-mcp: MCP support'
  'python-litellm: LiteLLM support'
  'python-textual: TUI support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('f99f0a566c2791f746c0d6d1729fffb4c8d6a9fee8bc08513919583d8eeb9678')
install=${pkgname}.install

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  # Shell completions
  export PYTHONPATH="$pkgdir/$(python -c 'import site; print(site.getsitepackages()[0])')"
  local _ouroboros="$pkgdir/usr/bin/ouroboros"
  $_ouroboros --show-completion bash | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/ouroboros"
  $_ouroboros --show-completion zsh | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_ouroboros"
  $_ouroboros --show-completion fish | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/ouroboros.fish"
}
