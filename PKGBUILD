# Maintainer: Youcef <youcef.nafa@gmail.com>
# Co-maintainer: Evert <evorster at gmail dot com>
# Builds Hermes Agent from the upstream release tag into /opt/hermes-agent.
# Upstream pins a large, partly native Python dependency set; uv's relocatable
# venv keeps the packaged environment usable after makepkg moves it under /opt.
# The local files (keep-venv-interpreter.patch, release-date-from-stamp.patch,
# system-browser-fallback.patch, system-tools.py, hermes_agent_env.py) are the
# same files as in hermes-agent-bin, whose CI builds this PKGBUILD under that
# name (https://github.com/jabla/hermes-agent-bin).
pkgname=hermes-agent
_pkgver_tag=v0.22.6
_commit=f0d94882e89ab8d4098b5bb2f166adfb9ee0a0ab
_tagver=${_pkgver_tag#v}           # tag without the leading v — GitHub strips it from the archive dir
_optname=hermes-agent              # fixed install dir (pkgname-independent, matches source pkg)
_pyver=3.14                        # Arch's python minor; keep depends=() in step
_uvmin=0.13.5                      # pm's uv pin (pm/lock.json); check() stops when it moves
pkgver=0.22.6
pkgrel=1
pkgdesc="Locally-run AI agent with tool use, web browsing, and automation"
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'python>=3.14' 'python<3.15'   # the minor in _pyver
  'nodejs>=26' 'npm' "uv>=${_uvmin}" 'ripgrep' 'ffmpeg'
  # the libraries of pm's Chromium (`hermes pm install chromium`)
  'nss' 'atk' 'at-spi2-core' 'cups' 'libdrm' 'libxkbcommon' 'mesa' 'pango'
  'cairo' 'alsa-lib' 'libxcomposite' 'libxdamage' 'libxrandr'
  'git' 'curl'
)
optdepends=(
  'chromium: system browser for browser_exec (browser.executable_path)'
  'google-chrome: system browser for browser_exec (browser.executable_path, AUR)'
  'brave-bin: system browser for browser_exec (browser.executable_path, AUR)'
)
makedepends=('rsync' 'cmake')   # cmake: python-olm (matrix extra)
conflicts=('hermes-agent-bin')
options=('!debug' '!strip')   # package() strips the native libraries itself
source=(
  "hermes-agent-${_tagver}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'keep-venv-interpreter.patch'
  'release-date-from-stamp.patch'
  'system-browser-fallback.patch'
  'system-tools.py'
  'hermes_agent_env.py'
)
sha256sums=('2add026d44c602d8b911f7ef366bd3860505e0cd124e935aa78e09fd7e814091'
            'f6824d0250926db151b0a06043a8385a642d83048e2b73967625362076b7d818'
            '107cf7f981e7a96466d7c3f2a2cc1b8cdf2c1a5db797c22087b27f2e7f64541f'
            '196ba6f200257073a5f02bab284a11594e67bfe1e10470a83ab0fc9437ef777b'
            '5950d73a49526767dfac20084d8c5597b7ebf5c16e7bff99e31dc4d7fe0d139d'
            'c8a782bbee797b064db590d7b6e01963e0c31db7eea7ce2be13fe33a11726b6a')

_extract_dir() {
  echo "${srcdir}/hermes-agent-${_tagver}"
}

prepare() {
  cd "$(_extract_dir)"

  # The archive's mtimes are the upstream commit time. Record it before a
  # patch can change pyproject.toml; package() writes it into the stamp.
  stat -c %Y pyproject.toml > "${srcdir}/commit-date"

  # --fuzz=0: a hunk whose context drifted must fail loudly instead of being
  # applied at a guessed location (offsets are still accepted).
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/keep-venv-interpreter.patch"
  # Upstream #135223 (draft): the banner date comes from the stamp's
  # commitDate, not the stale 2026.9.24 literal. Drop it once upstream ships
  # the fix; until then this hunk fails loudly when __init__.py moves.
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/release-date-from-stamp.patch"
  # Lazy installs are off here, so pm never fetches its Chromium on demand:
  # browser_exec falls back to a system Chrome, Chromium or Brave instead of
  # needing browser.executable_path.
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/system-browser-fallback.patch"
}

