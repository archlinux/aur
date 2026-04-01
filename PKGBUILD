# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=claude-code-api
pkgname=$_pkgname-git
pkgver=r30.b0cc14c
pkgrel=1
pkgdesc="OpenAI-compatible API gateway for Claude Code CLI"
arch=('any')
url="https://github.com/codingworkflow/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.11'
  'python-fastapi'
  'uvicorn'
  'python-pydantic'
  'python-pydantic-settings'
  'python-httpx'
  'python-aiofiles'
  'python-structlog'
  'python-multipart'
  'python-sqlalchemy'
  'python-greenlet'
  'python-aiosqlite'
  'python-alembic'
  'python-passlib'
  'python-jose'
  'python-dotenv'
  'python-openai'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/codingworkflow/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Replace entry point with XDG-compliant wrapper
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<'WRAPPER'
#!/bin/bash
# XDG-compliant wrapper for claude-code-api
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"
: "${XDG_STATE_HOME:=$HOME/.local/state}"

_conf="$XDG_CONFIG_HOME/claude-code-api"
_data="$XDG_DATA_HOME/claude-code-api"
_state="$XDG_STATE_HOME/claude-code-api"

mkdir -p "$_data" "$_state/sessions" "$_state/logs"

: "${CLAUDE_CODE_API_ENV_FILE:=$_conf/env}"
: "${DATABASE_URL:=sqlite:///$_data/claude_api.db}"
: "${PROJECT_ROOT:=$_data/projects}"
: "${SESSION_MAP_PATH:=$_state/sessions/session_map.json}"
: "${LOG_FILE_PATH:=$_state/logs/claude-code-api.log}"

export CLAUDE_CODE_API_ENV_FILE DATABASE_URL PROJECT_ROOT SESSION_MAP_PATH LOG_FILE_PATH

exec python -m uvicorn claude_code_api.main:app \
  --host "${HOST:-0.0.0.0}" \
  --port "${PORT:-8000}" \
  "$@"
WRAPPER
}
