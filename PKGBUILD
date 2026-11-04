# Maintainer: nullptr <nullptr@null.ptr>
# Builds the Hermes desktop app from the upstream release tag. The app itself
# is MIT-licensed (Nous Research). The local files
# (package-managed-runtime.patch, package-managed-bootstrap.patch,
# harden-hud-modifier-monitor.patch, hermes-desktop, launcher.test.cjs) are the
# same files as in hermes-agent-desktop-bin, whose CI builds this PKGBUILD
# under that name (https://github.com/jabla/hermes-agent-desktop-bin).
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v0.22.7
_commit=b200f5bc60e31588ba2cb60e288029c4a54ba5fa
# Arch's Electron runtime: the major upstream locks, or a newer one (README).
# prepare() points the launcher and its test at it.
_electron=electron44
pkgver=0.22.7
pkgrel=1
pkgdesc="Desktop UI for Hermes Agent (chat, voice, files, settings)"
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
# The app runs its backend through /usr/bin/hermes from hermes-agent (or
# hermes-agent-bin, which provides it with its version) and never installs a
# runtime of its own. It needs a runtime of at least its own version.
# hermes-agent's own dependencies (ffmpeg, ripgrep, browsers, ...) are not
# repeated here.
depends=(
  "${_electron}"
  "hermes-agent>=${pkgver}"
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libx11'
  'libxi'
  'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: tray indicator support'
)
makedepends=('npm' 'nodejs')
checkdepends=('nodejs')
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'package-managed-runtime.patch'
  'package-managed-bootstrap.patch'
  'harden-hud-modifier-monitor.patch'
  'hermes-desktop'
  'launcher.test.cjs'
)
# Run updpkgsums after editing a local file.
sha256sums=('91bf15f50ce61e7da8a7890c11b202b904c3d7c0e2688a6dc6bcb42a2fe8b91d'
            '10568d3fd03b5511a8f2f2e9cbea6a3bd0239fe012814fe08d7c9095e6b71074'
            '412ad7b2b6bc5149a8d236ad2cb9be54d2ac0ab78dbd3c8e16deb4f4e683713f'
            'ac4077eb2846f90d36858c69d8fe99988606caa0059e85a9606273bb7bc29077'
            'cb85a2dba205970130edf4a55c6a094c6e9f64f14f62c998258e2008a50a509f'
            '01700c07523710df165b72bbc0c2931415d118576e78868b1b02eec6bffda034')

# NOTE: ${srcdir} is empty at the top level of a PKGBUILD — makepkg only sets
# it inside the function scope of prepare()/build()/package(). Computing the
# extracted directory once at the top (as `_srcdir=...`) silently produces a
# root-prefixed path (`/hermes-agent-2026.7.1`) and `cd` fails. Define a helper
# and call it from each function instead.
_extract_dir() {
  echo "${srcdir}/hermes-agent-${_pkgver_tag#v}"
}

_set_npm_env() {
  export npm_config_cache="${srcdir}/npm-cache"
  export npm_config_update_notifier=false
  export npm_config_audit=false
  export npm_config_fund=false
}

