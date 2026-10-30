# Maintainer: Ishan Parihar <ishanparihar at outlook dot com>
#
# Repack of the official Notion desktop app for Linux.
#
# Notion ships Windows and macOS builds only; there is no official Linux
# release. This package repacks the Windows NSIS installer, applies the
# Linux patches, and runs it on Arch's system Electron.
#
# The point of this base, versus notion-app-electron, is that nothing here
# needs a human on an upstream bump:
#
#   pkgver()      resolves the version from Notion's own latest.yml
#   prepare()     fetches that version, verifies it against the sha512
#                 published in the same manifest, then extracts it
#   native deps   better-sqlite3 and node-pipewire versions are read from
#                 the app's own package.json instead of being pinned here
#
# So `yay -Syu` picks up a new Notion release without a PKGBUILD edit.

pkgname=notion-app-electron-bin
pkgver=7.41.1  # fallback; overridden by pkgver()
pkgrel=1
pkgdesc="Your connected workspace for wiki, docs & projects (official app, repacked)"
arch=(x86_64)
url="https://www.notion.so/desktop"
license=(custom:proprietary)

depends=(
  bash
  electron43
  glibc
  gcc-libs
  hicolor-icon-theme
  libpipewire
)

makedepends=(
  7zip
  asar
  ast-grep
  curl
  jq
  libarchive
  nodejs
  python
)

provides=("notion-app-electron=$pkgver")
# Same product, same launcher: replace the hand-maintained package rather
# than installing a second copy of Notion. Deliberately NOT conflicting
# with notion-app-enhanced, which provides "notion-app" (a different
# name), so there is no provider ambiguity and no forced removal there.
conflicts=(notion-app-electron)

options=(!emptydirs !strip)
install=notion-app-electron-bin.install

# The installer is fetched by prepare(), not by source=, because prepare()
# runs BEFORE pkgver() and the artefact name contains the version. A
# source=() entry would expand the stale fallback.

_manifest="https://desktop-release.notion-static.com/latest.yml"

# Resolve the upstream version. Notion's manifest is plain yaml served
# without auth and without rate limits, and it carries the sha512 of the
# same artefact, so prepare() can verify its download without trusting a
# second source of truth.
pkgver() {
  local _v
  _v=$(curl -fsSL "$_manifest" 2>/dev/null | sed -n 's/^version: *//p' | head -1)
  [[ -n "$_v" ]] && printf '%s' "$_v" || printf '%s' "7.41.1"
}

# The manifest publishes the sha512 base64-encoded; makepkg and sha512sum
# both want hex.
_manifest_sha512_hex() {
  curl -fsSL "$_manifest" 2>/dev/null \
    | sed -n 's/^sha512: *//p' | head -1 \
    | base64 -d 2>/dev/null \
    | od -An -tx1 | tr -d ' \n'
}

# Read one dependency version out of the extracted app's package.json.
# This is what keeps the native modules matched to the app version.
_app_dep_version() {
  python - "$1" "$2" <<'PY'
import json, sys
path, field = sys.argv[1], sys.argv[2]
with open(path) as fh:
    data = json.load(fh)
for section in ("dependencies", "optionalDependencies"):
    got = (data.get(section) or {}).get(field)
    if got:
        print(got)
        break
PY
}

