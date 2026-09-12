# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.9.11
_commit=939e45c91d751fadd94dcd1b873ac3cb44846213
pkgver=0.21.2
pkgrel=1
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'curl' 'electron42' 'git' 'hicolor-icon-theme' 'libnotify' 'libsecret'
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
  'hermes-desktop'
  'launcher.test.cjs'
  'runtime.test.cjs'
  'runtime-policy.test.py'
)
sha256sums=('bf45fc6c40ad770e30dfa7677ee6804a24be1a7eab768b283a0883c64662d76e'
            'ee465a1aa2ad5789fa5c7b3a89993bbf0e68efddbf27c93109519b72a4cb90f7'
            '5c185a979974f7a9a476b32e5e8ac21dfcd907ed7d0e671cfb294ecf17d021b0'
            '7f8500e475a13466ecba2bb74e73fbbcba8dcb70bcbf4e789faf7a8f27df0cac'
            'fa8933a96e58575e7d4f876a7eb380d6c1723233832b787a46fb158f79df7718'
            '2f5595c0c85cf95c1b7af75e8553dd75d349e8b4e7015075d38fab826cee9d76'
            '9fca70bad0c6db28e9499761a570e8bca83c9666e6bb8ec35401b8aef3424a8d'
            '700eaf971f8aeedf0268cd85954235d1770b786b19ca7e9d7905bf17aed86d44'
            'dcb84ac7c5f5a7168d089ba082a8c8c77cf3955abc79775f530aee870a30d5df'
            'a55499378bec44ae6a42e77dd7eed8e27dd604a7c6b5f87111444912092250a9'
            'ade15751253ed09ab2927733d02edaf6b8788ee7f14ff7d71d0982e0d3aa669c')

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
  patch -Np1 -i "${srcdir}/fix-voice-prefs-storage-spy.patch"
  patch -Np1 -i "${srcdir}/system-browser.patch"
  patch -Np1 -i "${srcdir}/packaged-bootstrap.patch"
  patch -Np1 -i "${srcdir}/runtime-policy.patch"
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
  node "${srcdir}/launcher.test.cjs"
  node "${srcdir}/runtime.test.cjs" "$PWD/scripts/install.sh" "$PWD"
  python -B "${srcdir}/runtime-policy.test.py" "$PWD"
  npm run typecheck --workspace apps/desktop
  npm run test --workspace apps/desktop

  # node-pty is the only native Node addon shipped by Hermes. Load the staged
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