prepare() {
  cd "$(_extract_dir)"
  _set_npm_env
  # Tailwind's source scan reads the .gitignore files of the directories
  # above when it finds no git checkout, and an AUR clone's .gitignore
  # excludes src/: the renderer would ship without its utility classes
  # (check() looks for them). An empty .git makes the archive its own root.
  mkdir -p .git
  # The launcher and its test name an Electron runtime. Point them at
  # _electron, so a runtime switch only edits that variable. sed -i replaces
  # makepkg's symlinks with edited copies; the repository files stay as they are.
  sed -i -E "s|/usr/bin/electron[0-9]+|/usr/bin/${_electron}|g" \
    "${srcdir}/hermes-desktop" "${srcdir}/launcher.test.cjs"
  if ! grep -q "^exec /usr/bin/${_electron} " "${srcdir}/hermes-desktop"; then
    printf 'ERROR: hermes-desktop has no exec line for /usr/bin/%s\n' "${_electron}"
    return 1
  fi

  # --fuzz=0: a hunk whose context drifted must fail loudly instead of being
  # applied at a guessed location (offsets are still accepted).
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/package-managed-runtime.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/package-managed-bootstrap.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/harden-hud-modifier-monitor.patch"
  # Keep desktop metadata aligned with the Agent release, not the separately
  # versioned upstream desktop package.json.
  npm pkg set version=${pkgver} --prefix apps/desktop
  # The source archive has no .git directory. Pin the peeled release commit
  # locally so the bundled install stamp is reproducible and does not require
  # another network lookup during prepare()/build().
  export GITHUB_SHA="${_commit}" GITHUB_REF_NAME="${_pkgver_tag}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm ci --prefer-offline --no-audit --ignore-scripts

  # Keep the locked Electron npm package for its TypeScript declarations and
  # tooling, but make any build helper that resolves `require('electron')` use
  # Arch's versioned runtime instead of downloading a second copy. npm hoists
  # it to the root node_modules since v0.22.5 (apps/desktop/node_modules
  # before), so take the copy apps/desktop resolves.
  local electron_dir
  electron_dir="$(cd apps/desktop && node -p 'path.dirname(require.resolve("electron/package.json"))')"
  # Only the build tree's own copy may be replaced below: without it (say,
  # dev dependencies omitted) Node would resolve some electron further up.
  if [[ "${electron_dir}" != "$(pwd -P)/"* ]]; then
    printf 'ERROR: electron resolves outside the build tree: %s\n' "${electron_dir}"
    return 1
  fi

  # The runtime used here (_electron) is the major upstream locks or a newer
  # one: the package ran on electron42 while upstream locked 40.x. The
  # opposite direction is not safe: an app written against a newer major may
  # call APIs this runtime lacks, so stop instead of shipping that build.
  local locked_electron system_electron
  locked_electron="$(node -p 'require(process.argv[1]).version' "${electron_dir}/package.json")"
  system_electron="$(< "/usr/lib/${_electron}/version")"
  if (( ${locked_electron%%.*} > ${system_electron%%.*} )); then
    printf 'ERROR: upstream locks Electron %s, newer than the system runtime %s — move _electron to a newer electronNN (README)\n' \
      "${locked_electron}" "${system_electron}"
    return 1
  elif (( ${locked_electron%%.*} < ${system_electron%%.*} )); then
    printf 'NOTE: upstream locks Electron %s; the package runs on system Electron %s\n' \
      "${locked_electron}" "${system_electron}"
  fi

  rm -rf "${electron_dir}/dist"
  ln -s "/usr/lib/${_electron}" "${electron_dir}/dist"
  printf '%s' 'electron' > "${electron_dir}/path.txt"
  test -x "${electron_dir}/dist/electron"

  # Build node-pty's Linux native addon locally. Its npm lifecycle uses
  # node-gyp on Linux. Explicitly export makepkg's build flags because npm
  # otherwise leaves them as unexported shell variables, producing an addon
  # without Arch's full RELRO hardening. --offline keeps npm off the
  # registry; node-gyp takes Node's headers from the nodejs package
  # (/usr/include/node) instead of downloading them from nodejs.org.
  export CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
  npm_config_nodedir=/usr npm rebuild node-pty --offline
}

build() {
  cd "$(_extract_dir)/apps/desktop"
  _set_npm_env
  export npm_config_offline=true
  # makepkg runs build() in a separate subshell from prepare().
  export GITHUB_SHA="${_commit}" GITHUB_REF_NAME="${_pkgver_tag}"
  # The X11 HUD modifier monitor is compiled with cc during the build; it
  # takes these flags from the environment (harden-hud-modifier-monitor.patch).
  export CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
  # Keep upstream's package.json and lockfile pins intact for deterministic
  # npm ci. electron-builder still prepares a throwaway Electron zip for the
  # packager; package() keeps only the app resources and the launcher runs
  # Arch's ${_electron}.
  npm run build

  # Upstream writes the wall clock into the bundled install stamp. Normalize it
  # to makepkg's reproducible-build epoch before electron-builder consumes it.
  local build_time
  build_time="$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y-%m-%dT%H:%M:%S.000Z')"
  sed -i -E \
    "s|(\"builtAt\": \")[^\"]+(\")|\1${build_time}\2|" \
    build/install-stamp.json
  grep -Fq "\"builtAt\": \"${build_time}\"" build/install-stamp.json

  # Upstream's prepared-packaging gate admits `--dir`, not a bare `dir` token,
  # and rejects `-c.electronVersion=...` overrides. Omit --x64: an explicit
  # arch flag stages into build/native-deps-<platform>-<arch>, which
  # productOutput does not allow; the host arch reuses build/native-deps.
  npm run builder -- --linux --dir
}