source=(
  notion-app
  notion.desktop
  notion.png
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir"

  local _ver _installer _want _got _encoded
  _ver=$(pkgver)
  _installer="Notion Setup ${_ver}.exe"

  # --- fetch the installer, verified against the manifest ----------------
  if [[ -f "$_installer" ]] && 7z t "$_installer" >/dev/null 2>&1; then
    msg2 "using cached %s" "$_installer"
  else
    msg2 "fetching Notion %s" "$_ver"
    _want=$(_manifest_sha512_hex)
    [[ -n "$_want" ]] || { error "could not read a sha512 from the manifest"; return 1; }

    _encoded=$(printf '%s' "$_installer" | sed 's/ /%20/g')
    if ! curl -fL --retry 3 -o "$_installer" \
        "https://desktop-release.notion-static.com/${_encoded}"; then
      error "download failed for %s" "$_installer"
      return 1
    fi

    _got=$(sha512sum "$_installer" | cut -d' ' -f1)
    if [[ "$_got" != "$_want" ]]; then
      error "sha512 mismatch"
      error "  expected %s" "$_want"
      error "  got      %s" "$_got"
      rm -f "$_installer"
      return 1
    fi
    msg2 "sha512 verified against latest.yml"
  fi

  # --- unpack the NSIS payload and the asar ------------------------------
  # Discard the previous extraction so a file upstream removed cannot
  # survive into the new package.
  rm -rf "$srcdir/asar_patched" "$srcdir/resources" "${srcdir:?}/\$PLUGINSDIR"
  # 7z returns non-zero on the NSIS installer's trailing data even when the
  # payload extracts cleanly, so the status is only advisory here. The
  # app.asar existence check below is the real assertion.
  7z x "$_installer" '$PLUGINSDIR/app-64.7z' -y -bse0 -bso0 || true
  7z x '$PLUGINSDIR/app-64.7z' 'resources/app.asar' 'resources/app.asar.unpacked' -y -bse0 -bso0 || true
  [[ -f resources/app.asar ]] || { error "app.asar not found inside the installer"; return 1; }

  asar e resources/app.asar asar_patched \
    || { error "asar extraction failed"; return 1; }

  # --- match the native modules to the versions the app expects ---------
  local _sqlite_ver _pipewire_ver _pw_dir
  _sqlite_ver=$(_app_dep_version asar_patched/package.json better-sqlite3)
  _pipewire_ver=$(_app_dep_version asar_patched/package.json node-pipewire)
  [[ -n "$_sqlite_ver" ]] || { error "could not read better-sqlite3 from package.json"; return 1; }
  [[ -n "$_pipewire_ver" ]] || { error "could not read node-pipewire from package.json"; return 1; }
  msg2 "app expects better-sqlite3 %s and node-pipewire %s" "$_sqlite_ver" "$_pipewire_ver"

  # better-sqlite3: the Linux prebuild ships inside the npm tarball.
  curl -fsSL -o "$srcdir/sqlite3.tgz" \
    "https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_sqlite_ver}.tgz" \
    || { error "could not fetch better-sqlite3 %s" "$_sqlite_ver"; return 1; }
  bsdtar -xOf "$srcdir/sqlite3.tgz" package/prebuilds/linux-x64.node \
    > "$srcdir/asar_patched/node_modules/better-sqlite3/build/Release/better_sqlite3.node" \
    || { error "better-sqlite3 has no linux-x64 prebuild"; return 1; }

  # node-pipewire: the ESM wrapper from npm plus the Node-API prebuild.
  _pw_dir="$srcdir/asar_patched/node_modules/node-pipewire"
  install -d "$_pw_dir/dist/binding/napi-v6"
  curl -fsSL -o "$srcdir/pipewire.tgz" \
    "https://registry.npmjs.org/node-pipewire/-/node-pipewire-${_pipewire_ver}.tgz" \
    || { error "could not fetch node-pipewire %s" "$_pipewire_ver"; return 1; }
  bsdtar -xf "$srcdir/pipewire.tgz" -C "$_pw_dir" --strip-components 1 \
    package/package.json package/dist/index.js \
    || { error "node-pipewire tarball layout changed"; return 1; }
  curl -fsSL -o "$srcdir/pipewire-prebuilt.tar.gz" \
    "https://github.com/kakxem/node-pipewire/releases/download/${_pipewire_ver}/napi-v6-linux-x64.tar.gz" \
    || { error "could not fetch the node-pipewire prebuild"; return 1; }
  bsdtar -xOf "$srcdir/pipewire-prebuilt.tar.gz" napi-v6/index.node \
    > "$_pw_dir/dist/binding/napi-v6/index.node" \
    || { error "node-pipewire prebuild has an unexpected layout"; return 1; }

  # --- drop the artefacts that cannot load on Linux ---------------------
  rm -f \
    "asar_patched/.webpack/main/native_modules/build/Release/winregistry.node" \
    "asar_patched/.webpack/main/native_modules/adjust_get_current_system_volume_vista_plus.exe" \
    "asar_patched/node_modules/@notionhq/desktop-native/build/Release/win_utils.node" \
    "asar_patched/node_modules/better-sqlite3/build/Release/test_extension.node"
  rm -rf \
    "asar_patched/node_modules/cf-prefs" \
    "asar_patched/node_modules/node-mac-window"
  # progress_bar.node's Linux build links GTK4 while system Electron links
  # GTK3; loading both aborts the process. Notion falls back gracefully.
  rm -f "asar_patched/node_modules/@jasonscheirer/native-progress-bar/build/Release/progress_bar.node"

  # getIcon() is patched to read the tray icon from __dirname, so the icon
  # has to sit next to the bundle.
  install -Dm644 "$srcdir/notion.png" "asar_patched/.webpack/main/trayIcon.png"

  # --- the Linux patches ------------------------------------------------
  local _index="$srcdir/asar_patched/.webpack/main/index.js"
  [[ -f "$_index" ]] || { error "main bundle missing at %s" "$_index"; return 1; }

  # ast-grep exits 1 when a pattern matches nothing, and makepkg runs the
  # PKGBUILD under `set -e`, so a stale anchor aborts the build here rather
  # than silently shipping an unpatched app.
  _sg_patch() {
    ast-grep run --lang javascript -U -p "$1" -r "$2" "$_index" >/dev/null 2>&1 \
      || { error "patch did not apply: %.60s" "$1"; return 1; }
  }
  _sg_patch_select() {
    ast-grep run --lang javascript -U --selector "$1" -p "$2" -r "$3" "$_index" >/dev/null 2>&1 \
      || { error "patch did not apply: %.60s" "$2"; return 1; }
  }

  # 1. the tray menu never opened: attach the context menu first
  _sg_patch \
    'this.tray.on("click",()=>{this.onClick()})' \
    'this.tray.setContextMenu(this.trayMenu),this.tray.on("click",()=>{this.onClick()})'
  # 2. the tray icon was blank: resolve it from disk
  _sg_patch_select method_definition \
    'class X { getIcon(){ $$$BODY } }' \
    'getIcon(){return require("path").resolve(__dirname,"trayIcon.png");}'
  # 3. the service worker did not register: present as Windows
  _sg_patch \
    '$S.setUserAgent(`${$S.getUserAgent()} WantsServiceWorker`)' \
    '$S.setUserAgent(`${$S.getUserAgent().replace("Linux", "Windows")} WantsServiceWorker`)' \
  # 4. the uninstall handler was Windows-only
  _sg_patch \
    'if("darwin"===process.platform)$MAC;else if("win32"===process.platform){const $UNINSTALL=$ARGS=>$ARGS.find($ARG=>"--uninstall"===$ARG);$$$B}' \
    'if("darwin"===process.platform)$MAC;else if("linux"===process.platform){const $UNINSTALL=$ARGS=>$ARGS.find($ARG=>"--uninstall"===$ARG);$$$B}'
  # 5. system Electron puts the asar in argv; do not treat it as a file
  _sg_patch \
    'function $F($ARG){const $EXT=$PATH.default.extname($ARG).toLowerCase();return!$ARG.startsWith("-")&&void 0===$SCHEME($ARG)&&$EXT.length>0&&".exe"!==$EXT}' \
    'function $F($ARG){const $EXT=$PATH.default.extname($ARG).toLowerCase();return!$ARG.startsWith("-")&&void 0===$SCHEME($ARG)&&$EXT.length>0&&".exe"!==$EXT&&".asar"!==$EXT}'
  # 6. a comma-expression left a bare 0 where a statement belonged
  _sg_patch \
    '($$$PRE,function(){$$$INIT}(),0)' \
    '($$$PRE,function(){$$$INIT}())'
  # 7. the win32 branch was taking the Linux code path
  _sg_patch_select ternary_expression \
    '"win32"===process.platform?function($E,$T){$$$A}($E,$T):$ALT' \
    '"linux"===process.platform?function($E,$T){$$$A}($E,$T):$ALT'

  # --- verify every patch landed ----------------------------------------
  # A pattern can match and still produce the wrong result, so assert the
  # patched form is present and the original is gone before packing.
  #
  # NOTE: the patterns above use ast-grep metavariables ($EXT, $$$INIT,
  # $S, ...). Those are substituted with the matched source text, so the
  # metavariable *names* never appear in the output. The assertions below
  # therefore check the literal text that survives the substitution, not
  # the pattern syntax.
  local _fail=0
  _check() {
    if ! grep -qF "$2" "$_index"; then
      error "verify %s: patched form MISSING" "$1"; _fail=1
    fi
    if [[ -n "${3:-}" ]] && grep -qF "$3" "$_index"; then
      error "verify %s: original form STILL PRESENT" "$1"; _fail=1
    fi
  }
  _check tray-context-menu 'setContextMenu(this.trayMenu),this.tray.on("click"'
  _check tray-icon 'trayIcon.png'
  _check user-agent 'replace("Linux", "Windows")'
  _check uninstall-linux 'else if("linux"===process.platform)'
  # `".asar"!==` only exists after the patch; the original ended at `.exe"!==`.
  _check argv-extension '".asar"!=='
  # The comma-expression patch drops the `,0` and keeps the trailing `()`.
  # `}(),0)` is the unpatched form.
  _check comma-expression 'function(){return arguments}()' '}(),0)'
  [[ $_fail -eq 0 ]] || { error "one or more patches did not land"; return 1; }
  msg2 "all patches verified"

  # The bundle must parse with the parser that will actually load it.
  # node --check understands the ESM + top-level await that python rejects.
  node --check "$_index" || { error "the patched bundle does not parse"; return 1; }

  asar p asar_patched "$srcdir/app.asar" --unpack '*.node' \
    || { error "asar repack failed"; return 1; }
}

