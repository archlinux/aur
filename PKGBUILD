# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.9.24
_commit=f97608f178d1ffeca59860195ab7da295f7c8e5f
pkgver=0.21.5
pkgrel=1
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'curl' 'electron42' 'git' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libx11' 'libxi'
  'nodejs>=22.22' 'npm' 'uv' 'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: tray indicator support'
  'google-chrome: local browser automation (or chromium)'
  'chromium: local browser automation (or google-chrome)'
  'ffmpeg: audio and video processing'
  'ripgrep: fast file content search'
)
makedepends=('python')
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  'system-electron-resources.patch'
  'pin-packaged-runtime.patch'
  'fix-voice-prefs-storage-spy.patch'
  'system-browser.patch'
  'packaged-bootstrap.patch'
  'runtime-policy.patch'
  'harden-hud-modifier-monitor.patch'
  'hermes-desktop'
  'launcher.test.cjs'
  'runtime.test.cjs'
  'runtime-policy.test.py'
)
sha256sums=('15b15ce4e6ec8ea424a081823709d1e17f0943e7b42b59597d24ebb94cbd1742'
            'ee465a1aa2ad5789fa5c7b3a89993bbf0e68efddbf27c93109519b72a4cb90f7'
            '0d4263cdf9266f1abedc7543e44b9062e152634c1a490a1efff2345043740d53'
            '047d6e615017b2bb8584383234cdfb3169694e25c10221d7a78da864884b1481'
            'fa8933a96e58575e7d4f876a7eb380d6c1723233832b787a46fb158f79df7718'
            'ab2b14399696da255d62237f01c061ed25bf2d7d12870b78185c906edbdb0ec2'
            '252858c8127398ce631a0ea94b9899e228bda736796aee1914337b9828faad07'
            '1602743519aa74866979707665a8641df20d966c6197b7a5d028b62860b528cb'
            '700eaf971f8aeedf0268cd85954235d1770b786b19ca7e9d7905bf17aed86d44'
            'dcb84ac7c5f5a7168d089ba082a8c8c77cf3955abc79775f530aee870a30d5df'
            '1a39719fd6b6ac2e773e6f72bd55ef313469734cf72dbe1f9adf7bff0979c873'
            '79b361c4cdd363ef8a2fdd1d6f8fab2a0116f10ab3ab63e527c87c0e3f36f8f7')

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
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/system-electron-resources.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/pin-packaged-runtime.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/fix-voice-prefs-storage-spy.patch"
  patch --batch --fuzz=0 -Np1 -i "${srcdir}/system-browser.patch"
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

  # Use Arch's Electron distribution; package() retains only app resources.
  npm run builder -- --linux dir \
    -c.electronVersion="${electron_version}"
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
  node "${srcdir}/launcher.test.cjs"
  node "${srcdir}/runtime.test.cjs" "$PWD/scripts/install.sh" "$PWD"
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
  # Bootstrap uses the reviewed installer and patch from this exact package,
  # not an unpatched installer downloaded separately from GitHub.
  install -Dm644 scripts/install.sh "${pkgdir}/usr/lib/${pkgname}/runtime/install.sh"
  install -Dm644 "${srcdir}/runtime-policy.patch" \
    "${pkgdir}/usr/lib/${pkgname}/runtime/runtime-policy.patch"
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