# Whether a patched path (from the repository root) can change the renderer's
# typecheck or the tests of its "ui" vitest project; in doubt it can. $2 is the
# renderer program's file list (tsc --listFilesOnly).
_reaches_renderer() {
  local path=$1 program=$2 name files=() found=0
  case "${path}" in
    # The renderer's own sources of any type (styles, glob-loaded plugins),
    # the app's top-level files (package.json, tsconfig.json, the vite and
    # vitest configs) and everything outside the desktop app.
    apps/desktop/src/* | apps/shared/*) return 0 ;;
    apps/desktop/*/*) ;;
    *) return 0 ;;
  esac
  case "${path}" in
    # tsc follows TypeScript imports, so the list holds every such file the
    # renderer reaches.
    *.ts | *.tsx | *.mts | *.cts)
      grep -qxF "${PWD}/${path}" <<<"${program}"
      ;;
    # tsc lists no other file type (allowJs is off): look for the name,
    # without extension, in the renderer's sources and program files.
    *)
      name="${path##*/}"
      name="${name%.*}"
      mapfile -t files < <(grep -v '/node_modules/' <<<"${program}")
      # A search error (exit 2) counts as found.
      grep -rqF -- "${name}" apps/desktop/src apps/shared "${files[@]}" || found=$?
      (( found != 1 ))
      ;;
  esac
}

check() {
  cd "$(_extract_dir)"
  _set_npm_env
  export npm_config_offline=true
  # Hermes desktop tests expect English timestamps and isolated temporary git
  # repositories; the default Hermes scratch directory sits inside a git repo.
  export LANG=C.UTF-8 LC_ALL=C.UTF-8
  export GIT_CEILING_DIRECTORIES="${TMPDIR:-/tmp}"
  unset HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME
  HERMES_LAUNCHER_PATH="${srcdir}/hermes-desktop" node "${srcdir}/launcher.test.cjs"

  # Upstream's full vitest suite (~1700 files) runs in upstream's CI; here it
  # took ~90% of the build time and exercised upstream code on Arch's system
  # Node, which the app does not run on. Run the tests that cover what the
  # patches change instead: the patched tests and every test importing a
  # patched module. The file list follows the patches automatically; diff -u
  # style headers carry a tab and a timestamp after the path.
  local patched=() file
  mapfile -t patched < <(sed -n 's|^+++ b/\([^\t]*\).*|\1|p' "${srcdir}"/*.patch | sort -u)
  # A misparsed header would select no tests and pass (--passWithNoTests).
  (( ${#patched[@]} > 0 ))
  for file in "${patched[@]}"; do
    test -f "${file}"
  done

  # The renderer took most of the typecheck's time, its "ui" vitest project
  # (~1300 test files to scan) most of vitest's; upstream's CI runs both.
  # The renderer's program holds src/ with those tests and every module they
  # import, so a patched file outside it reaches neither. A file list this
  # cannot read counts as reached.
  local program reaches_renderer=0
  program="$(cd apps/desktop && npx tsc -p . --listFilesOnly)" || program=
  if [[ "${program}" != *"${PWD}/apps/desktop/src/"* ]]; then
    reaches_renderer=1
  fi
  for file in "${patched[@]}"; do
    if (( ! reaches_renderer )) && _reaches_renderer "${file}" "${program}"; then
      printf 'check(): %s reaches the renderer\n' "${file}"
      reaches_renderer=1
    fi
  done
  (( reaches_renderer )) ||
    echo 'check(): no patched file reaches the renderer: no renderer typecheck, no ui tests'

  # Upstream's typecheck script; its renderer part only when a patch reaches
  # the renderer. npm exec -c keeps node_modules/.bin ahead of the system's
  # PATH, like npm run.
  local typecheck renderer='tsc -p . --noEmit'
  typecheck="$(node -p 'require("./apps/desktop/package.json").scripts.typecheck')"
  if [[ "${typecheck}" != "${renderer} && "* ]]; then
    printf 'ERROR: upstream typecheck no longer starts with "%s": %s\n' "${renderer}" "${typecheck}"
    return 1
  fi
  (( reaches_renderer )) || typecheck="${typecheck#"${renderer} && "}"
  (cd apps/desktop && npm exec -c "${typecheck}")

  # Without HERMES_PYTHON, vitest's global setup installs Hermes' Python test
  # environment (a CPython, ffmpeg, node and the Python dependencies, from the
  # network) for the few contracts that run real hermes_cli code. The related
  # tests need none of it. python3 is those contracts' own fallback; should a
  # patch ever relate to one, it fails loudly on the missing dependencies.
  # Without the renderer every vitest project but "ui" runs, including ones
  # upstream adds later.
  # Absolute paths, set before the cd: apps/shared files lie outside vitest's
  # root.
  local projects=() related=("${patched[@]/#/${PWD}/}")
  (( reaches_renderer )) || projects=(--project '!ui')
  (cd apps/desktop && HERMES_PYTHON=python3 npx vitest related --run --passWithNoTests "${projects[@]}" "${related[@]}")

  # Tailwind v4 skips sources that a parent directory's .gitignore excludes
  # when the build directory is no git checkout (this repository ignores
  # src/). The renderer then ships without its utility classes: the window
  # shows unstyled text while the app itself boots fine. The utilities live
  # in the stylesheet of the main chunk (index-*.css until v0.22.5, when the
  # renderer entry was src/main.tsx).
  local css=(apps/desktop/release/linux-unpacked/resources/app.asar.unpacked/dist/assets/main-*.css)
  if ! grep -q '\.flex{' "${css[@]}"; then
    printf 'ERROR: the renderer CSS lacks Tailwind utilities (%s) — build from a git checkout or without a parent .gitignore excluding src/\n' \
      "${css[*]##*/}"
    return 1
  fi

  # node-pty is the only native Node addon shipped by Hermes. Load the staged
  # module with the exact Electron runtime used by the installed launcher; its
  # N-API build must not merely load under makepkg's system Node.
  local node_pty_root="${PWD}/apps/desktop/release/linux-unpacked/resources/app.asar.unpacked/dist/node_modules/node-pty"
  test -f "${node_pty_root}/package.json"
  # Bypass Arch's launcher here: it injects the user's electronNN-flags.conf,
  # valid in Chromium mode but rejected while ELECTRON_RUN_AS_NODE is set.
  env ELECTRON_RUN_AS_NODE=1 NODE_PTY_ROOT="${node_pty_root}" \
    "/usr/lib/${_electron}/electron" -e \
    'const pty = require(process.env.NODE_PTY_ROOT); if (typeof pty.spawn !== "function") process.exit(1)'
}

