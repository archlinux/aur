# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# The Python environment is bundled because upstream pins a large, partly native
# dependency set. uv's relocatable mode keeps the packaged environment usable
# after makepkg moves it under /opt.
#
# Runtime tools Arch already ships (python, nodejs, npm, uv, ffmpeg, ripgrep,
# and a system Chrome/Chromium) stay as package dependencies. package() builds a
# read-only PM store of /usr/bin symlinks (system-tools.py) and points
# install-stamp.json runtimeDir at it, so PM treats pacman tools as installed
# (PM never counts a bare PATH copy). The launcher disables lazy PM installs;
# keep-venv-interpreter.patch keeps Hermes children on the venv python, not the
# store's system python symlink (that entry exists only for uvx).
#
# /opt is root-owned and HERMES_DISABLE_LAZY_INSTALLS=1, so opt-in extras that
# users commonly hit must be preinstalled here. Ship: all + messaging, plus
# anthropic (Anthropic / anthropic_messages proxies), edge-tts + ddgs +
# doc-extract (default TTS / free search / documents), and gateway extensions
# (feishu, matrix, dingtalk, wecom, teams, google-chat). Anything else
# (bedrock, voice, fal, …) needs a rebuild with more --extra flags or a
# writable install — `sudo` + re-packaging, not runtime lazy install.
#
# system-tools.py / keep-venv-interpreter.patch adapted from jabla's
# hermes-agent-bin (thanks).
pkgname=hermes-agent
# Peeled v0.22.4 tag object (git rev-parse v0.22.4^{}); pin so the stamp
# does not depend on a live network lookup during package().
_commit=4d04303818b61bf3aa09278af48356315515965b
_commit_date=1792599405
pkgver=0.22.4
pkgrel=2
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url="https://github.com/NousResearch/hermes-agent"
license=('MIT')
install=$pkgname.install
depends=(
    'python>=3.14'
    'nodejs>=22.22'
    'npm'
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
makedepends=('cmake')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'keep-venv-interpreter.patch'
    'system-tools.py'
)
sha256sums=('808464c45097ebc4febaed2d08bb936095262c6997ba7c49ee1a0c4e7f7c593e'
            '516bee4492e4d6f6e4310703bdec7e88229a1b0ddb828542f297d4e6e226c427'
            '5950d73a49526767dfac20084d8c5597b7ebf5c16e7bff99e31dc4d7fe0d139d')

prepare() {
  cd "${pkgname}-${pkgver}"

  # --fuzz=0: a hunk whose context drifted must fail loudly.
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/keep-venv-interpreter.patch"
}

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

  # Copy application files (bsdtar; avoids an rsync makedepend).
  # Exclude tests — they bloat /opt and trigger namcap false positives.
  bsdtar -C . -cf - \
    --exclude='__pycache__' --exclude='.git' \
    --exclude='node_modules' --exclude='web/src' \
    --exclude='web/package.json' --exclude='web/package-lock.json' \
    --exclude='web/vite.config.ts' --exclude='web/tsconfig*.json' \
    --exclude='web/eslint.config.js' --exclude='web/README.md' \
    --exclude='ui-tui/src' --exclude='ui-tui/node_modules' \
    --exclude='scripts/tests' --exclude='scripts/install.*' \
    --exclude='tests' --exclude='build' \
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
  # namcap: world-readable/executable tree for packaged TUI assets
  chmod -R a+rX "$_optdir/ui-tui/dist" "$_tuidir" 2>/dev/null || true
  # uv leaves a world-writable lock inside the venv; drop it from the package
  rm -f "$_optdir/venv/.lock"

  # Declare this tree as package-manager-owned (pacman/AUR). Without a stamp,
  # startup classifies the install as "unknown-managed" and PM drift against a
  # leftover ~/.hermes/tools/facts.json prints a rebuild-artifact remedy.
  # write_install_stamp.py's CLI only admits docker|nix|desktop-app|apt-termux;
  # Arch uses the same "package-manager" steward desktop already documents.
  # runtimeDir points PM at the system-tools store below (absolute; not relative).
  _built_at="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" '+%Y-%m-%dT%H:%M:%SZ')"
  _runtime_dir="/opt/$pkgname/system-store/tools"
  cat > "$_optdir/install-stamp.json" <<EOF
{
  "schemaVersion": 2,
  "commit": "${_commit}",
  "commitDate": ${_commit_date},
  "branch": null,
  "builtAt": "${_built_at}",
  "dirty": false,
  "source": "aur",
  "distribution": "package-manager",
  "updateMechanism": "external",
  "runtimeDir": "${_runtime_dir}",
  "baseVersion": "${pkgver}",
  "displayVersion": "${pkgver}",
  "distance": 0,
  "payload": "bootstrap",
  "tag": null
}
EOF

  # PM store of tools depends=() provides (symlinks into /usr/bin).
  venv/bin/python -B "${srcdir}/system-tools.py" "$_optdir" "$_optdir/system-store/tools"

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
    # TUI prefers an explicit node; PM store covers the rest.
    echo ': "${HERMES_NODE:=/usr/bin/node}"'
    echo 'export HERMES_NODE'
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
  # system-store + patched tree must stay world-readable
  chmod -R a+rX "$_optdir/system-store" "$_optdir/hermes_cli/_launchers.py"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
