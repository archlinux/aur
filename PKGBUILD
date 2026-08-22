# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin launcher name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.8.19
_commit=fcbd1076a93841fa88855acce810e342a5b78101
_electron_ver=40.10.2
pkgver=0.20.5
pkgrel=3
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3'
  'curl' 'git' 'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
  'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
  'util-linux-libs' 'xdg-utils'
)
optdepends=(
  'libayatana-appindicator: tray indicator support'
)
makedepends=('nodejs>=22.22' 'npm' 'python')
conflicts=('hermes-agent-desktop-bin')
options=('!debug')
source=(
  "hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz"
  "electron-v${_electron_ver}-linux-x64.zip::https://github.com/electron/electron/releases/download/v${_electron_ver}/electron-v${_electron_ver}-linux-x64.zip"
)
noextract=("electron-v${_electron_ver}-linux-x64.zip")
sha256sums=(
  '8e7f7d2aa6be48ae8b5550325be44aef339413ceec6ed74c18287001103de8fd'
  '0246201400600ac089c51a36f15a8045b5db723ba42b864f732a9b4e48731e97'
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
  # The release identifies Hermes Agent as 0.20.5, but
  # apps/desktop/package.json is not bumped — it still says 0.17.0. Patch
  # it here so pkgver matches the release.
  npm pkg set version=${pkgver} --prefix apps/desktop
  # The source archive has no .git directory. Pin the peeled release commit
  # locally so the bundled install stamp is reproducible and does not require
  # another network lookup during prepare()/build().
  export GITHUB_SHA="${_commit}" GITHUB_REF_NAME="${_pkgver_tag}"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  npm ci --prefer-offline --no-audit --ignore-scripts

  # electron's npm postinstall normally downloads the runtime outside
  # makepkg's source verification. Populate its dist directory from the
  # explicitly declared, checksummed Electron release archive instead.
  local electron_dir='apps/desktop/node_modules/electron'
  rm -rf "${electron_dir}/dist"
  install -dm755 "${electron_dir}/dist"
  bsdtar -xf "${srcdir}/electron-v${_electron_ver}-linux-x64.zip" \
    -C "${electron_dir}/dist"
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
  # electron-builder's FPM target (.deb/.rpm) requires a `homepage` in
  # package.json's `build` section. Upstream omits it because they ship
  # via the website installer rather than FPM. Inject it here so the
  # .deb target produces output. `npm pkg set` is built into npm 7+ and
  # patches the file in place.
  npm pkg set homepage='https://hermes-agent.nousresearch.com/'
  # Build only the `dir` target (unpacked directory) — skipping the
  # .deb/.rpm/AppImage targets. The FPM binary that ships with
  # electron-builder is a precompiled Ruby that links against the
  # legacy glibc libcrypt.so.1, which modern Arch/CachyOS does not
  # ship (the system has libcrypt.so.2 from libxcrypt instead). The
  # unpacked directory contains exactly the same application bundle as the
  # .deb target, so we can install it directly under /usr/lib without any
  # functional difference. This trades one extra build dep
  # (libxcrypt-compat) for one fewer target, and produces a cleaner
  # build that doesn't depend on FPM/Ruby at all.
  # We invoke the build+builder scripts directly (rather than `npm run
  # dist:linux`) so we can override the hardcoded `--linux AppImage deb
  # rpm` in upstream's dist:linux script with `--linux dir`.
  npm run build

  # Upstream writes the wall clock into the bundled install stamp. Normalize it
  # to makepkg's reproducible-build epoch before electron-builder consumes it.
  local build_time
  build_time="$(date -u -d "@${SOURCE_DATE_EPOCH}" '+%Y-%m-%dT%H:%M:%S.000Z')"
  sed -i -E \
    "s|(\"builtAt\": \")[^\"]+(\")|\1${build_time}\2|" \
    build/install-stamp.json
  grep -Fq "\"builtAt\": \"${build_time}\"" build/install-stamp.json

  npm run builder -- --linux dir
}

check() {
  cd "$(_extract_dir)"
  _set_npm_env
  export npm_config_offline=true
  npm run typecheck --workspace apps/desktop
  npm run test --workspace apps/desktop
}

package() {
  cd "$(_extract_dir)"
  local appdir="apps/desktop/release/linux-unpacked"
  if [ ! -d "${appdir}" ]; then
    printf 'ERROR: electron-builder did not produce %s\n' "${appdir}"
    ls -la apps/desktop/release/ 2>/dev/null || true
    return 1
  fi
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -a "${appdir}/." "${pkgdir}/usr/lib/${pkgname}/"
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/${_upstream}"
  # Chromium refuses to start with its sandbox enabled unless the helper is
  # root-owned and setuid. Files under pkgdir are already owned by root when
  # packaged; preserve the required mode explicitly because cp -a only keeps
  # the upstream release directory's ordinary 0755 mode.
  chmod 4755 "${pkgdir}/usr/lib/${pkgname}/chrome-sandbox"
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

exec /usr/lib/hermes-agent-desktop/Hermes "${flags[@]}" "$@"
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
