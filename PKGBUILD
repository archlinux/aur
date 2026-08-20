# Maintainer: nullptr <nullptr@null.ptr>
pkgname=hermes-agent-desktop
_pkgname=hermes-desktop          # /usr/bin symlink name (AUR convention, lowercase)
_upstream=Hermes                 # productName + executableName
_pkgver_tag=v2026.8.18
_commit=e624e9fde561e1add9388384012b295fde669ade
pkgver=0.20.4
pkgrel=1
pkgdesc="Official Hermes Agent desktop app from Nous Research — chat, voice, file browser, and settings UI for the local agent runtime."
arch=('x86_64')
url='https://github.com/NousResearch/hermes-agent'
license=('MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3'
  'hicolor-icon-theme' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
  'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs'
  'util-linux-libs' 'xdg-utils'
)
optdepends=(
  'git: bootstrap and self-update the Hermes Agent runtime on first launch'
  'libayatana-appindicator: tray indicator support'
  'python: run the Hermes Agent runtime locally'
  'uv: bootstrap the Hermes Agent runtime on first launch'
)
makedepends=('nodejs>=22.22' 'npm')
conflicts=('hermes-agent-desktop-bin')
options=('!strip' '!debug')
source=("hermes-agent-${_pkgver_tag}.tar.gz::${url}/archive/refs/tags/${_pkgver_tag}.tar.gz")
sha256sums=('1e3d39d3638ec15fa9d31af262568a953e9272090deb1c50c44cd401175f5b80')

# NOTE: ${srcdir} is empty at the top level of a PKGBUILD — makepkg only sets
# it inside the function scope of prepare()/build()/package(). Computing the
# extracted directory once at the top (as `_srcdir=...`) silently produces a
# root-prefixed path (`/hermes-agent-2026.7.1`) and `cd` fails. Define a helper
# and call it from each function instead.
_extract_dir() {
  echo "${srcdir}/hermes-agent-${_pkgver_tag#v}"
}

prepare() {
  cd "$(_extract_dir)"
  # The release identifies Hermes Agent as 0.20.4, but
  # apps/desktop/package.json is not bumped — it still says 0.17.0. Patch
  # it here so pkgver matches the release.
  npm pkg set version=${pkgver} --prefix apps/desktop
  # The source archive has no .git directory. Pin the peeled release commit
  # locally so the bundled install stamp is reproducible and does not require
  # another network lookup during prepare()/build().
  export GITHUB_SHA="${_commit}" GITHUB_REF_NAME="${_pkgver_tag}"
  npm ci --prefer-offline --no-audit --ignore-scripts
  # Node-pty's prebuilt binary is downloaded by its install.js script via
  # prebuild-install.  --ignore-scripts above skips it entirely, leaving
  # the staged package with JS source but no .node binary — PTY fails at
  # runtime.  Rebuild just node-pty to trigger the prebuilt download.
  npm rebuild node-pty
}

build() {
  cd "$(_extract_dir)/apps/desktop"
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
  # unpacked directory contains exactly the same files that would land
  # in /opt/Hermes/ via the .deb, so we can install them directly with
  # no functional difference. This trades one extra build dep
  # (libxcrypt-compat) for one fewer target, and produces a cleaner
  # build that doesn't depend on FPM/Ruby at all.
  # We invoke the build+builder scripts directly (rather than `npm run
  # dist:linux`) so we can override the hardcoded `--linux AppImage deb
  # rpm` in upstream's dist:linux script with `--linux dir`.
  npm run build
  npm run builder -- --linux dir
}

check() {
  cd "$(_extract_dir)"
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
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a "${appdir}/." "${pkgdir}/opt/${pkgname}/"
  chmod 755 "${pkgdir}/opt/${pkgname}/${_upstream}"
  # Chromium refuses to start with its sandbox enabled unless the helper is
  # root-owned and setuid. Files under pkgdir are already owned by root when
  # packaged; preserve the required mode explicitly because cp -a only keeps
  # the upstream release directory's ordinary 0755 mode.
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_upstream}" "${pkgdir}/usr/bin/${_pkgname}"
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
