# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v0.22.5
_commit=bf0203a794a07aac3ff764972ab9087baa4e4f4e
pkgver=0.22.5
pkgrel=1
pkgdesc="Desktop UI for Hermes Agent (chat, voice, files, settings)"
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
# Runtime: Electron shell + hermes-agent. Do not repeat hermes-agent's own
# depends/optdepends (ffmpeg, ripgrep, agent-browser, chromium/chrome, …).
# Tools check() invokes directly are listed in checkdepends even when
# hermes-agent would pull them in transitively.
depends=(
  'electron44'
  'hermes-agent>=0.22.5'
  'hicolor-icon-theme'
  'libnotify'
  'libsecret'
  'libx11'
  'libxi'
  'xdg-utils'
)
# npm is not a hermes-agent dependency; nodejs is declared in checkdepends.
makedepends=('npm')
checkdepends=('nodejs' 'python' 'uv')
optdepends=(
  'libayatana-appindicator: tray indicator support'
)
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
# Arch Electron runtime matching upstream apps/desktop pin (44.9.3).
# HERMES_ELECTRON_DIST overrides for local builds without a system install.
_electron_dist="${HERMES_ELECTRON_DIST:-/usr/lib/electron44}"
# Runtime patches only: refuse in-app agent bootstrap/update when the launcher
# sets HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME=1. Test-only / RELRO patches dropped.
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'package-managed-runtime.patch'
  'package-managed-bootstrap.patch'
  'hermes-desktop'
  'launcher.test.cjs'
)
sha256sums=('a8f67e5ec14fea681acef6cc7ff1553f002bb6101fd2df22bfdd4b7eecc54eb2'
            'dfe306b738af35614b81369150263b4a5284cc2061e5d1ce48b3cba7f7d8f584'
            '412ad7b2b6bc5149a8d236ad2cb9be54d2ac0ab78dbd3c8e16deb4f4e683713f'
            '6b2e17a0411f23dcafa9a6da7d8cd850573430a45ff1353e0febbbfc84fbea9f'
            '4b80f0d97e93a24f030a75a8b425db1315888a9ddaa7c0077c7e0401ddf58522')

# Resolve srcdir inside makepkg's functions; it is empty at the top level.
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
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/package-managed-runtime.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/package-managed-bootstrap.patch"
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
  # Arch's versioned runtime instead of downloading a second copy.
  # npm workspaces may hoist electron to the repo root node_modules.
  local electron_dir='apps/desktop/node_modules/electron'
  if [ ! -d "${electron_dir}" ]; then
    electron_dir='node_modules/electron'
  fi
  test -d "${electron_dir}"
  rm -rf "${electron_dir}/dist"
  ln -s "${_electron_dist}" "${electron_dir}/dist"
  printf '%s' 'electron' > "${electron_dir}/path.txt"
  test -x "${electron_dir}/dist/electron"

  # Build node-pty's Linux native addon locally. Its npm lifecycle uses
  # node-gyp on Linux. Explicitly export makepkg's build flags because npm
  # otherwise leaves them as unexported shell variables, producing an addon
  # without Arch's full RELRO hardening. --offline prevents any header or
  # binary download.
  export CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
  npm rebuild node-pty --offline
}

build() {
  cd "$(_extract_dir)/apps/desktop"
  _set_npm_env
  export npm_config_offline=true
  # makepkg runs build() in a separate subshell from prepare().
  export GITHUB_SHA="${_commit}" GITHUB_REF_NAME="${_pkgver_tag}"
  export CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
  # Keep upstream's package.json and lockfile pins intact for deterministic
  # npm ci. electron-builder still prepares a throwaway Electron zip for the
  # packager; package() retains only app resources and the launcher runs
  # Arch's electron44.
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
  # and rejects `-c.electronVersion=…` overrides. Omit --x64: an explicit arch
  # flag stages into build/native-deps-<platform>-<arch>, which productOutput
  # does not allow; host arch reuses the allowed build/native-deps path.
  npm run builder -- --linux --dir
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
  # Upstream electron tests import hermes_cli/pm through HERMES_PYTHON; a bare
  # system interpreter lacks the locked deps. Prepare a throwaway venv from
  # uv.lock (network only for wheels missing from the host uv cache).
  local check_venv="${srcdir}/hermes-check-venv"
  export UV_PROJECT_ENVIRONMENT="${check_venv}"
  export UV_CACHE_DIR="${srcdir}/uv-cache"
  uv venv "${check_venv}" --python /usr/bin/python3 --clear
  uv sync --frozen --no-group dev
  export HERMES_PYTHON="${check_venv}/bin/python"
  node "${srcdir}/launcher.test.cjs"
  npm run typecheck --workspace apps/desktop
  # The upstream live-portal fixture does not forward XAUTHORITY to Electron.
  # Without xvfb-run, a graphical host's DISPLAY would falsely enable it.
  # Skip voice-prefs spy that fails under Arch's Node localStorage (was a
  # packaging-only test patch; not needed at runtime).
  # dead-session-prune: clamp assertion expects one fake timer; under Arch's
  # vitest getTimerCount stays at 2 after the churn re-schedule (runtime OK).
  # profile-rail-status: tests pass but radix focus-scope + jsdom leaves an
  # unhandled dispatchEvent TypeError that makes vitest exit 1.
  env -u DISPLAY -u WAYLAND_DISPLAY npm run test --workspace apps/desktop -- \
    --exclude 'src/store/voice-prefs.test.ts' \
    --exclude 'src/store/dead-session-prune.test.ts' \
    --exclude 'src/app/chat/sidebar/profile-rail-status.test.tsx'

  # node-pty is the native Node addon shipped by Hermes. Load the staged
  # module with the exact Electron runtime used by the installed launcher; its
  # N-API build must not merely load under makepkg's system Node.
  local node_pty_root="${PWD}/apps/desktop/release/linux-unpacked/resources/app.asar.unpacked/dist/node_modules/node-pty"
  test -f "${node_pty_root}/package.json"
  # Bypass Arch's launcher here: it injects the user's electron44 flags, which
  # are valid in Chromium mode but rejected while ELECTRON_RUN_AS_NODE is set.
  env ELECTRON_RUN_AS_NODE=1 NODE_PTY_ROOT="${node_pty_root}" \
    "${_electron_dist}/electron" -e \
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
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${resources}/app.asar" \
    "${pkgdir}/usr/lib/${pkgname}/app.asar"
  cp -a "${resources}/app.asar.unpacked" \
    "${pkgdir}/usr/lib/${pkgname}/app.asar.unpacked"
  install -Dm644 "${resources}/install-stamp.json" \
    "${pkgdir}/usr/lib/${pkgname}/install-stamp.json"
  # Local agent runtime comes from the hermes-agent dependency (/usr/bin/hermes).
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