build() {
  cd "$(_extract_dir)"

  # vite-plugin-tailwindcss uses the ignore package which walks up the tree to
  # read .gitignore files. Creating an empty .git directory stops the scan.
  [ ! -d .git ] && mkdir .git

  npm ci --ignore-scripts --no-fund --no-audit --progress=false --include=dev
  npm run build --workspace web
  npm run build:ink --workspace ui-tui
  npm run build --workspace ui-tui
  # The browser-hosted Desktop (`hermes webapp`, new after v0.22.5). Hermes
  # would build it into its install root on first use, which is root-owned
  # here; HERMES_WEBAPP_DIST (launcher and hermes_agent_env.py) makes it
  # serve this bundle as it is. Its private npm workspace (.build/) stays out
  # of the package.
  node apps/desktop/scripts/build-webapp.mjs

  # The venv runs on Arch's python (upstream supports 3.14 since v0.21.6,
  # requires-python ">=3.11,<3.15"). A venv only works on the minor version
  # it was built for, so depends=() pins it: when Arch moves python to the
  # next minor, pacman holds that update back until this package follows
  # (to the new minor if upstream supports it, else to a bundled CPython).
  UV_PYTHON_DOWNLOADS=never uv venv \
    --clear \
    --python "/usr/bin/python${_pyver}" \
    --relocatable \
    venv
  # Lazy installs are off for the root-owned venv, so the extras users
  # commonly hit ship here, as in the reference package: anthropic (Anthropic
  # provider), edge-tts (default TTS), ddgs (free web search), doc-extract,
  # keychain (`hermes vault key migrate --to keychain`) and the gateways
  # beyond messaging. The documents extras stay out: skills build their own
  # side environment (`hermes pm environment documents`). python-olm (matrix)
  # builds a vendored libolm whose cmake_minimum_required CMake >= 4 rejects
  # unless the policy minimum is raised.
  CMAKE_POLICY_VERSION_MINIMUM=3.5 \
  UV_PYTHON_DOWNLOADS=never \
    UV_PROJECT_ENVIRONMENT="$PWD/venv" \
    uv sync --locked --no-dev --no-install-project \
      --extra all,messaging,anthropic,edge-tts,ddgs,doc-extract,keychain \
      --extra feishu,matrix,dingtalk,wecom,teams,google-chat
}

check() {
  cd "$(_extract_dir)"

  test -s hermes_cli/web_dist/index.html
  test -s ui-tui/dist/entry.js
  test -s apps/desktop/dist-webapp/index.html
  PYTHONPATH="$PWD" venv/bin/python -c \
    'import hermes_cli.main, anthropic, edge_tts, ddgs, keyring, lark_oapi, mautrix, dingtalk_stream, defusedxml'

  # pm runs the system uv from the system-tools store. Plugins with Python
  # dependencies make it re-resolve uv.lock, which an older uv than pm's pin
  # can fail (uv 0.13.4 on the v0.22.5 lock: NousResearch/hermes-agent#143254).
  # depends=() asks for at least the pin; stop when upstream moves it.
  local uv_pin
  uv_pin="$(venv/bin/python -c 'import json, sys; print(json.load(open(sys.argv[1]))["packages"]["uv"]["version"])' pm/lock.json)"
  if (( $(vercmp "${uv_pin}" "${_uvmin}") > 0 )); then
    printf 'ERROR: pm pins uv %s, depends=() asks for uv>=%s: raise _uvmin\n' "${uv_pin}" "${_uvmin}"
    return 1
  fi
}

