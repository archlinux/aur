# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# The Python environment is bundled because upstream pins a large, partly native
# dependency set. uv's relocatable mode keeps the packaged environment usable
# after makepkg moves it under /opt.
#
# Runtime tools Arch already ships (python, nodejs, uv, ffmpeg, ripgrep, and a
# system Chrome/Chromium) stay as package dependencies. The launcher pins
# AGENT_BROWSER_EXECUTABLE_PATH and disables lazy PM installs so Hermes does not
# download browsers or re-fetch tools that pacman provides.
#
# /opt is root-owned and HERMES_DISABLE_LAZY_INSTALLS=1, so opt-in extras that
# users commonly hit must be preinstalled here. Ship: all + messaging, plus
# anthropic (Anthropic / anthropic_messages proxies), edge-tts + ddgs +
# doc-extract (default TTS / free search / documents), and gateway extensions
# (feishu, matrix, dingtalk, wecom, teams, google-chat). Anything else
# (bedrock, voice, fal, …) needs a rebuild with more --extra flags or a
# writable install — `sudo` + re-packaging, not runtime lazy install.
pkgname=hermes-agent
pkgver=0.21.6
pkgrel=2
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
groups=()
depends=(
    'python>=3.14'
    'nodejs>=22.22'
    'uv'
    'ripgrep'
    'ffmpeg'
    # AUR: agent-browser or agent-browser-bin (Provides agent-browser)
    'agent-browser'
)
optdepends=(
    'chromium: local browser automation (or google-chrome)'
    'google-chrome: local browser automation (or chromium)'
)
# cmake: matrix → mautrix[encryption] → python-olm ships a vendored libolm that
# still declares cmake_minimum_required < 3.5; CMake ≥ 4 refuses that unless
# CMAKE_POLICY_VERSION_MINIMUM is raised (set in build()).
makedepends=('npm' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ba3500cdbe876bb9d347b3c12f41c591a421293eac58faba23571287dfe1cf8')
validpgpkeys=()

build() {
  cd "${pkgname}-${pkgver}"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to read
  # .gitignore files. Creating an empty .git directory stops the scan at this level.
  [ ! -d .git ] && mkdir .git

  npm ci --ignore-scripts --no-fund --no-audit --progress=false --include=dev
  npm run build --workspace web
  npm run build:ink --workspace ui-tui
  npm run build --workspace ui-tui

  UV_PYTHON_DOWNLOADS=never uv venv \
    --python /usr/bin/python3 \
    --relocatable \
    --clear \
    venv

  # python-olm (matrix) + other sdists; keep downloads off system Python.
  CMAKE_POLICY_VERSION_MINIMUM=3.5 \
  UV_PYTHON_DOWNLOADS=never \
    UV_PROJECT_ENVIRONMENT="$PWD/venv" \
    uv sync --frozen --no-dev --no-install-project \
      --extra all \
      --extra messaging \
      --extra anthropic \
      --extra edge-tts \
      --extra ddgs \
      --extra doc-extract \
      --extra feishu \
      --extra matrix \
      --extra dingtalk \
      --extra wecom \
      --extra teams \
      --extra google-chat
}

check() {
  cd "${pkgname}-${pkgver}"

  test -s hermes_cli/web_dist/index.html
  test -s ui-tui/dist/entry.js
  PYTHONPATH="$PWD" venv/bin/python -c \
    'import hermes_cli.main, anthropic, edge_tts, ddgs, lark_oapi, mautrix, defusedxml'
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install to /opt
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"

  # Copy application files (bsdtar; avoids an rsync makedepend)
  bsdtar -C . -cf - \
    --exclude='__pycache__' --exclude='.git' \
    --exclude='node_modules' --exclude='web/src' \
    --exclude='web/package.json' --exclude='web/package-lock.json' \
    --exclude='web/vite.config.ts' --exclude='web/tsconfig*.json' \
    --exclude='web/eslint.config.js' --exclude='web/README.md' \
    --exclude='ui-tui/src' --exclude='ui-tui/node_modules' \
    --exclude='scripts/tests' --exclude='scripts/install.*' \
    --exclude='build' \
    . | bsdtar -C "$_optdir" -xf -

  echo "console.log('skipping build, using prebuilt dist/entry.js')" > "$_optdir/ui-tui/scripts/build.mjs"

  # Ship the prebuilt TUI into hermes_cli/tui_dist/ so that
  # _find_bundled_tui() finds it and skips the npm install step (which
  # would fail with EACCES on the root-owned /opt tree).
  # Note: hermes_cli is imported from /opt/hermes-agent/hermes_cli/ via
  # the .pth file, NOT from the venv site-packages, so we copy there.
  _tuidir="$_optdir/hermes_cli/tui_dist"
  install -d "$_tuidir"
  if [ -d "ui-tui/dist" ]; then
    cp -a ui-tui/dist/* "$_tuidir/"
  fi

  install -d "$_optdir/venv/lib/python3.14/site-packages"
  {
      echo "import sys; sys.path.insert(0, \"/opt/$pkgname\")"
  } > "$_optdir/venv/lib/python3.14/site-packages/hermes.pth"

  install -d "$pkgdir/usr/bin"
  {
    echo '#!/bin/bash'
    echo 'unset PYTHONPATH'
    echo 'unset PYTHONHOME'
    echo ': "${XDG_DATA_HOME:=$HOME/.local/share}"'
    # Root-owned /opt must not grow a PM store; Arch packages supply tools.
    echo 'export HERMES_DISABLE_LAZY_INSTALLS=1'
    echo 'export HERMES_LAZY_INSTALL_TARGET="$XDG_DATA_HOME/hermes-agent/python"'
    # Prefer system Chrome/Chromium — blocks PM Chromium auto-download.
    echo 'if [[ -z "${AGENT_BROWSER_EXECUTABLE_PATH:-}" ]]; then'
    echo '  for browser in google-chrome-stable google-chrome chromium; do'
    echo '    if browser_path="$(type -P "${browser}")"; then'
    echo '      export AGENT_BROWSER_EXECUTABLE_PATH="${browser_path}"'
    echo '      break'
    echo '    fi'
    echo '  done'
    echo 'fi'
    echo 'if [[ -z "${AGENT_BROWSER_EXECUTABLE_PATH:-}" ]]; then'
    echo '  printf "%s\n" "hermes: No Chrome/Chromium on PATH. Install chromium or google-chrome, or set AGENT_BROWSER_EXECUTABLE_PATH. Browser downloads are disabled." >&2'
    echo 'fi'
    echo "exec /opt/$pkgname/venv/bin/python -m hermes_cli.main" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
