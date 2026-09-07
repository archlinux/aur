# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-ouroboros-ai
_name=${pkgname#python-}
pkgver=0.54.0
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
  'python-packaging'
  'python-dotenv'
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
  'python-anthropic: Claude integration'
  'python-questionary: Interactive checkbox selector for plugin installation'
  'python-claude-agent-sdk: Claude agent SDK'
  'python-mcp: MCP server support'
  'python-idna: Internationalized hostname support for MCP network transports'
  'python-litellm: LiteLLM support for non-Claude LLM backends'
  'python-textual: TUI support (ouroboros tui)'
  'python-textual-serve: Browser-served settings TUI support (ouroboros config)'
  'python-watchdog: Live skill hot-reload support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('fbea369d0026d90d59b74f61a5ac53c069390dd6330a4a423fd2e659c439f6bb')
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
  export PYTHONPATH="$pkgdir$_site_packages${PYTHONPATH:+:$PYTHONPATH}"
  local _ouroboros="$pkgdir/usr/bin/ouroboros"
  _OUROBOROS_COMPLETE=source_bash python "$_ouroboros" > ouroboros.bash
  _OUROBOROS_COMPLETE=source_zsh python "$_ouroboros" > _ouroboros
  _OUROBOROS_COMPLETE=source_fish python "$_ouroboros" > ouroboros.fish
  install -Dm644 ouroboros.bash \
    "$pkgdir/usr/share/bash-completion/completions/ouroboros"
  install -Dm644 _ouroboros \
    "$pkgdir/usr/share/zsh/site-functions/_ouroboros"
  install -Dm644 ouroboros.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ouroboros.fish"
}