package() {
  cd "$(_extract_dir)"
  local appdir="apps/desktop/release/linux-unpacked"
  local resources="${appdir}/resources"
  if [ ! -d "${appdir}" ]; then
    printf 'ERROR: electron-builder did not produce %s\n' "${appdir}"
    ls -la apps/desktop/release/ 2>/dev/null || true
    return 1
  fi
  if [ ! -f "${resources}/app.asar" ] || \
     [ ! -d "${resources}/app.asar.unpacked" ] || \
     [ ! -f "${resources}/install-stamp.json" ]; then
    printf 'ERROR: electron-builder output is missing required app resources\n'
    find "${resources}" -maxdepth 2 -printf '%M %p\n' 2>/dev/null || true
    return 1
  fi
  # Only the first three resources are installed. The skipped ones are
  # upstream's Windows icon, electron-updater metadata (Hermes ships no
  # electron-updater) and Electron's own default app, which the system
  # Electron provides. Anything else is a new runtime resource the app would miss on
  # Linux, so stop until it is packaged or deliberately added here.
  local entry
  for entry in "${resources}"/*; do
    case "${entry##*/}" in
      app.asar|app.asar.unpacked|install-stamp.json) ;;
      icon.ico|app-update.yml|default_app.asar) ;;
      *)
        printf 'ERROR: unexpected electron-builder resource %s — install it or allowlist it in package()\n' \
          "${entry##*/}"
        return 1
        ;;
    esac
  done
  # Install dir stays version-independent of pkgname: the launcher and the
  # packaged app reference /usr/lib/hermes-agent-desktop by path. The
  # conflicts=() entry guarantees only one variant (source or -bin) is
  # installed, so a fixed dir cannot collide.
  local libdir="/usr/lib/hermes-agent-desktop"
  install -dm755 "${pkgdir}${libdir}"
  install -Dm644 "${resources}/app.asar" \
    "${pkgdir}${libdir}/app.asar"
  cp -a "${resources}/app.asar.unpacked" \
    "${pkgdir}${libdir}/app.asar.unpacked"
  install -Dm644 "${resources}/install-stamp.json" \
    "${pkgdir}${libdir}/install-stamp.json"
  # The agent runtime comes from the hermes-agent dependency (/usr/bin/hermes).
  # This package must not ship or run an installer that writes an agent tree.
  install -Dm755 "${srcdir}/hermes-desktop" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Hermes
GenericName=AI Agent Client
Comment=${pkgdesc}
Exec=/usr/bin/${_pkgname} %U
Terminal=false
Type=Application
Icon=${_upstream,,}
StartupWMClass=${_upstream}
Categories=Development;
Keywords=AI;Agent;Chat;Assistant;
MimeType=x-scheme-handler/hermes;
EOF
  install -Dm644 "apps/desktop/assets/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_upstream,,}.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