package() {
  cd "$(_extract_dir)"

  # Install to /opt/hermes-agent (fixed, pkgname-independent — identical to the
  # source package, so switching source -> -bin is drop-in; conflicts=() keeps
  # only one variant installed).
  _optdir="$pkgdir/opt/${_optname}"
  install -d "$_optdir"

  rsync -a --exclude='__pycache__' --exclude='.git' \
    --exclude='node_modules' --exclude='web/src' \
    --exclude='web/package.json' --exclude='web/package-lock.json' \
    --exclude='web/vite.config.ts' --exclude='web/tsconfig*.json' \
    --exclude='web/eslint.config.js' --exclude='web/README.md' \
    --exclude='ui-tui/src' --exclude='ui-tui/node_modules' \
    --exclude='scripts/tests' --exclude='scripts/install.*' \
    --exclude='build' --exclude='/tests' --exclude='/.build' \
    . "$_optdir/"

  echo "console.log('skipping build, using prebuilt dist/entry.js')" > "$_optdir/ui-tui/scripts/build.mjs"

  # The web build's freshness manifest (new in v0.21.6) records its inputs by
  # absolute build path; point it at the installed tree instead of $srcdir.
  sed -i "s|$(_extract_dir)|/opt/${_optname}|g" "$_optdir/hermes_cli/web_dist/hermes-build.json"

  # Since v0.21.6 the version comes from a build stamp beside the code
  # (pyproject says 0.0.0; without the stamp `hermes --version` reports
  # "unknown"). Upstream's packager script writes it. "external" keeps hermes
  # from syncing the root-owned venv and marks the tree as not its own. The
  # commit time comes from prepare().
  # The script fills gaps from CI variables (GITHUB_REF_NAME, ...) and from
  # git, which would find this packaging repository around $srcdir: start it
  # with a bare environment and keep git inside $srcdir.
  env -i PATH="$PATH" GIT_CEILING_DIRECTORIES="$srcdir" \
    venv/bin/python scripts/write_install_stamp.py \
    --output "$_optdir/install-stamp.json" \
    --commit "$_commit" \
    --commit-date "$(<"${srcdir}/commit-date")" \
    --base-version "$pkgver" \
    --distance 0 \
    --source aur \
    --update-mechanism external
  # `distribution` names the steward that owns the tree; `hermes update` then
  # refuses with "managed by pacman" before it tries to lock the root-owned
  # tree. The script only offers upstream's own stewards, the runtime takes
  # any name. `runtimeDir` points pm at the system-tools store below; the
  # runtime resolves it as given (not relative to the stamp), so absolute.
  venv/bin/python - "$_optdir/install-stamp.json" "/opt/${_optname}/system-store/tools" <<'PY'
import json, sys
path, store = sys.argv[1:]
with open(path, encoding="utf-8") as f:
    stamp = json.load(f)
stamp["distribution"] = "pacman"
stamp["runtimeDir"] = store
with open(path, "w", encoding="utf-8") as f:
    json.dump(stamp, f, indent=2)
    f.write("\n")
PY

  # pm's store of the tools depends=() provides: symlinks into /usr/bin under
  # the pins of pm/lock.json (see system-tools.py).
  venv/bin/python -B "$srcdir/system-tools.py" "$_optdir" "$_optdir/system-store/tools"

  # Ship the prebuilt TUI into hermes_cli/tui_dist/ so _find_bundled_tui()
  # finds it and skips the npm install step (which would fail with EACCES on
  # the root-owned /opt tree). hermes_cli is imported from /opt via the .pth
  # file, NOT from the venv site-packages.
  _tuidir="$_optdir/hermes_cli/tui_dist"
  install -d "$_tuidir"
  if [ -d ui-tui/dist ]; then
    cp -a ui-tui/dist/* "$_tuidir/"
  fi
  # The bundle is an ES module. Upstream's bundle ships this package.json
  # beside it (scripts/build/agent.py); without it node finds the root
  # package.json, warns MODULE_TYPELESS_PACKAGE_JSON and parses entry.js twice.
  echo '{"type":"module"}' > "$_tuidir/package.json"

  _sitedir="$_optdir/venv/lib/python${_pyver}/site-packages"
  install -d "$_sitedir"
  # The launcher's environment for every python of the venv, also the ones
  # started without the launcher (the gateway service unit).
  install -m644 "$srcdir/hermes_agent_env.py" "$_sitedir/"
  {
    echo "import sys; sys.path.insert(0, \"/opt/${_optname}\")"
    echo "import hermes_agent_env"
  } > "$_sitedir/hermes.pth"

  # Bytecode for the whole tree: users cannot write __pycache__ into the
  # root-owned /opt, so without it every start compiles everything again
  # (`hermes --help` 1.15 s instead of 0.46 s). checked-hash: makepkg resets
  # every mtime to SOURCE_DATE_EPOCH, which would turn timestamp-based .pyc
  # files stale. A .py edited in place still wins over its old .pyc.
  # -s/-p record the installed paths, not $pkgdir, in tracebacks.
  "/usr/bin/python${_pyver}" -m compileall -q -j0 \
    --invalidation-mode checked-hash -s "$pkgdir" -p / "$_optdir"

  # makepkg's own strip step inspects each of the ~37k files (about three
  # minutes in CI); only the venv's native libraries are ELF objects. The
  # name test alone would also catch text files named *.so.
  find "$_optdir" -type f -name '*.so*' -print0 |
    while IFS= read -r -d '' lib; do
      if [ "$(head -c 4 "$lib")" = $'\x7fELF' ]; then
        strip --strip-unneeded "$lib"
      fi
    done

  # Readable for every user: the TUI build leaves ui-tui/dist at mode 700
  # (since v0.21.6).
  chmod -R a+rX "$_optdir"
  # uv leaves its venv lock world-writable (0666); only root changes this venv.
  rm -f "$_optdir/venv/.lock"

  install -d "$pkgdir/usr/bin"
  {
    echo "#!/bin/bash"
    echo "unset PYTHONPATH"
    echo "unset PYTHONHOME"
    echo ': "${XDG_DATA_HOME:=$HOME/.local/share}"'
    echo 'export HERMES_DISABLE_LAZY_INSTALLS=1'
    echo 'export HERMES_LAZY_INSTALL_TARGET="$XDG_DATA_HOME/hermes-agent/python"'
    echo "export HERMES_WEBAPP_DIST=/opt/${_optname}/apps/desktop/dist-webapp"
    # Installation launchers answer --print-runtime-command with the
    # interpreter command of their tree as JSON; the desktop app mints its
    # gateway tickets with that interpreter. Upstream's launchers answer
    # through this module. keep-venv-interpreter.patch makes it name the venv
    # python whatever HERMES_HOME says. The command it reports runs hermes
    # without this launcher; hermes_agent_env.py supplies the exports
    # there. -I -B as in upstream's launchers: no cwd on sys.path, no
    # bytecode writes.
    echo 'if [[ ${1-} == --print-runtime-command ]]; then'
    echo "  exec /opt/${_optname}/venv/bin/python -I -B -m hermes_cli._launchers" '"$@"'
    echo 'fi'
    # No browser export: browser_exec reads only browser.executable_path
    # (then pm's Chromium). The config migration to v52 would write an
    # exported AGENT_BROWSER_EXECUTABLE_PATH into the user's config.yaml.
    echo "exec /opt/${_optname}/venv/bin/python -m hermes_cli.main" '"$@"'
  } > "$pkgdir/usr/bin/hermes"

  chmod 755 "$pkgdir/usr/bin/hermes"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
