# Maintainer: Omer Elbushra <omaralbushra99@gmail.com>

pkgname=agenthub-git
_pkgname=agenthub
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Multi-agent conversation hub with an Electron desktop shell and bundled Next.js backend'
arch=('x86_64')
url='https://github.com/Albaloola/AgentHub'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'gtk3'
  'libdrm'
  'libxkbcommon'
  'libnotify'
  'libsecret'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=(
  'git'
  'nodejs>=20'
  'npm'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!strip' '!debug')
source=(
  "${_pkgname}::git+${url}.git"
  'agenthub.sh'
  'agenthub.desktop'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Prefer the package.json version, suffixed with git rev count + short hash.
  local base
  base="$(node -p "require('./package.json').version" 2>/dev/null || echo 0.0.0)"
  printf '%s.r%s.g%s' \
    "${base}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # Avoid every optional downstream postinstall that fetches headless
  # browsers, native binaries we don't need at build time, or analytics.
  export CYPRESS_INSTALL_BINARY=0
  export PUPPETEER_SKIP_DOWNLOAD=1
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export ADBLOCK=1
  export npm_config_fund=false
  export npm_config_audit=false
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CYPRESS_INSTALL_BINARY=0
  export PUPPETEER_SKIP_DOWNLOAD=1
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export ELECTRON_SKIP_BINARY_DOWNLOAD=0
  export npm_config_fund=false
  export npm_config_audit=false

  # The repository ships package-lock.json; use npm ci for reproducibility
  # but fall back to install if lockfile and manifest have drifted.
  npm ci --no-audit --no-fund --ignore-scripts || \
    npm install --no-audit --no-fund --ignore-scripts

  # postinstall is skipped above (--ignore-scripts) so run the electron-rebuild
  # step explicitly to produce better-sqlite3 against Electron's ABI.
  npx --yes @electron/rebuild -w better-sqlite3 || true

  npm run desktop:build

  # Pack into a Linux unpacked directory (no AppImage — we install the
  # unpacked tree directly into /opt/agenthub).
  npx --yes electron-builder --linux --dir
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install Electron runtime + packaged app resources into /opt/agenthub
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a release/linux-unpacked/. "${pkgdir}/opt/${_pkgname}/"

  # Launcher wrapper in $PATH
  install -Dm755 "${srcdir}/agenthub.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop entry
  install -Dm644 "${srcdir}/agenthub.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Scalable icon (uses the app's own globe.svg — replace with a custom
  # PNG/ICO when the project ships proper branding assets).
  install -Dm644 public/globe.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"

  # License: reproduce Apache 2.0 pointer inline. Upstream ships the
  # license text only in README.md at the moment; update once a LICENSE
  # file lands in the repo.
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
AgentHub is distributed under the Apache License, Version 2.0.
The full text is available at https://www.apache.org/licenses/LICENSE-2.0
and is referenced in the upstream README.md.
EOF

  # Electron's chrome-sandbox wants setuid root on Linux to isolate
  # renderer processes. Without this Electron refuses to start unless
  # --no-sandbox is passed. pacman preserves mode bits from the staging
  # directory, so set them here.
  if [[ -f "${pkgdir}/opt/${_pkgname}/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
  fi
}
