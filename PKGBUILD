# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.8.27
_commit=5fc308a70719a83cccdbba4c0e39c23f5a8239d5
pkgver=0.20.6
pkgrel=2
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'curl' 'electron42' 'git' 'hicolor-icon-theme' 'libnotify' 'libsecret'
  'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: tray indicator support'
)
makedepends=('nodejs>=22.22' 'npm' 'python')
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'system-electron-resources.patch'
  'pin-packaged-runtime.patch'
)
sha256sums=(
  'e622723b5bf3cd6c1db974d92d32242f1cb63f61c1112b6f708b34d619ef0fc7'
  'ee465a1aa2ad5789fa5c7b3a89993bbf0e68efddbf27c93109519b72a4cb90f7'
  'a071a452caf08b4b5d7cfb93289b82051a4fa696adda826deaa4281c592fad21'
)

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
  patch -Np1 -i "${srcdir}/system-electron-resources.patch"
  patch -Np1 -i "${srcdir}/pin-packaged-runtime.patch"
  # The release identifies Hermes Agent as ${pkgver}, but the desktop
  # package.json is not bumped — it still says 0.17.0. Patch it here so the
  # packaged desktop metadata matches the release.
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
  local electron_version
  electron_version="$(< /usr/lib/electron42/version)"
  # Keep upstream's package.json and lockfile pins intact for deterministic
  # npm ci. The builder CLI override below selects the system runtime without
  # pretending that the locked npm tooling package was resolved at a new pin.
  npm run build

  # Upstream writes the wall clock into the bundled install stamp. Normalize it
  # to makepkg's reproducible-build epoch before electron-builder consumes it.
  local build_time
  build_time="$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y-%m-%dT%H:%M:%S.000Z')"
  sed -i -E \
    "s|(\"builtAt\": \")[^\"]+(\")|\1${build_time}\2|" \
    build/install-stamp.json
  grep -Fq "\"builtAt\": \"${build_time}\"" build/install-stamp.json

  # Upstream's builder wrapper resolves node_modules/electron/dist and passes it
  # as electronDist. prepare() links that directory to Arch's Electron runtime.
  # package() keeps only the app resources, so electron42 remains their owner.
  npm run builder -- --linux dir \
    -c.electronVersion="${electron_version}"
}

check() {
  cd "$(_extract_dir)"
  _set_npm_env
  export npm_config_offline=true
  npm run typecheck --workspace apps/desktop
  npm run test --workspace apps/desktop

  # node-pty is the only native Node addon shipped by Hermes. Load the staged
  # module with the exact Electron runtime used by the installed launcher; its
  # N-API build must not merely load under makepkg's system Node.
  local node_pty_root="${PWD}/apps/desktop/release/linux-unpacked/resources/app.asar.unpacked/dist/node_modules/node-pty"
  test -f "${node_pty_root}/package.json"
  env ELECTRON_RUN_AS_NODE=1 NODE_PTY_ROOT="${node_pty_root}" \
    /usr/bin/electron42 -e \
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
  # One Electron/Chromium argument per line. Blank lines and full-line comments
  # are ignored; the file is data, never sourced or evaluated as shell code.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'EOF'
#!/bin/bash

flags_file="${XDG_CONFIG_HOME:-${HOME}/.config}/hermes-desktop-flags.conf"
declare -a flags=()

if [[ -r "${flags_file}" ]]; then
  while IFS= read -r flag || [[ -n "${flag}" ]]; do
    flag="${flag#"${flag%%[![:space:]]*}"}"
    flag="${flag%"${flag##*[![:space:]]}"}"
    [[ -z "${flag}" || "${flag}" == \#* ]] && continue
    flags+=("${flag}")
  done < "${flags_file}"
fi

export HERMES_DESKTOP_IS_PACKAGED=1
export HERMES_DESKTOP_RESOURCES_PATH=/usr/lib/hermes-agent-desktop
export HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME=1

exec /usr/bin/electron42 "${flags[@]}" \
  /usr/lib/hermes-agent-desktop/app.asar "$@"
EOF
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
