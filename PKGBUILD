# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-ouroboros-ai
_name=${pkgname#python-}
pkgver=0.50.6
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
sha256sums=('9739babd8e0c2ff7e66895031511b24bef42d4240ede8e1018ddd3315e2fb720')
install=${pkgname}.install

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  sed -i '1c#!/usr/bin/python' \
    "$pkgdir/usr/bin/ooo" \
    "$pkgdir/usr/bin/ouroboros" \
    "$pkgdir/usr/bin/ozo"

  # Shell completions
  local _site_packages
  _site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib", vars={"base": "/usr", "platbase": "/usr"}))')
  export PYTHONPATH="$pkgdir$_site_packages"
  local _ouroboros="$pkgdir/usr/bin/ouroboros"
  python "$_ouroboros" --show-completion bash > ouroboros.bash
  python "$_ouroboros" --show-completion zsh > _ouroboros
  python "$_ouroboros" --show-completion fish > ouroboros.fish
  install -Dm644 ouroboros.bash \
    "$pkgdir/usr/share/bash-completion/completions/ouroboros"
  install -Dm644 _ouroboros \
    "$pkgdir/usr/share/zsh/site-functions/_ouroboros"
  install -Dm644 ouroboros.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ouroboros.fish"
}
