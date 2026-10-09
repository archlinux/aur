# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v0.21.6
_commit=818c13be1dc4fd28987e1e881a9408224afd4535
pkgver=0.21.6
pkgrel=2
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'curl' 'electron42' 'git' 'hicolor-icon-theme' 'hermes-agent' 'libnotify' 'libsecret'
  'libx11' 'libxi' 'nodejs>=22.22' 'npm' 'python>=3.14' 'uv' 'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: tray indicator support'
  'google-chrome: local browser automation (or chromium)'
  'chromium: local browser automation (or google-chrome)'
  'ffmpeg: audio and video processing'
  'ripgrep: fast file content search'
)
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'pin-packaged-runtime.patch'
  'fix-voice-prefs-storage-spy.patch'
  'packaged-bootstrap.patch'
  'runtime-policy.patch'
  'harden-hud-modifier-monitor.patch'
  'hermes-desktop'
  'launcher.test.cjs'
  'runtime-policy.test.py'
)
sha256sums=('1ba3500cdbe876bb9d347b3c12f41c591a421293eac58faba23571287dfe1cf8'
            '9556b266dbd34bfd9e7620cabb8c032a293a41f3fc36c089804f3cea0208696e'
            '047d6e615017b2bb8584383234cdfb3169694e25c10221d7a78da864884b1481'
            '5dfb78ff90b1a96ed16127e053743817bcad4ebd7a1f785808590aad5a8ee4eb'
            '308fcfeea8385b3f192f1958bb83428f862cf3080a87ae1c3d020df27abb5fb4'
            'cf8b625b00e606b5b135bf5a38a851d8a699c819139e6720eecfa043ba886e9b'
            '8a677666d7d20578a88a745d83b4a75412a55fd5c184fd4f66a50dfe66adb3c6'
            '202e474fda5fd845f1ba334e503e751f746fb7d1f378fb0d3e8142b4795a025b'
            'cfe7eaf68db1aeb5570f12f7f03c4547ed5c754680be8faa47f112303e0db7d5')

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
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/pin-packaged-runtime.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/fix-voice-prefs-storage-spy.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/packaged-bootstrap.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/runtime-policy.patch"
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
  # Arch's versioned runtime instead of downloading a second copy.
  local electron_dir='apps/desktop/node_modules/electron'
  rm -rf "${electron_dir}/dist"
  ln -s /usr/lib/electron42 "${electron_dir}/dist"
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
  # Arch's electron42.
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
  python -B "${srcdir}/runtime-policy.test.py" "$PWD"
  npm run typecheck --workspace apps/desktop
  # The upstream live-portal fixture does not forward XAUTHORITY to Electron.
  # Without xvfb-run, a graphical host's DISPLAY would falsely enable it.
  env -u DISPLAY -u WAYLAND_DISPLAY npm run test --workspace apps/desktop

  # node-pty is the native Node addon shipped by Hermes. Load the staged
  # module with the exact Electron runtime used by the installed launcher; its
  # N-API build must not merely load under makepkg's system Node.
  local node_pty_root="${PWD}/apps/desktop/release/linux-unpacked/resources/app.asar.unpacked/dist/node_modules/node-pty"
  test -f "${node_pty_root}/package.json"
  # Bypass Arch's launcher here: it injects the user's electron42 flags, which
  # are valid in Chromium mode but rejected while ELECTRON_RUN_AS_NODE is set.
  env ELECTRON_RUN_AS_NODE=1 NODE_PTY_ROOT="${node_pty_root}" \
    /usr/lib/electron42/electron -e \
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