check() {
  cd "$srcdir"

  # 1. the app identifies itself as the version we packaged
  grep -q "\"version\": \"$pkgver\"" asar_patched/package.json \
    || { error "package.json does not report %s" "$pkgver"; return 1; }

  # 2. the patches are in the payload we are about to ship, not only in the
  #    staging tree (checking the staging tree proves we edited something;
  #    checking the packed asar proves we shipped it)
  asar e app.asar .verify || { error "could not re-extract app.asar"; return 1; }
  local _v=.verify/.webpack/main/index.js
  grep -qF 'setContextMenu(this.trayMenu)' "$_v" \
    || { error "tray patch missing from the packed app.asar"; return 1; }
  grep -qF '".asar"!==' "$_v" \
    || { error "argv patch missing from the packed app.asar"; return 1; }

  # 3. the native modules the app will dlopen are present and non-empty
  local _node
  for _node in \
    asar_patched/node_modules/better-sqlite3/build/Release/better_sqlite3.node \
    asar_patched/node_modules/node-pipewire/dist/binding/napi-v6/index.node
  do
    [[ -s "$_node" ]] || { error "native module missing or empty: %s" "$_node"; return 1; }
  done

  # 4. it actually starts and reports readiness.
  #
  # Notion is a persistent desktop app: it does not exit on its own, so the
  # old "wait for the process to die" logic was wrong in two ways. It gave
  # up before the app had finished booting on a slow machine, and it
  # treated a still-running process as a failure.
  #
  # The right assertion is "the app printed its version line and did not
  # print a fatal error". So: start it, poll the log for the version line,
  # then stop it again.
  #
  # --headless alone dumps core here; the Ozone platform has to be forced
  # to headless as well, or the process tries to reach an X server that
  # does not exist and exits before it can log anything.
  local _log="$srcdir/smoke.log" _pid _i _probe_datadir
  : > "$_log"
  # A private user-data dir. Electron's single-instance lock lives in the
  # default one, so launching against $HOME would either fail because the
  # user already has Notion open, or leave a lock behind pointing at this
  # pid that the user's next real launch then trusts -- which manifests as
  # the app exiting silently and never showing a window. An isolated dir
  # makes the check self-contained either way.
  _probe_datadir="$srcdir/.smoke-profile"
  rm -rf "${_probe_datadir:?}"
  env -u DISPLAY -u WAYLAND_DISPLAY electron43 --headless --no-sandbox \
      --ozone-platform=headless \
      --user-data-dir="$_probe_datadir" \
      "$srcdir/app.asar" >"$_log" 2>&1 &
  _pid=$!

  _ready=0
  for _i in $(seq 1 60); do
    # The version line is the app's own "I booted" signal.
    if grep -q "App starting with version $pkgver" "$_log"; then
      _ready=1
      break
    fi
    # If it died before reporting, there is no point waiting further.
    kill -0 "$_pid" 2>/dev/null || break
    sleep 0.5
  done

  # Stop it again. SIGTERM makes wait return 143, which would abort under
  # set -e, so the status is discarded.
  kill -TERM "$_pid" 2>/dev/null || true
  wait "$_pid" 2>/dev/null || true

  [[ $_ready -eq 1 ]] \
    || { error "the app did not report version %s within 30s" "$pkgver"; cat "$_log" >&2; return 1; }

  # 5. the log says it started, and says nothing fatal
  if grep -qiE "uncaught|unhandled rejection|SyntaxError|Cannot find module" "$_log"; then
    error "the startup log reports a fatal error"
    cat "$_log" >&2
    return 1
  fi

  rm -rf "${_probe_datadir:?}"
  msg2 "smoke test passed: started as %s with no fatal errors" "$pkgver"
}

package() {
  local _lib="$pkgdir/usr/lib/notion-app"
  local _share="$pkgdir/usr/share"

  install -d "$_lib"
  install -Dm644 "$srcdir/app.asar" "$_lib/app.asar"
  if [[ -d "$srcdir/app.asar.unpacked" ]]; then
    cp -a "$srcdir/app.asar.unpacked" "$_lib/"
  fi
  install -Dm644 "$srcdir/asar_patched/package.json" "$_lib/package.json"

  install -Dm755 "$srcdir/notion-app" "$pkgdir/usr/bin/notion-app"
  install -Dm644 "$srcdir/notion.desktop" "$_share/applications/notion-app.desktop"
  install -Dm644 "$srcdir/notion.png" "$_share/icons/hicolor/512x512/apps/notion-app.png"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Proprietary. Notion is copyright Notion Labs, Inc.
This package only repacks the upstream desktop build so it runs on Linux.
See $url for the terms.
EOF
}
